# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=nemo-emblems
pkgver=3.2.3
pkgrel=1
pkgdesc="Nemo file emblems extension"
arch=('any')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL')
depends=('nemo-python')
makedepends=('python2-distutils-extra')
options=('!libtool' '!emptydirs')
install="$pkgname".install

source=("${pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('22f5253ba6f34795d0cb29354bd2f8ff5a7afade8515126d3ddea1ce239f1883')

prepare() {
  cd ${pkgname}

  # Python2 fix
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

package() {
  cd ${pkgname}

  python2 ./setup.py install --prefix=/usr --root=${pkgdir}
}
