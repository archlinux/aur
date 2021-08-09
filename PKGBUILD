# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=plex-remote
pkgver=1.0.2
pkgrel=1
pkgdesc="A library for easy implementing a remote plex client"
arch=('any')
url="https://github.com/tijder/plex-remote"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('SKIP') #autofill using updpkgsums

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}