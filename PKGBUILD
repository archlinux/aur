# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=lenovo-s20-30
pkgver=0.1.2
pkgrel=3
pkgdesc='Configuration to support netbook Lenovo S20-30'
arch=(any)
license=('GPL2')
depends=('bash')
source=(
	lenovo_s20-30_blacklist.conf
	lenovo_s20-30_load.conf
	startbt.sh
)
sha256sums=('3451688ddadac8699546e68f41607a7436dd8e25f1c6e0fc5989561b07b526b5'
            '0176afe92b990be5ca9145f14504ee8d1ae8349a9f3cd9d7f0ddaade6ebe59e5'
            'd00a6601d4d137b246fbca6f1b9848552370af256182ac5f17c898f026db1f3b')

install=install

package() {
	install -Dm644 lenovo_s20-30_blacklist.conf "${pkgdir}/usr/lib/modprobe.d/lenovo_s20-30_blacklist.conf"
	install -Dm644 lenovo_s20-30_load.conf "${pkgdir}/usr/lib/modules-load.d/lenovo_s20-30_load.conf"
	install -Dm744 startbt.sh "${pkgdir}/usr/bin/startbt.sh"
}
