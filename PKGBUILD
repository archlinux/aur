# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="roundcubemail-plugin-caldavzap"
pkgver=1.5.1
pkgrel=1
pkgdesc="CalDAVZap plugin for RoundCube Webmailer"
url="https://github.com/Offerel/roundcube_caldavzap"
license=("AGPL3")
arch=("any")
depends=("roundcubemail")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("278a2c5217df6d428d4dbfb5ebf038fb656afeb15408e7dc0279cef4ace8e219")
backup=("etc/webapps/roundcubemail/plugins/caldavzap/config.inc.php")

package(){
 cd "roundcube_caldavzap-$pkgver"
 install -d "$pkgdir/usr/share/webapps/roundcubemail/plugins/caldavzap"
 cp -r * "$pkgdir/usr/share/webapps/roundcubemail/plugins/caldavzap"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
 install -D -m 640 -o root -g http "config.inc.php.dist" "$pkgdir/etc/webapps/roundcubemail/plugins/caldavzap/config.inc.php"
 ln -s "/etc/webapps/roundcubemail/plugins/caldavzap/config.inc.php" "$pkgdir/usr/share/webapps/roundcubemail/plugins/caldavzap/config.inc.php"
}
