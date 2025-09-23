# Maintainer: vgs vldmr.lshnk@gmail.com
pkgname=rclone-bisync-service
pkgver=20250923
pkgrel=2
pkgdesc="Systemd user service wrapper over rclone bisync. Rclone bisync is command that provide two side syncronization with offline access to files."
arch=('any')
depends=('systemd' 'rclone')
source=(
	'rclone-bisync@.service'
	'rclone-bisync@.path'
	'rclone-bisync@.timer'
	'rclone-bisync-init.sh'
)
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)
license=('MIT')

package() {
    install -Dm 0644 "$srcdir/rclone-bisync@.service" "$pkgdir/usr/lib/systemd/user/rclone-bisync@.service"
    install -Dm 0644 "$srcdir/rclone-bisync@.timer"   "$pkgdir/usr/lib/systemd/user/rclone-bisync@.timer"
    install -Dm 0644 "$srcdir/rclone-bisync@.path"    "$pkgdir/usr/lib/systemd/user/rclone-bisync@.path"
    install -Dm 0644 "$srcdir/rclone-bisync-init.sh"  "$pkgdir/usr/bin/rclone-bisync-init.sh"
}
