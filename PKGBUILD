pkgbase=('curlbomb')
pkgname=('curlbomb')
_module='curlbomb'
pkgver='1.0.12'
pkgrel=0
pkgdesc="A personal HTTP server for serving one-time-use shell scripts"
url="https://github.com/EnigmaCurry/curlbomb"
depends=('python')
optdepends=('openssh: SSH tunnel support')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/c/curlbomb/curlbomb-${pkgver}.tar.gz")
md5sums=('d7df9d9b6475cf6f40972e4a573cf3cf')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}"

    mkdir -p ${pkgdir}/usr/share/man/man1/
    install curlbomb.1 ${pkgdir}/usr/share/man/man1/
}
