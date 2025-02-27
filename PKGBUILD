# Maintainer: goetzc
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=python-spotipy
pkgver=2.25.1
pkgrel=1
pkgdesc='A light weight Python library for the Spotify Web API'
arch=('any')
url='https://github.com/spotipy-dev/spotipy'
license=('MIT')
depends=('python-requests' 'python-six' 'python-redis')
makedepends=('python-setuptools')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/spotipy-dev/spotipy/archive/$pkgver.tar.gz")
sha512sums=('1c9af1f8a07d111a719d4f9646ccc8fea21d86325221c0395fdfe155a1ed2b588dfcf5c9e958bf3ecc286033117f7cc3061f975a046788e11a1cea4f9e2a927a')

build() {
    cd "spotipy-$pkgver"
    python setup.py build
}

package() {
    cd "spotipy-$pkgver"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
