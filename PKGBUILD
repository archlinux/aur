# Maintainer: goetzc
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_pkgname=spotipy
pkgname=python-spotipy
pkgver=2.22.0
pkgrel=1
pkgdesc='A light weight Python library for the Spotify Web API'
arch=('any')
url='https://github.com/plamere/spotipy'
license=('MIT')
depends=('python-requests' 'python-six' 'python-redis')
makedepends=('python-setuptools')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/plamere/spotipy/archive/$pkgver.tar.gz")
sha512sums=('272f05b1cb92dbd9842dcac58a5ca322fae703eea58488b968812c12b6c26fb748aabbf5fde7100e9662191231fe12f5353b9ba12f02bd2e4982e0aff1c732f6')

build() {
    cd spotipy-$pkgver
    python setup.py build
}

package() {
    cd spotipy-$pkgver
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
