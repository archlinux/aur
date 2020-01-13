# Maintainer: Mario O.M. <marioortizmanero@gmail.com>
pkgname=python-tekore
pkgver=0.1.0
pkgrel=1
pkgdesc="Client for the Spotify Web API"
arch=("any")
url="https://github.com/felix-hilden/tekore"
license=("custom:MIT")
depends=("python>=3.7" "python-requests>=2.19")
makedepends=("python-setuptools")
source=("https://github.com/felix-hilden/tekore/archive/v$pkgver.tar.gz")
md5sums=('84f596c88f2a1f550b3e32ded739be89')

build() {
    cd "tekore-$pkgver"
    python setup.py build
}

package() {
    cd "tekore-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
