# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="roundcubemail-plugin-caldavzap"
pkgver=1.5.3
pkgrel=1
pkgdesc="CalDAVZap plugin for RoundCube Webmailer"
url="https://github.com/Offerel/roundcube_caldavzap"
license=("AGPL3")
arch=("any")
depends=("roundcubemail")
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('14ee8a6d1639cdaa3e9b5721aac0d44ff2a5890107888984af8f5fac4b4a2593782b2dc7128f6a9d1c7e97f184209c0ae5a3052d7ce11b910e972940bdfc1966')
backup=("etc/webapps/roundcubemail/plugins/caldavzap/config.inc.php")

package(){
 cd "roundcube_caldavzap-$pkgver"
 install -d "$pkgdir/usr/share/webapps/roundcubemail/plugins/caldavzap"
 cp -r * "$pkgdir/usr/share/webapps/roundcubemail/plugins/caldavzap"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 install -D -m 640 -o root -g http "config.inc.php.dist" "$pkgdir/etc/webapps/roundcubemail/plugins/caldavzap/config.inc.php"
 ln -s "/etc/webapps/roundcubemail/plugins/caldavzap/config.inc.php" "$pkgdir/usr/share/webapps/roundcubemail/plugins/caldavzap/config.inc.php"
}
