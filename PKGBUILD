pkgbase='python-cbmc-starter-kit'
pkgname=('python-cbmc-starter-kit')
_module='cbmc-starter-kit'
_src_folder='cbmc-starter-kit-2.10'
pkgver='2.10'
pkgrel=1
pkgdesc="CBMC starter kit makes it easy to add CBMC verification to a software project"
url="https://github.com/model-checking/cbmc-starter-kit"
depends=('python')
makedepends=('python-setuptools')
license=('custom:Apache Software License')
arch=('any')
source=("https://files.pythonhosted.org/packages/15/e1/2b0714b33baa5dc2221cf428f58aaddef8e308dd9d41d74145a0d3f1d8e2/cbmc-starter-kit-2.10.tar.gz")
sha256sums=('65b36edd6a269d1fde34fc7643e69d52a462dd878a265d8aa43662c97f5299ee')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    ls
    python -m installer --destdir="$pkgdir" dist/cbmc_starter_kit-$pkgver-py3-none-any.whl
}
