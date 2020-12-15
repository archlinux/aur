# Maintainer:dmeck<dmeck@qq.com>
pkgname=networkmanager-dispatcher-rclone
pkgver=1.0
pkgrel=6
pkgdesc="Dispatcher Script for rclone"
arch=(any)
#license=('MIT')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager' 'rclone')
source=("10-rclone"
		"rclone-mount-rc.local"
		"rc5-mount-remote-google.sh"
		"rclone-mount-rc-local.service"
		)
md5sums=('0418ba88270c4452031fb59121bd2398'
                    'b2401ae52edc762f118e60fe052ee4b9'
                    '9ad06564d576cc625ee34486fd0903d3'
                    'b7ca0d8313d0890663dff85693eab760'
)

package() {
	install -Dm700 $srcdir/rclone-mount-rc.local $pkgdir/etc/rclone-mount-rc.local
	install -Dm700 $srcdir/rc5-mount-remote-google.sh $pkgdir/etc/rclone-mount-rc.local.d/rc5-mount-remote-google.sh
	install -Dm700 $srcdir/rclone-mount-rc-local.service $pkgdir/usr/lib/systemd/system/rclone-mount-rc-local.service
    install -Dm700 $srcdir/10-rclone $pkgdir/etc/NetworkManager/dispatcher.d/10-rclone
}

