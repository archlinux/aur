pkgbase=('curlbomb')
pkgname=('curlbomb')
_module='curlbomb'
pkgver='1.4.0'
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
source=("https://pypi.python.org/packages/a2/1f/68aa9f434ac7765d9f9fd7aaa2e80e7326bd94a0995631468cc6778de850/curlbomb-1.4.0.tar.gz")
md5sums=('096bae423eb4bf680716b9715af6125f')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}"

    mkdir -p ${pkgdir}/usr/share/man/man1/
    install curlbomb.1 ${pkgdir}/usr/share/man/man1/
}
