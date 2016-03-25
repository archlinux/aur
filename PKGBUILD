pkgbase=('curlbomb')
pkgname=('curlbomb')
_module='curlbomb'
pkgver='1.0.6'
pkgrel=0
pkgdesc="A personal HTTP server for serving one-time-use bash scripts"
url="https://github.com/EnigmaCurry/curlbomb"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/c/curlbomb/curlbomb-${pkgver}.tar.gz")
md5sums=('5f02a2888bc5a734a4814e5948b3bdea')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}"

    python build_manpage.py
    mkdir -p ${pkgdir}/usr/share/man/man1
    mv curlbomb.1 ${pkgdir}/usr/share/man/man1
}
