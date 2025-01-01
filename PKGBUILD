# Maintainer: Qu Wenruo <wqu@suse.com>
pkgname=simple-kdump
pkgver=0.5
pkgrel=1
pkgdesc="A very simple kdump setup for Archlinux"
url="https://github.com/adam900710/simple-kdump"
source=("git+$url.git#tag=v${pkgver}?signed")
depends=('systemd' 'makedumpfile')
arch=('any')
license=('MIT')
provides=('simple-kdump')
sha256sums=('SKIP')

package()
{
	cd "$srcdir/$pkgname"
	install -Dm0755 emergency-kdump.target "${pkgdir}/usr/lib/systemd/system/emergency-kdump.target"
	install -Dm0755 simple-kdump-collect.service "${pkgdir}/usr/lib/systemd/system/simple-kdump-collect.service"
	install -Dm0755 simple-kdump-setup.service "${pkgdir}/usr/lib/systemd/system/simple-kdump-setup.service"
	install -Dm0755 simple-kdump.conf "${pkgdir}/etc/conf.d/simple-kdump.conf"
}
