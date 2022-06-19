# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=c2ctl
pkgver=090709
pkgrel=4
pkgdesc='Intel Core and Core 2 frequency and voltage modification utility'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/c2ctl/'
license=('GPL3')
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname.tar.bz2
	c2ctl.service c2ctl.script c2ctl.conf)
install=c2ctl.install
backup=('etc/conf.d/c2ctl')
md5sums=('11612ad23e3211c7bd4fc4d735c1c71a'
         'e0fba808fd976b464d76a2c006b8f031'
         'f19fb4a703519c5bf011014eb2b4c970'
         '8415fdd35e4269953f525686f28f7e1e')

package() {
	install -m644 -D c2ctl.service $pkgdir/usr/lib/systemd/system/c2ctl.service
	install -m755 -D c2ctl.script  $pkgdir/usr/lib/systemd/scripts/c2ctl
	install -m644 -D c2ctl.conf    $pkgdir/etc/conf.d/c2ctl
	install -m755 -D c2ctl/c2ctl   $pkgdir/usr/bin/c2ctl
	install -m644 -D c2ctl/Readme  $pkgdir/usr/share/doc/c2ctl/readme.txt
}
