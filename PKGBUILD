# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Mariusz Derela <mariusz.derela@gmail.com>

pkgname=nagvis
pkgver=1.7.10
pkgrel=3
pkgdesc="Visualization addon for the well known network managment system Nagios"
license=('GPL')
arch=('any')
url="http://www.nagvis.org"
depends=('graphviz' 'php-sqlite' 'apache' 'php-apache')
install=$pkgname.install
backup=('usr/share/nagvis/etc/geomap/links.xml' 'usr/share/nagvis/etc/geomap/viewpoints.xml'
  'usr/share/nagvis/etc/geomap/locations.xml' 'usr/share/nagvis/etc/geomap/settings.xml'
  'usr/share/nagvis/etc/geomap/demo-locations.csv' 'usr/share/nagvis/etc/maps/demo-overview.cfg'
  'usr/share/nagvis/etc/maps/demo-automap2.cfg' 'usr/share/nagvis/etc/maps/demo-load.cfg'
  'usr/share/nagvis/etc/maps/demo-germany.cfg' 'usr/share/nagvis/etc/maps/demo-geomap.cfg'
  'usr/share/nagvis/etc/maps/demo-ham-racks.cfg' 'usr/share/nagvis/etc/maps/demo-muc-srv1.cfg'
  'usr/share/nagvis/etc/maps/demo-automap.cfg' 'usr/share/nagvis/etc/.htaccess'
  'usr/share/nagvis/etc/conf.d/demo.ini.php' 'etc/httpd/conf/extra/nagvis.conf')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname.conf)
md5sums=('b9defcf6153525c9927a7e631fc0ff5c'
         '05fe86ccd6e950105532bed926164f3c')

package() {
  cd "$srcdir"/$pkgname-$pkgver

  install -d "$pkgdir"/usr/share/$pkgname/

  cp -a etc share "$pkgdir"/usr/share/$pkgname/
  cp -a docs "$pkgdir"/usr/share/$pkgname/share/

  install -d "$pkgdir"/usr/share/$pkgname/{etc/profiles,var/tmpl/{compile,cache}}

  install -Dm 644 "$srcdir"/$pkgname.conf \
    "$pkgdir"/etc/httpd/conf/extra/$pkgname.conf
}
