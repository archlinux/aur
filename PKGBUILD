pkgname="roundcubemail-plugin-thunderbird-labels"
pkgver=1.6.2
pkgrel=1
pkgdesc="Thunderbird Labels Plugin for Roundcube Webmail"
url="https://github.com/mike-kfed/roundcube-thunderbird_labels"
license=("BSD-2-clause")
arch=("any")
depends=("roundcubemail")
backup=("etc/webapps/roundcubemail/plugins/thunderbird_labels/config.inc.php")
source=("https://github.com/mike-kfed/roundcube-thunderbird_labels/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('e1efce7154eb7791e6b36afcb7246cb337a26d0e64f3c1d4ca8224a17c43789434c96d944235e6b46f27850803418a1f988f99cceed8346c6137458439e46793')

package(){
 cd "roundcube-thunderbird_labels-$pkgver"
 install -d "$pkgdir/usr/share/webapps/roundcubemail/plugins/thunderbird_labels"
 cp -r * "$pkgdir/usr/share/webapps/roundcubemail/plugins/thunderbird_labels"
 install -D -m 640 -o root -g http "config.inc.php.dist" "$pkgdir/etc/webapps/roundcubemail/plugins/thunderbird_labels/config.inc.php"
 ln -s "/etc/webapps/roundcubemail/plugins/thunderbird_labels/config.inc.php" "$pkgdir/usr/share/webapps/roundcubemail/plugins/thunderbird_labels/config.inc.php"
}
