# Maintainer: Mario O.M. <marioortizmanero@gmail.com>
pkgname=python-tekore
pkgver=1.1.0
pkgrel=1
pkgdesc="Client for the Spotify Web API"
arch=("any")
url="https://github.com/felix-hilden/tekore"
license=("custom:MIT")
depends=("python>=3.7" "python-requests>=2.19" "python-httpx")
makedepends=("python-setuptools")
source=("https://github.com/felix-hilden/tekore/archive/v$pkgver.tar.gz")
md5sums=('ff67327e9c6b7a2937f22088fba351c7')

build() {
    cd "tekore-$pkgver"
    python setup.py build
}

package() {
    cd "tekore-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
