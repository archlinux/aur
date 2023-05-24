# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=uoy-assessment-uploader
_name=uoy_assessment_uploader
pkgver=0.5.1
pkgrel=1
pkgdesc="Tool for automating submitting assessments to the University of York Computer Science department."
arch=('any')
url="https://github.com/joelsgp/uoy-assessment-uploader"
license=('GPL3')
depends=('python'
         'python-beautifulsoup4'
         'python-keyring'
         'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
optdepends=()
provides=('python-uoy-assessment-uploader')
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5c214f6c0248121412b7ef11bfba5a4c841dc56d38e29fe35fef266c6695feeb')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
