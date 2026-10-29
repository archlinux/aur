# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="roundcubemail-plugin-caldavzap"
pkgver=1.5.7
pkgrel=1
pkgdesc="CalDAVZap plugin for RoundCube Webmailer"
url="https://github.com/Offerel/roundcube_caldavzap"
license=("AGPL3")
arch=("any")
depends=("roundcubemail")
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('dd05a5df1de34117603ef904702fb62775f17902b09e0e15dac6b5189b9702318898fcb1b21f85f444f131b6d107cd5e3bf3ba980b55cac226569a2c6a202793')
backup=("etc/webapps/roundcubemail/plugins/caldavzap/config.inc.php")

package(){
 cd "roundcube_caldavzap-$pkgver"
 install -d "$pkgdir/usr/share/webapps/roundcubemail/plugins/caldavzap"
 cp -r * "$pkgdir/usr/share/webapps/roundcubemail/plugins/caldavzap"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 install -D -m 640 -o root -g http "config.inc.php.dist" "$pkgdir/etc/webapps/roundcubemail/plugins/caldavzap/config.inc.php"
 ln -s "/etc/webapps/roundcubemail/plugins/caldavzap/config.inc.php" "$pkgdir/usr/share/webapps/roundcubemail/plugins/caldavzap/config.inc.php"
}
