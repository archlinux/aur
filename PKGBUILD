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
sha256sums=('a3fd5f89fd8968271d6e7bd3aa9b62c38e522b7734b0e2dcf85b96f305d7f22d')
backup=("etc/webapps/roundcubemail/plugins/caldavzap/config.inc.php")

package(){
 cd "roundcube_caldavzap-$pkgver"
 install -d "$pkgdir/usr/share/webapps/roundcubemail/plugins/caldavzap"
 cp -r * "$pkgdir/usr/share/webapps/roundcubemail/plugins/caldavzap"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 install -D -m 640 -o root -g http "config.inc.php.dist" "$pkgdir/etc/webapps/roundcubemail/plugins/caldavzap/config.inc.php"
 ln -s "/etc/webapps/roundcubemail/plugins/caldavzap/config.inc.php" "$pkgdir/usr/share/webapps/roundcubemail/plugins/caldavzap/config.inc.php"
}
