# Maintainer: goetzc
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=python-spotipy
pkgver=2.25.2
pkgrel=1
pkgdesc='A light weight Python library for the Spotify Web API'
arch=('any')
url='https://github.com/spotipy-dev/spotipy'
license=('MIT')
depends=('python-requests' 'python-six' 'python-redis')
makedepends=('python-setuptools')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/spotipy-dev/spotipy/archive/$pkgver.tar.gz")
sha512sums=('1cdb607e9da6edf7d90778665cfd1fe22732336f4844a64799772963a017afbac6c033fdf7f918cb995528345756a1049aa865d85e3990e768d3f6e15ff52538')

build() {
    cd "spotipy-$pkgver"
    python setup.py build
}

package() {
    cd "spotipy-$pkgver"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
