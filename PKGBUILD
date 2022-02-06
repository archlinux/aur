# Maintainer: Arkylin <x@xyz.blue>

pkgname=rc-local-auto
pkgver=1.0
pkgrel=1
pkgdesc='建立rc.local启动文件与rc.local.d目录，将脚本放入rc.local.d即可运行'
url="https://aur.archlinux.org/packages/${pkgname}/"
arch=('any')
license=('unknown')
install="${pkgname}.install"
depends=('systemd')
backup=('etc/rc.local')
source=(
	'rc.local'
	'rc-local.service')
sha512sums=(
	'd93eb53c6504e76497f5f18f825a6daf24d2af8c1e869e821c9c28422104058e5c0e0a7d5a81112080a057b9b1fe86ad32734d980e7560ae195448e705f428f6'
	'23899e87a96b5ff88d28aa7b0d666aef5346040e60992a8a603dc2aa6714962b16577db37c2004d7aecdf62bdba2d6c22e063687b957680acb607b4e611e97ee')

package() {
	install -Dm755 'rc.local' "${pkgdir}/etc/rc.local"
	install -Dm644 'rc-local.service' "${pkgdir}/usr/lib/systemd/system/rc-local.service"
	mkdir -p ${pkgdir}/etc/rc.local.d/
}
