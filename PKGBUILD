# Maintainer: Marius Knaust <marius.knaust@gmail.com>

pkgname=spotlight
pkgver=1.4
pkgrel=1
pkgdesc="Displays a new background image daily"
arch=('any')
license=('GPL')
url=""
install=spotlight.install
depends=('wget'
         'jq'
         'perl'
         'gnome-settings-daemon'
         'libsystemd')
source=('spotlight.sh'
        'spotlight.service'
        'spotlight.timer')
md5sums=('efc8c0612da69f6faec5ffb4132ac809'
         '3f71203246d7003af3f05b1891ccfd5f'
         '5cf181a3dd50993e0dfbf1835c9d2364')

package()
{
	install -m755 -D ${srcdir}/spotlight.sh ${pkgdir}/usr/bin/spotlight.sh
	install -m644 -D ${srcdir}/spotlight.service ${pkgdir}/usr/lib/systemd/user/spotlight.service
	install -m644 -D ${srcdir}/spotlight.timer ${pkgdir}/usr/lib/systemd/user/spotlight.timer
}
