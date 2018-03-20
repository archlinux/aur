# Maintainer: Mathieu Clabaut <mathieu[at]clabaut.net>
pkgbase=('python-retdec-python')
pkgname=('python-retdec-python')
_module='retdec-python'
pkgver='0.5.2'
pkgrel=1
pkgdesc="A Python library and tools providing easy access to the retdec.com decompilation service through their public REST API."
url="https://github.com/s3rvac/retdec-python"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/retdec-python/retdec-python-${pkgver}.tar.gz")
md5sums=('d6b3c37bc26bd116896d4dc23c8a9432')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    # conflict with leptonica fileinfo
    mv ${pkgdir}/usr/bin/fileinfo ${pkgdir}/usr/bin/retdec-fileinfo 

}
