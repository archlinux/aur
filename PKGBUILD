# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Ines Montani <contact@explosion.ai>
pkgname=python-ml-datasets
_origpkgname=ml-datasets
pkgver=0.1.6
# Note: this commit is tagged as a 0.1.6 release in pypy, but not marked as a release on github. If future versions are marked as proper releases in the repo, I won't use commit reference.
_commit="2ec21d174139c69350f80a2d4d8085ce6b49c90c"
pkgrel=1
pkgdesc="Machine learning dataset loaders for testing and example scripts"
arch=("x86_64")
url="https://github.com/explosion/ml-datasets"
license=("MIT")
depends=(
	"python-numpy"
	"python-tqdm"
	"python-srsly"
	"python-catalogue"
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/ml-datasets/archive/$_commit.tar.gz")
md5sums=('591540927cf7627bd6429423b99384c8')

package() {
    cd "$_origpkgname-$_commit"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
