pkgbase=('curlbomb')
pkgname=('curlbomb')
_module='curlbomb'
pkgver='1.3.1'
pkgrel=0
pkgdesc="A personal HTTP server for serving one-time-use shell scripts"
url="https://github.com/EnigmaCurry/curlbomb"
depends=('python'
	 'python-tornado'
	 'python-requests')
optdepends=('openssh: SSH tunnel support (--ssh)'
            'openssl: TLS security (--ssl)'
            'gnupg: Encrypted SSL certificate and resource support'
	    'python-notify2: Desktop notification support')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/1d/c8/27fb878ae84d4c98c9b9fb3d91abef81a11f33ba7e4f3ca364209df83505/curlbomb-1.3.1.tar.gz")
md5sums=('1c3df5046475e503dacd81f45a62e083')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}"

    mkdir -p ${pkgdir}/usr/share/man/man1/
    install curlbomb.1 ${pkgdir}/usr/share/man/man1/
}
