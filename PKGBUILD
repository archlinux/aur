# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=gnome-shell-extension-impatience-git
_pkgname=gnome-shell-impatience
pkgver=r27.d639876
pkgrel=1
pkgdesc="speed up gnome-shell animations"
arch=('any')
url="https://github.com/gfxmonk/gnome-shell-impatience"
license=('GPL3')
depends=('gnome-shell<3.21')
makedepends=('git')
install='gschemas.install'
source=("git+https://github.com/gfxmonk/gnome-shell-impatience")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname/impatience"

  for i in $(find -type f)
    do
        install -Dm 644 $i $pkgdir/usr/share/gnome-shell/extensions/impatience@gfxmonk.net/$i
    done
}
