pkgbase='python-remotior-sensus'
pkgname=('python-remotior-sensus')
_pkgname=('remotior-sensus')
_module='remotior-sensus'
_src_folder='remotior_sensus-0.3.5'
pkgver='0.3.5'
pkgrel=1
pkgdesc="Remotior Sensus is software to process remote sensing and GIS data"
url="https://github.com/semiautomaticgit/remotior_sensus"
depends=('python' 'python-numpy' 'python-scipy' 'gdal')
optdepends=('python-scikit-learn' 'python-pytorch')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('custom:GNU General Public License v3 or later (GPLv3+)')
arch=('any')
source=("https://files.pythonhosted.org/packages/56/91/8e3a86469da0344cb55829f4632df62b38598991101fcc576c5b9da1bb5a/remotior_sensus-0.3.5.tar.gz")
sha256sums=('c822d83eed31aafa57a8af80af54f4f44c35dbe86726493a8287f5637033be10')

build() {
    cd "$srcdir/$_src_folder"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_src_folder"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
