pkgbase='python-remotior-sensus'
pkgname=('python-remotior-sensus')
_name=${pkgname#python-}
pkgver='0.4.3'
pkgrel=1
pkgdesc="Remotior Sensus is software to process remote sensing and GIS data"
url="https://github.com/semiautomaticgit/remotior_sensus"
depends=('python>=3.8' 'python-numpy' 'python-scipy' 'gdal')
optdepends=('python-matplotlib' 'python-scikit-learn' 'python-pytorch')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('custom:GNU General Public License v3 or later (GPLv3+)')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('aa1e855c5316141c001a40eefee383a97117ae93532ba9a54efa86b9d50bd08d')

build() {
    cd ${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name//-/_}-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
