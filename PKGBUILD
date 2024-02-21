# Maintainer:  khvalera <khvalera[at]ukr[dot]net>

pkgname=phppgadmin
pkgver=7.14.7
pkgrel=1
pkgdesc="A web-based administration tool for PostgreSQL"
arch=('any')
url="https://github.com/ReimuHakurei/phpPgAdmin/"
license=('GPL')
depends=('php-interpreter' 'php-pgsql-interpreter')
backup=('etc/webapps/phppgadmin/config.inc.php')
source=("https://github.com/ReimuHakurei/phpPgAdmin/archive/refs/tags/v$pkgver-mod.tar.gz")
sha256sums=('7c0e89922abcf88fd81a52590930f3b5121032d1d37234a54a8f6415152dc292')

package() {
  _instdir="$pkgdir"/usr/share/webapps/phppgadmin
  mkdir -p ${_instdir} "$pkgdir"/etc/webapps/phppgadmin
  cd ${_instdir}
  cp -ra "$srcdir"/phpPgAdmin-$pkgver-mod/* .
  cp ./conf/config.inc.php-dist "$pkgdir"/etc/webapps/phppgadmin/config.inc.php
  rm -f ${_instdir}/conf/config.inc.php
  ln -s /etc/webapps/phppgadmin/config.inc.php ${_instdir}/conf/config.inc.php
}
