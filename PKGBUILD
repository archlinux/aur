# Maintainer: Pan Lanlan <abbypan@gmail.com>
pkgname=wdns-git
pkgver=0.0.0
pkgrel=1
pkgdesc='wdns is a low-level C library for dealing with wire-format dns packets.'
arch=('any')
license=('MIT')
makedepends=('libpcap' 'tcpdump' 'pkgconf')
url="https://github.com/farsightsec/wdns/"

build() {
    git clone --recursive $url
    cd wdns
    ./autogen.sh
    ./configure
    make
    make check
}

package() {
	cd wdns
    make install DESTDIR=$pkgdir
}
