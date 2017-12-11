# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Louis des Landes <psyker7 at gmail dot com>

pkgname=libturpial
pkgver=1.7.0
pkgrel=1
pkgdesc="A library that handles multiple microblogging protocols."
arch=(any)
url=http://turpial.org.ve/
license=(GPL3)
depends=(python2-oauth python2-requests python2-simplejson)
makedepends=(git python2-setuptools)
conflicts=(${pkgname}-git)
source=(https://github.com/satanas/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('f104667920576248c663ebcad905bfc23172ce02d06e1b31181221ca97e80f79')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py build || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1 || return 1
    rm "$pkgdir"/usr/{AUTHORS,COPYING,ChangeLog}
}
