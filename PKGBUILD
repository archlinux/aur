# Maintainer: goetzc
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=python-spotipy
pkgver=2.25.0
pkgrel=1
pkgdesc='A light weight Python library for the Spotify Web API'
arch=('any')
url='https://github.com/spotipy-dev/spotipy'
license=('MIT')
depends=('python-requests' 'python-six' 'python-redis')
makedepends=('python-setuptools')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/spotipy-dev/spotipy/archive/$pkgver.tar.gz")
sha512sums=('2406eb445976f6cf54ce78a92739c18453415bbf330c40f255c2ab8a4734874051d38c329b044659723da7843bc06600ffa656c9d679a984390bf16a75e2fa72')

build() {
    cd "spotipy-$pkgver"
    python setup.py build
}

package() {
    cd "spotipy-$pkgver"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
