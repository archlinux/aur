pkgbase=('curlbomb')
pkgname=('curlbomb')
_module='curlbomb'
pkgver='1.4.1'
pkgrel=0
pkgdesc="A personal HTTP server for serving one-time-use shell scripts"
url="https://github.com/EnigmaCurry/curlbomb"
depends=('python'
	 'python-tornado'
	 'python-requests'
	 'python-psutil')
optdepends=('openssh: SSH tunnel support (--ssh)'
            'openssl: TLS security (--ssl)'
            'gnupg: Encrypted SSL certificate and resource support'
	    'python-notify2: Desktop notification support')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/2a/1e/c6db152cd596aa31682c1e7126891209182503eaac902a63f46c36316c21/curlbomb-1.4.1.tar.gz")
md5sums=('b39197c2b9ea1362c387bfe6fc7e7e2c')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}"

    mkdir -p ${pkgdir}/usr/share/man/man1/
    install curlbomb.1 ${pkgdir}/usr/share/man/man1/
}
