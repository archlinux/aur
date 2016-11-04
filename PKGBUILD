# Maintainer: Marius Knaust <marius.knaust@gmail.com>

pkgname=spotlight
pkgver=1.1
pkgrel=1
pkgdesc="Displays a new background image daily"
arch=('any')
license=('GPL')
url=""
install=spotlight.install
depends=('curl'
         'perl'
         'gnome-settings-daemon'
         'libsystemd')
source=('spotlight.sh'
        'spotlight.service'
        'spotlight.timer')
md5sums=('a67804eb3cf27cd0ff05270c1e1d2d68'
         '61f2ea773a24bf62185179499194fc69'
         '5cf181a3dd50993e0dfbf1835c9d2364')

package()
{
	install -m755 -D ${srcdir}/spotlight.sh ${pkgdir}/usr/bin/spotlight.sh
	install -m644 -D ${srcdir}/spotlight.service ${pkgdir}/usr/lib/systemd/user/spotlight.service
	install -m644 -D ${srcdir}/spotlight.timer ${pkgdir}/usr/lib/systemd/user/spotlight.timer
}
