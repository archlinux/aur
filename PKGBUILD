# Maintainer: M0Rf30
pkgname=xplico
pkgver=1.1.0
pkgrel=2
arch=(i686 x86_64)
pkgdesc="Internet Traffic Decoder. Network Forensic Analysis Tool (NFAT)"
url="http://www.xplico.org/"
license=('GPL')
depends=('tcpdump' 'libpcap' 'sqlite3' 'sox' 'lame' 'perl' 'apache' 'php' 'php-sqlite' 'php-apache' 'php-pear' 'perl' 'libnet' 'recode' 'json-c' 'python-httplib2' 'libmysqlclient' 'ndpi')
optdepends=('geoip-citydata: City database for geoip IP location lookups'
	    'ghostpdl: reconstruct document printed with network printer'
	    'videosnarf: decode VoIP based on RTP')
source=('xplico::git+https://github.com/M0Rf30/xplico.git')
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
