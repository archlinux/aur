# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-rabbitvcs'
pkgver=3.4.0
_mintrel='betsy'
pkgrel=1
pkgdesc="RabbitVCS integration in Nemo"
arch=('any')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo-python' 'rabbitvcs' 'python2-dbus')
options=('!emptydirs')
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
  #install -Dm644 ${pkgname}-${pkgver}+${_mintrel}/RabbitVCS.py
  install -Dm644 "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"/RabbitVCS.py \
      "$pkgdir"/usr/share/nemo-python/extensions/RabbitVCS.py
}
