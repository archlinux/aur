# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=gnome-shell-extension-system-monitor-git
_pkgname=gnome-shell-system-monitor-applet
pkgver=r704.8b31f07
pkgrel=1
pkgdesc="speed up gnome-shell animations"
arch=('any')
url="https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet"
license=('GPL3')
depends=('gnome-shell<3.21')
makedepends=('git')
install='gschemas.install'
source=("git+https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  for i in $(find -type f)
    do
        install -Dm 644 $i $pkgdir/usr/share/gnome-shell/extensions/$i
  done
}
