# Maintainer: Mario O.M. <marioortizmanero@gmail.com>
pkgname=python-tekore
pkgver=1.6.0
pkgrel=1
pkgdesc="Client for the Spotify Web API"
arch=("any")
url="https://github.com/felix-hilden/tekore"
license=("custom:MIT")
depends=("python>=3.7" "python-requests>=2.19" "python-httpx>=0.11")
makedepends=("python-setuptools")
source=("https://github.com/felix-hilden/tekore/archive/v$pkgver.tar.gz")
md5sums=('7aa7b5879994c432fe467ef66bd53cb9')

prepare() {
    cd "tekore-$pkgver"
}

build() {
    cd "tekore-$pkgver"
    python setup.py build
}

package() {
    cd "tekore-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
