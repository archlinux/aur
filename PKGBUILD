# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-rabbitvcs'
pkgver=3.2.1
_mintrel='betsy'
pkgrel=1
pkgdesc="RabbitVCS integration in Nemo"
arch=('any')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo-python' 'rabbitvcs' 'python2-dbus')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}+${_mintrel}.tar.gz")
sha256sums=('04634fd8e3ca9647c306e6b0b9f2e863fbcc4e347370c09d2b0a8bc04ad0e127')

prepare() {
  cd ${pkgname}-${pkgver}+${_mintrel}

  # Python2 fix
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

package() {
  install -Dm644 ${pkgname}-${pkgver}+${_mintrel}/RabbitVCS.py \
      "$pkgdir"/usr/share/nemo-python/extensions/RabbitVCS.py
}
