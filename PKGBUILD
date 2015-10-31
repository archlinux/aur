pkgname='python2-qserve'
_module='qserve'
pkgver='0.2.8'
pkgrel=1
pkgdesc="job queue server"
url="https://github.com/pediapress/qserve"
depends=('python2')
makedepends=('python2-setuptools')
license=('unknown')
arch=('any')
source=("https://pypi.python.org/packages/source/q/qserve/qserve-${pkgver}.zip"
        license.txt)
md5sums=('d481f0dad66a93d0479022fe0487e8ee'
         '2b333de6f7b8cec3820857fc249ac2d3')

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 "${srcdir}/license.txt" \ /usr/share/licenses/${pkgname}/license.txt
}
