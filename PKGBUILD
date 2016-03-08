# Maintainer: Nicolas Trüssel <ntruessel@njsm.de>
pkgname=mkinitcpio-bootmsg
pkgver=0.1.0
pkgrel=1
pkgdesc="Mkinitcpio hook to display a message on boot"
arch=(any)
url="https://github.com/ntruessel/mkinitcpio-bootmsg"
license=('custom:UNLICENSE')
depends=('bash')
makedepends=('git')
backup=('etc/bootmsg.conf')
install="$pkgname.install"
source=("https://github.com/ntruessel/mkinitcpio-bootmsg/archive/v${pkgver}.tar.gz")
sha256sums=('d29864b92800f9a60a721d89f486426195477dc9826fd3d9d9d235fe8ec5ef2e')

package() {
	cd "mkinitcpio-bootmsg-${pkgver}"
	install -Dm644 bootmsg.conf "${pkgdir}/etc/bootmsg.conf"
	install -Dm644 bootmsg.install "${pkgdir}/usr/lib/initcpio/install/bootmsg"
	install -Dm644 bootmsg.hook "${pkgdir}/usr/lib/initcpio/hooks/bootmsg"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
