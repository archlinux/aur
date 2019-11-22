# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=polyglot
pkgver=2.2.3
pkgrel=1
pkgdesc='A python library built which abstracts out all ISY 5.0 Node Server APIs.'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/UniversalDevicesInc/polyglot-v2"
license=('MIT')
depends=('python'
         'mongodb'
         'curl')

options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-${pkgrel}.x86_64.tar.gz::https://s3.amazonaws.com/polyglotv2/binaries/polyglot-v2-linux-x64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-${pkgrel}.armv7h.tar.gz::https://s3.amazonaws.com/polyglotv2/binaries/polyglot-v2-linux-armv7.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}.aarch64.tar.gz::https://s3.amazonaws.com/polyglotv2/binaries/polyglot-v2-linux-armv7.tar.gz")

source=('polyglot.service'
        'polyglot.tmpfiles'
        'polyglot.sysusers')

sha256sums=('584e9fba9d818c1301ac0364f9a6bd9c4061a21ae691c47ee0fe989d4ad897c4'
            'f16756f67fba080da7e66ad56e3e1948cc2e93457bf2592444709da75e13f9ec'
            '728783fb5152baf655131ad1427d1c2524a6f7d76a3664c070c4f0f5df443728')
sha256sums_x86_64=('6ab61f500bd3aac9c95ee70998d9b160e126f710a5ea170e1ce69a35b2a6de64')
sha256sums_armv7h=('6defc4fe9883278712f9ca818f6d1b82847a8bfc07884c9cf9674259f2887a36')
sha256sums_aarch64=('6defc4fe9883278712f9ca818f6d1b82847a8bfc07884c9cf9674259f2887a36')


package() {
  install -D -m 755 "${srcdir}/polyglot-v2-linux-x64" "${pkgdir}/usr/bin/polyglot"

  install -D -m 644 "${srcdir}/polyglot.service" "${pkgdir}/usr/lib/systemd/system/polyglot.service"
  install -D -m 644 "${srcdir}/polyglot.sysusers" "${pkgdir}/usr/lib/sysusers.d/polyglot.conf"
  install -D -m 644 "${srcdir}/polyglot.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/polyglot.conf"
}
