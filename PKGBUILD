# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=polyglot
pkgver=2.2.1
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
            'b0fe8bc8f8eb63c267f81b55101789ed18e908c9ea43fc8299d05e879605e26c'
            '728783fb5152baf655131ad1427d1c2524a6f7d76a3664c070c4f0f5df443728')
sha256sums_x86_64=('ba8d6f6e4089c7ccd6487c5b2325a672524c3b5e6b4a5ce877a4c96a9b519a1f')
sha256sums_armv7h=('959307719a4103bb1058808799f18b011e35613d0c31e877fa41a683eaaeaab3')
sha256sums_aarch64=('959307719a4103bb1058808799f18b011e35613d0c31e877fa41a683eaaeaab3')


package() {
  install -D -m 755 "${srcdir}/polyglot-v2-linux-x64" "${pkgdir}/usr/bin/polyglot"

  install -D -m 644 "${srcdir}/polyglot.service" "${pkgdir}/usr/lib/systemd/system/polyglot.service"
  install -D -m 644 "${srcdir}/polyglot.sysusers" "${pkgdir}/usr/lib/sysusers.d/polyglot.conf"
  install -D -m 644 "${srcdir}/polyglot.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/polyglot.conf"
}
