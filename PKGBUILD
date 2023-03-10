pkgbase='python-lpips'
pkgname=('python-lpips')
_module='lpips'
pkgver='0.1.4'
pkgrel=1
pkgdesc="LPIPS Similarity metric"
url="https://github.com/richzhang/PerceptualSimilarity"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('3846331df6c69688aec3d300a5eeef6c529435bc8460bd58201c3d62e56188fa')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
