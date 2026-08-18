# Maintainer: Jonas Verhofsté <jonas@verhofste.tech>

pkgname=openbolt
pkgver=5.6.0
pkgrel=1
_upstream_pkgrel=1
pkgdesc='OpenVoxProject OpenBolt, a community implementation of puppet-bolt.'
license=('Apache-2.0')
arch=('x86_64')
url='https://github.com/OpenVoxProject/openbolt'
options=(staticlibs !strip)
source=("https://apt.voxpupuli.org/pool/openvox8/o/openbolt/openbolt_${pkgver}-${_upstream_pkgrel}+debian13_amd64.deb")
sha512sums=('6166052cfca50c2f23a9a264a37525208a318eabef4a8bd8255284bce87781c6e4d1691001b6c4d8b5e8c0514c2c7aa71e1da92c9bf82c48b29885a2455fd26c')
depends=('libxcrypt-compat')
conflicts=('puppet-bolt')

package() {
  tar -xzf data.tar.gz -C "${pkgdir}" ./etc ./opt
  install -d -m '0755' "${pkgdir}/usr/bin"
  ln -sT /opt/puppetlabs/bin/bolt "${pkgdir}/usr/bin/bolt"
}
