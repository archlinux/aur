pkgbase=('curlbomb')
pkgname=('curlbomb')
_module='curlbomb'
pkgver='1.2.0'
pkgrel=0
pkgdesc="An HTTP server for serving one-time-use shell scripts"
url="https://github.com/EnigmaCurry/curlbomb"
depends=('python'
	 'python-tornado')
optdepends=('openssh: SSH tunnel support'
            'gnupg: Encrypted SSL certificate support')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/c/curlbomb/curlbomb-${pkgver}.tar.gz")
md5sums=('238032329eeec0c365dc76e13057294d')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}"

    mkdir -p ${pkgdir}/usr/share/man/man1/
    install curlbomb.1 ${pkgdir}/usr/share/man/man1/
}
