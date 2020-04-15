# Maintainer: Josip Janzic <me@josip.dev>
pkgbase='python-fakewebcam'
pkgname=('python-fakewebcam')
_module='pyfakewebcam'
pkgver='0.1.0'
pkgrel=1
pkgdesc="An API for writing RGB frames to a fake webcam device on Linux"
url="https://github.com/jremmons/pyfakewebcam/"
depends=('python')
makedepends=('python-setuptools')
license=('LGPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2ad8ceada6605d8ba6ba76e087edf20bfce22d544fc410013067d7ce347d5694')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
