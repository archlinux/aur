pkgbase=('curlbomb')
pkgname=('curlbomb')
_module='curlbomb'
pkgver='1.3.0'
pkgrel=0
pkgdesc="An HTTP server for serving one-time-use shell scripts"
url="https://github.com/EnigmaCurry/curlbomb"
depends=('python'
	 'python-tornado')
optdepends=('openssh: SSH tunnel support'
            'gnupg: Encrypted SSL certificate support'
	    'python-notify2: Desktop notification support')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/e2/7d/bb718da97006405a3fbc75a03fe51a92b142643517c0cc2c09155692b7b9/curlbomb-1.3.0.tar.gz")
md5sums=('2cd2c48f6f1bf91530da7f3bb18adab7')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}"

    mkdir -p ${pkgdir}/usr/share/man/man1/
    install curlbomb.1 ${pkgdir}/usr/share/man/man1/
}
