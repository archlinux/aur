# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=python-simple_parsing
pkgver=0.1.5
pkgrel=1
pkgdesc="Simple, Elegant, Typed Argument Parsing with argparse"
arch=('any')
url="https://github.com/lebrice/SimpleParsing"
license=('MIT')
depends=(
	'python'
	'python-pyyaml'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lebrice/SimpleParsing/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a230d1b31d16856b248f9a9eb77bf1441a6b9f7e93d06e088f4c35cfe3532e76')

package() {
    cd "SimpleParsing-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
