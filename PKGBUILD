# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=python-simple_parsing
pkgver=0.1.4
pkgrel=1
pkgdesc="Simple, Elegant, Typed Argument Parsing with argparse"
arch=('any')
url="https://github.com/lebrice/SimpleParsing"
license=('BSD')
depends=(
	'python'
	'python-pyyaml'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lebrice/SimpleParsing/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e42eb4a4b94d97796301589042bf559ef8affa1677667b59dcfac7b4c75bfa70')

package() {
    cd "SimpleParsing-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
