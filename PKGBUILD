# Maintainer: robertfoster
pkgname=xplico
pkgver=1.2.1
pkgrel=1
arch=(i686 x86_64)
pkgdesc="Internet Traffic Decoder. Network Forensic Analysis Tool (NFAT)"
url="http://www.xplico.org/"
license=('GPL')
depends=(
	apache
	json-c
	lame
	libmysqlclient
	libnet
	libpcap
	ndpi
	net-tools
	perl
	perl
	php
	php-apache
	php-pear
	php-sqlite
	python-httplib2
	python-psycopg2
	recode
	sox
	sqlite3
	tcpdump
) 
optdepends=('geoip-database-extra: City database for geoip IP location lookups'
	    'ghostpdl: reconstruct document printed with network printer'
	    'videosnarf: decode VoIP based on RTP')
source=("https://github.com/xplico/xplico/archive/v$pkgver.tar.gz")
install=xplico.install

build() {
  cd $pkgname-$pkgver 
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install    
  ln -sr /usr/share/GeoIP/GeoIPCity.dat $pkgdir/opt/xplico/GeoLiteCity.dat
}

md5sums=('b16b1f1dc8520b3bbc5c3cd9439ca38a')
