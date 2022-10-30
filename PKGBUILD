# Maintainer: goetzc
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_pkgname=spotipy
pkgname=python-spotipy
pkgver=2.21.0
pkgrel=1
pkgdesc='A light weight Python library for the Spotify Web API'
arch=('any')
url='https://github.com/plamere/spotipy'
license=('MIT')
depends=('python-requests' 'python-six' 'python-redis')
makedepends=('python-setuptools')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/plamere/spotipy/archive/$pkgver.tar.gz")
sha512sums=('8783261e43962b3e98cb9b680f908d38feecf784ff404352ba16d6bb3d2e4bf1d2308b60f1437c56402e1c2a993a5bba876103f968bb8bdd81be1aef1fe6d058')

build() {
    cd spotipy-$pkgver
    python setup.py build
}

package() {
    cd spotipy-$pkgver
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}

