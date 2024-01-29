# Maintainer: vmalloc vmalloc@olanfa.de
pkgname=cisco-regex
pkgver=0.92
pkgrel=1
pkgdesc="is made to lint standard and extended ip access lists on the Cisco IOS platform"
arch=('i686' 'x86_64')
url="https://jeremy.kister.net/code/Cisco-Regex-0.92/README"
license=('Artistic License')
depends=('perl')
makedepends=()
source=("https://jeremy.kister.net/code/Cisco-Regex-$pkgver.tgz")

sha512sums=('8bdf631a049fae54689a31efe2dce9c8dbfa4b5b451f8cf87b0d1ea6e17d337313eff896a078f0e5f971f47d434b43a50309e656b8b79d7ba781558c9470dde2')


build() {
  cd "$srcdir/Cisco-Regex-$pkgver"
  perl Makefile.PL || return 1
  make || return 1
  make test || return 1
}

package() {
	cd "${srcdir}"/Cisco-Regex-${pkgver}
	make install DESTDIR="${pkgdir}"
}
