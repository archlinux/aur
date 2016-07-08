# Maintainer: Firegore <admin@firegore.com>
pkgname=bloonix-agent
#_pkgname=
provides=('bloonix-agent')
pkgver=0.75
pkgrel=1
pkgdesc='Bloonix Monitoring Agent'
arch=('i686' 'x86_64')
url='https://bloonix.org'
license=('GPLv3')
options=('!emptydirs')

depends=('perl-module-build' 'perl-io-socket-inet6' 'perl-params-validate'
'perl-term-readkey' 'perl-log-handler' 'bloonix-core' 'facter')
source=(https://download.bloonix.de/sources/$pkgname-$pkgver.tar.gz)

build() {
    cd "$srcdir"/$pkgname-$pkgver
    #perl Configure.PL
    perl Configure.PL --prefix /usr --without-perl --ssl-ca-path /etc/ssl/certs --build-package
    make
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
md5sums=('a47c2b8389383600c129324251bf8568')
sha1sums=('7ea79e814c40bc0d49303918ca31d6d0045307e7')
