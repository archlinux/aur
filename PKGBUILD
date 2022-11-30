# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=console-tdm-git
pkgver=r2.1a7788c
pkgrel=2
epoch=1
pkgdesc='Console display manager based on CDM'
arch=('any')
url='http://github.com/dopsi/console-tdm'
license=('GPL')
provides=('console-tdm')
conflicts=('console-tdm')
depends=('xorg-xinit')
optdepends=('dialog: for curses UI')
source=('git+https://github.com/dopsi/console-tdm')
sha1sums=('SKIP')

_gitname=console-tdm

pkgver() {
    cd $_gitname
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:ts=4:sw=4:expandtab
