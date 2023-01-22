# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Ines Montani <contact@explosion.ai>
pkgname=python-ml-datasets
_origpkgname=ml-datasets
pkgver=0.2.0
pkgrel=1
pkgdesc="Machine learning dataset loaders for testing and example scripts"
arch=("x86_64")
url="https://github.com/explosion/ml-datasets"
license=("MIT")
depends=(
	"python-numpy"
	"python-scipy"
	"python-tqdm"
	"python-srsly"
	"python-catalogue"
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/ml-datasets/archive/v$pkgver.tar.gz")
md5sums=('e4c89cc0788468f9a3da2f4ac3eef3f1')

package() {
    cd "$_origpkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
