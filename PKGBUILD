# Maintainer:dmeck<dmeck@qq.com>
pkgname=networkmanager-dispatcher-rclone
pkgver=1.1
pkgrel=6
pkgdesc="Dispatcher Script for rclone"
arch=(any)
#license=('MIT')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager' 'rclone')
source=("10-rclone"
		"rc5-mount-remote-google.sh"
		"rclone-mount-rc-local.service"
		)
md5sums=('d4e3200882c5a979b394fd533ea67a31'
          '08eb68efbdc738c67954243509275c7e'
          '892d397378867c9435bdb7d14013b495'
)

package() {
	install -Dm700 $srcdir/rc5-mount-remote-google.sh $pkgdir/etc/rclone-mount-rc.local.d/rc5-mount-remote-google.sh
	install -Dm700 $srcdir/rclone-mount-rc-local.service $pkgdir/usr/lib/systemd/system/rclone-mount-rc-local.service
    install -Dm700 $srcdir/10-rclone $pkgdir/etc/NetworkManager/dispatcher.d/10-rclone
}

