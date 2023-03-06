# Maintainer:  khvalera <khvalera[at]ukr[dot]net>

pkgname=phppgadmin
pkgver=7.14.3
pkgrel=1
pkgdesc="A web-based administration tool for PostgreSQL"
arch=('any')
url="https://github.com/phppgadmin/phppgadmin/"
license=('GPL')
depends=('php' 'php-pgsql')
backup=('etc/webapps/phppgadmin/config.inc.php')
source=("https://github.com/ReimuHakurei/phpPgAdmin/archive/refs/tags/v$pkgver-mod.tar.gz")
sha256sums=('1665aa9530c71b65b3997f451acc293e71992173767d89c4ebaafe40b9290697')

package() {
  _instdir="$pkgdir"/usr/share/webapps/phppgadmin
  mkdir -p ${_instdir} "$pkgdir"/etc/webapps/phppgadmin
  cd ${_instdir}
  cp -ra "$srcdir"/phpPgAdmin-$pkgver-mod/* .
  cp ./conf/config.inc.php-dist "$pkgdir"/etc/webapps/phppgadmin/config.inc.php
  rm -f ${_instdir}/conf/config.inc.php
  ln -s /etc/webapps/phppgadmin/config.inc.php ${_instdir}/conf/config.inc.php
}
