# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap
pkgver=0.6.0
pkgrel=1
pkgdesc="Sophisticated chroot/build/flash tool to develop and install postmarketOS "
arch=('i686' 'x86_64')
url='https://postmarketos.org'
license=('GPL3')
depends=('python' 'openssl')
makedepends=('python-setuptools' 'openssl')

source=("git+https://github.com/postmarketOS/pmbootstrap.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
