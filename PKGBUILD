pkgbase=('curlbomb')
pkgname=('curlbomb')
_module='curlbomb'
pkgver='1.0.16'
pkgrel=0
pkgdesc="A personal HTTP server for serving one-time-use shell scripts"
url="https://github.com/EnigmaCurry/curlbomb"
depends=('python')
optdepends=('openssh: SSH tunnel support')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/EnigmaCurry/curlbomb/archive/${pkgver}.tar.gz")
sha256sums=('c851783556ace2c625010fd34850f0d20f69f9382640def3ef5ec79d701d3b7f')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}"

    mkdir -p ${pkgdir}/usr/share/man/man1/
    install curlbomb.1 ${pkgdir}/usr/share/man/man1/
}
