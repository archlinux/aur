# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=nemo-emblems
pkgver=3.0.1
pkgrel=1
pkgdesc="Nemo file emblems extension"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL')
depends=('nemo-python')
makedepends=('python2-distutils-extra')
options=('!libtool' '!emptydirs')
install="$pkgname".install

source=("http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('0f892648269b95ea2cfe313729d0f1c3e4eba4f059013b3d150947e0047ee44b')

prepare() {
  cd ${srcdir}/${pkgname}
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/env python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
            $(find . -name '*.py')
}

package() {
  cd ${srcdir}/${pkgname}
  python2 ./setup.py install --root="${pkgdir}"
}
