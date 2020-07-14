# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=portforwarder-rs-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Forwards ports on UPnP-enabled gateways. Inspired by portmapper'
arch=('i686' 'x86_64')
url='https://crates.io/crates/portforwarder-rs'
license=('MIT')
provides=('portforwarder-rs')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}::https://github.com/pzmarzly/portforwarder-rs/releases/download/${pkgver}/pf"
        'LICENSE::https://github.com/pzmarzly/portforwarder-rs/raw/master/LICENSE')
sha256sums=('84aeae689214aa86512afe50b35b8c45b0509ae4c28dc76821094d4a8b8ef494'
            '1499cd704105d56653dba0bf6f5760cdfc465f976007ad1f558960e48b52f626')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/pf"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}