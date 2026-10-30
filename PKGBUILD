# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="roundcubemail-plugin-carddav"
pkgver=5.1.5
pkgrel=1
pkgdesc="CardDAV plugin for RoundCube Webmailer"
url="https://github.com/mstilkerich/rcmcarddav"
license=("GPL2")
arch=("any")
conflicts=("roundcube-rcmcarddav" "roundcube-rcmcarddav-git" "roundcubemail-plugin-carddav-git")
replaces=("roundcube-rcmcarddav")
depends=("roundcubemail")
source=("$url/releases/download/v$pkgver/carddav-v$pkgver.tar.gz")
b2sums=('b1e5324de3ac37c9fed0bfa3b8a07f6abe22d347c03526129c5d451a66e224ad6202ad48e8a6748ee37698905b436b68fa062b7f1b831fd2e95d81938dbf7905')
backup=("etc/webapps/roundcubemail/plugins/carddav/config.inc.php")
options=("!strip")

package(){
 cd "carddav"
 install -d "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 cp -r * "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 install -D -m 640 -o root -g http "config.inc.php.dist" "$pkgdir/etc/webapps/roundcubemail/plugins/carddav/config.inc.php"
 ln -s "/etc/webapps/roundcubemail/plugins/carddav/config.inc.php" "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav/config.inc.php"
}
