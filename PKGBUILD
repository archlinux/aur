# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=nemo-emblems
pkgver=3.4.0
pkgrel=1
pkgdesc="Nemo file emblems extension"
arch=('any')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL')
depends=('nemo-python')
makedepends=('python2-distutils-extra')
options=('!libtool' '!emptydirs')
install="$pkgname".install
#source=("${pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.gz")
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('68dadce98c17321c3c22e596452a1b7aa0842c5faa05688734430857e037b3f2')

prepare() {
  #cd ${pkgname}-${pkgver}+${_mintrel}
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  # Python2 fix
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

package() {
  #cd ${pkgname}-${pkgver}+${_mintrel}
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  python2 ./setup.py install --prefix=/usr --root=${pkgdir}
}
