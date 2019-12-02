pkgname=gnome-shell-extension-paperwm-git
_pkgname=PaperWM
pkgver=r1448.13729b7
pkgrel=1
pkgdesc="A gnome shell extension providing scrollable tiling of windows and per monitor workspaces."
arch=('any')
url="https://github.com/paperwm/PaperWM"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=("git+https://github.com/paperwm/PaperWM")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
  for i in $(find -type f)
    do
        install -Dm 644 $i $pkgdir/usr/share/gnome-shell/extensions/paperwm@hedning:matrix.org/$i
    done
}
