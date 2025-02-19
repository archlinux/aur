pkgbase='python-remotior-sensus-0.4.4'
pkgname=('python-remotior-sensus-0.4.4')
_name=${pkgname#python-}
pkgver='0.4.4'
pkgrel=1
pkgdesc="Remotior Sensus is software to process remote sensing and GIS data"
url="https://github.com/semiautomaticgit/remotior_sensus"
depends=('python>=3.8' 'python-numpy' 'python-scipy' 'gdal')
optdepends=('python-matplotlib' 'python-scikit-learn' 'python-pytorch')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
conflicts=('python-remotior-sensus')
license=('custom:GNU General Public License v3 or later (GPLv3+)')
arch=('any')
source=("https://files.pythonhosted.org/packages/27/91/de9d48ef835e9770c50e6317cff7448352a810bc1d9c62db401a69123a31/remotior_sensus-0.4.4.tar.gz")
sha256sums=('53a1606513511a2f28e814ac9340c0971b03282255c8e9b53f600206c5f0d2ea')
build() {
    cd remotior_sensus-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd remotior_sensus-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
