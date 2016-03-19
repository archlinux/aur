# Maintainer: M0Rf30
pkgname=xplico
pkgver=v1.1.2
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
	recode
	sox
	sqlite3
	tcpdump
) 
optdepends=('geoip-citydata: City database for geoip IP location lookups'
	    'ghostpdl: reconstruct document printed with network printer'
	    'videosnarf: decode VoIP based on RTP')
source=('xplico::git+https://github.com/xplico/xplico.git')
install=xplico.install

build() {
  cd xplico
  make -j1
}

package() {
  cd xplico
  make DESTDIR=$pkgdir install    
}

pkgver() {
  cd xplico
  echo $(git tag)
}

md5sums=('SKIP')
