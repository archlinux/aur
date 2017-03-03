# Maintainer: Marius Knaust <marius.knaust@gmail.com>

pkgname=spotlight
pkgver=1.5
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
        'spotlight.timer'
        'spotlight.desktop')
md5sums=('3513346c4a6be5c3aad07bd4b3e64489'
         '3f71203246d7003af3f05b1891ccfd5f'
         '5cf181a3dd50993e0dfbf1835c9d2364'
         '30fbf3665eca3ea98d00d38c5829c1ad')
         
package()
{
	install -m755 -D ${srcdir}/spotlight.sh ${pkgdir}/usr/bin/spotlight.sh
	install -m644 -D ${srcdir}/spotlight.service ${pkgdir}/usr/lib/systemd/user/spotlight.service
	install -m644 -D ${srcdir}/spotlight.timer ${pkgdir}/usr/lib/systemd/user/spotlight.timer
	install -m644 -D ${srcdir}/spotlight.desktop ${pkgdir}/usr/share/applications/spotlight.desktop
}
