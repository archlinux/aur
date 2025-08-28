pkgbase='python-cbmc-viewer'
pkgname=('python-cbmc-viewer')
_module='cbmc-viewer'
_src_folder='cbmc-viewer-3.8'
pkgver='3.8'
pkgrel=1
pkgdesc="CBMC viewer produces a browsable summary of CBMC findings"
url="https://github.com/model-checking/cbmc-viewer"
depends=('python' 'python-voluptuous')
makedepends=('python-setuptools')
license=('custom:Apache Software License')
arch=('any')
source=("https://files.pythonhosted.org/packages/15/7e/a2b3cad94db94cf8a2810f4af3258085282eb255b9b28c7413b9e8e81e12/cbmc-viewer-3.8.tar.gz")
sha256sums=('2452f4eb3ee52566714c02e8bc3055c0d2567a758f51057d274a99cf7124ea02')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="$pkgdir" dist/cbmc_viewer-$pkgver-py3-none-any.whl
}
