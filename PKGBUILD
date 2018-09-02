# Maintainer: Daniel Quinn <archlinux at danielquinn dot org>

pkgname="python-aletheia"
pkgver=0.6.1
pkgrel=1
pkgdesc="Fight fake news with cryptography & human nature"
_name=${pkgname#python-}
arch=('any')
url="https://danielquinn.github.io/aletheia"
license=('AGPL3')
makedepends=('python-setuptools')
depends=('ffmpeg'
'python'
'python-setuptools'
'python-pillow'
'python-cryptography'
'python-magic'
'python-requests'
'python-termcolor'
'python-piexif')
checkdepends=('pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('d7a69dcbf2a0bb6c90c20d9e5c130a3bced492843256367492550e5a201a74f3e536a49ecc2dbea235cabaae7be9c3383a6df75c29c5d26844fa2b806dc7c445')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
