# Maintainer: Ingo Bürk <ingo.buerk@airblader.de>
pkgname=colors-git
pkgver=r76.554aa12
pkgrel=1
pkgdesc='Extract colors from an image.'
arch=('i686' 'x86_64')
url='http://git.2f30.org/colors/'
license=('custom:ISC')
provides=('colors')
#depends=('')
makedepends=('git')
source=('git://git.2f30.org/colors#branch=master')
sha1sums=('SKIP')

_gitname='colors'

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    make all
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:ts=4:sw=4:expandtab
