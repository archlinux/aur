# Maintainer: Ingo Bürk <ingo.buerk@airblader.de>
pkgname=i3bang-git
pkgver=r23.ccbcdba
pkgrel=1
pkgdesc='A preprocessor for i3 config files aimed to drastically reduce their length'
arch=('i686' 'x86_64')
url='https://github.com/KeyboardFire/i3bang'
license=('MIT')
provides=('i3bang')
depends=('ruby')
makedepends=('git')
source=('git://github.com/KeyboardFire/i3bang#branch=master')
sha1sums=('SKIP')

_gitname='i3bang'

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_gitname"
    install -D i3bang.rb ${pkgdir}/usr/bin/i3bang
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:ts=4:sw=4:expandtab
