# Maintainer: Mario O.M. <marioortizmanero@gmail.com>
pkgname=python-tekore
pkgver=1.3.0
pkgrel=1
pkgdesc="Client for the Spotify Web API"
arch=("any")
url="https://github.com/felix-hilden/tekore"
license=("custom:MIT")
depends=("python>=3.7" "python-requests>=2.19" "python-httpx")
makedepends=("python-setuptools")
source=("https://github.com/felix-hilden/tekore/archive/v$pkgver.tar.gz")
md5sums=('25b6b49edd634e882f9344590682ae30')

build() {
    cd "tekore-$pkgver"
    python setup.py build
}

package() {
    cd "tekore-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
