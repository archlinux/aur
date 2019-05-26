# Maintainer: Shane Donohoe <shane@donohoe.cc>

pkgname=python-fzf-template
pkgver=0.1.0
pkgrel=2
pkgdesc="Template files using yaml config and an fzf selector"
arch=('any')
url="https://github.com/shanedabes/fzf-template"
license=('BSD')
depends=('python' 'python-iterfzf')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shanedabes/fzf-template/archive/v${pkgver}.tar.gz")
sha256sums=('49039934db0c47d14c558ece01c0281f78ba68502b7b0c28a9076eebb3bcedba')

package() {
    cd "fzf-template-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
