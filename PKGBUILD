# Maintainer: goetzc
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Maintainer: Vyacheslav Konovalov <crabvk@protonmail.com>

_pkgname=spotipy
pkgname=python-spotipy
pkgver=2.19.0
pkgrel=1
pkgdesc='A light weight Python library for the Spotify Web API'
arch=('any')
url='https://github.com/plamere/spotipy'
license=('MIT')
depends=('python-requests' 'python-six')
makedepends=('python-setuptools')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/plamere/spotipy/archive/$pkgver.tar.gz")
sha512sums=('fbaecd1a2cab3ef458d30de46cb89462021dfc3cfc85516d8bfe509af016a0b19af2f8de4f5cae36188b1ce1f5718c75edff0e71af2a87f4d720ee99d4541a6a')

build() {
  cd spotipy-$pkgver
  python setup.py build
}

package() {
  cd spotipy-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
