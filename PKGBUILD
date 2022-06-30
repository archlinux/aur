# Maintainer: goetzc
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_pkgname=spotipy
pkgname=python-spotipy
pkgver=2.20.0
pkgrel=2
pkgdesc='A light weight Python library for the Spotify Web API'
arch=('any')
url='https://github.com/plamere/spotipy'
license=('MIT')
depends=('python-requests' 'python-six' 'python-redis')
makedepends=('python-setuptools')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/plamere/spotipy/archive/$pkgver.tar.gz")
sha512sums=('8b5d0704fa84974ea0728dda0fe89d021b7b1550b464026d2b087671102745c7edcab116246399dd97de42d9c0cc7411295297c328b301712b6536aa6a3cd6fd')

build() {
    cd spotipy-$pkgver
    python setup.py build
}

package() {
    cd spotipy-$pkgver
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}

