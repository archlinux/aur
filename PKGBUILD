# Maintainer: Goncalo Pereira <goncalo_pereira@outlook.pt>
pkgname=python-kintree
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc="Fast part creation in KiCad and InvenTree"
url="https://github.com/sparkmicro/Ki-nTree"
depends=(
    'python'
    'python-digikey-api'
    'python-flet'
    'python-thefuzz'
    'python-inventree'
    'python-kiutils'
    'python-mouser'
    'python-multiprocess'
    'python-pyaml'
    'python-validators'
    'python-wrapt-timeout-decorator'
)
makedepends=(python-build python-installer python-wheel)
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a80846d8f9a9938f69ee11da854fa8ae75898d8163a9aada8dad52fd9811c5a2')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}