# Maintainer: Firegore <admin@firegore.com>
pkgname=bloonix-core
#_pkgname=
provides=('bloonix-core')
pkgver=0.41
pkgrel=1
pkgdesc='Core Package from Bloonix Monitoring'
arch=('i686' 'x86_64')
url='https://bloonix.org'
license=('GPLv3')


depends=('perl-module-build' 'perl-io-socket-inet6' 'perl-params-validate'
'perl-socket6' 'perl-term-readkey' 'perl-time-parsedate' 'perl-log-handler')
source=(https://download.bloonix.de/sources/$pkgname-$pkgver.tar.gz
        bloonix-core.install)

build() {
    cd "$srcdir"/$pkgname-$pkgver
    perl Build.PL
    perl Build
}

package() {
    install=bloonix-core.install
	cd "$srcdir"/$pkgname-$pkgver
  perl Build install --destdir="$pkgdir" 

}

# vim:set ts=2 sw=2 et:
md5sums=('9ceeaa9291c58f1f667e3e9ef53ae01e'
         '2d15c4dfeec7e7af271428baa067b23c')
sha1sums=('04ec465633085ce2dffd574366848f3234f67545'
          'a7ca673a60fe969efdf2179bffcdfebb60807d60')
