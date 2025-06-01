# Maintainer: Qu Wenruo <wqu@suse.com>
pkgname=simple-kdump
pkgver=0.6
pkgrel=1
pkgdesc="A very simple kdump setup for Archlinux"
url="https://github.com/adam900710/simple-kdump"
source=("git+$url.git#tag=v${pkgver}?signed")
depends=('systemd' 'makedumpfile' 'kexec-tools')
arch=('any')
license=('MIT')
provides=('simple-kdump')
sha256sums=('SKIP')
validpgpkeys=('2DDF72E5A5A55BA89DAA42E1C23D91F3A125FEA8')

package()
{
	cd "$srcdir/$pkgname"
	install -Dm0644 emergency-kdump.target "${pkgdir}/usr/lib/systemd/system/emergency-kdump.target"
	install -Dm0644 simple-kdump-collect.service "${pkgdir}/usr/lib/systemd/system/simple-kdump-collect.service"
	install -Dm0644 simple-kdump-setup.service "${pkgdir}/usr/lib/systemd/system/simple-kdump-setup.service"
	install -Dm0644 simple-kdump.conf "${pkgdir}/etc/conf.d/simple-kdump.conf"
}
