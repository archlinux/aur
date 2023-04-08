# Maintainer: goetzc
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=python-spotipy
pkgver=2.23.0
pkgrel=1
pkgdesc='A light weight Python library for the Spotify Web API'
arch=('any')
url='https://github.com/spotipy-dev/spotipy'
license=('MIT')
depends=('python-requests' 'python-six' 'python-redis')
makedepends=('python-setuptools')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/spotipy-dev/spotipy/archive/$pkgver.tar.gz")

build() {
    cd "spotipy-$pkgver"
    python setup.py build
}

package() {
    cd "spotipy-$pkgver"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}

sha256sums=('7d0b28eef68a7829bf78a3ace96d6eabc66943d8355328e15a1a0769ec15f202')
