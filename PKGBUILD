# Maintainer: vmalloc support@cyborg-connect.de
pkgname=sys-hostaddr
pkgver=0.993
pkgrel=00
pkgdesc="sys-HostAddr provides methods to help retreive IP address and interface information about a local host"
arch=('i686' 'x86_64')
url="http://jeremy.kister.net/code/Sys-HostAddr-0.993/README"
license=('Artistic License')
depends=('perl')
makedepends=()
source=("http://jeremy.kister.net/code/Sys-HostAddr-$pkgver.tgz")

sha512sums=('11241b277d71fa8c657317eb6e127008175e8b7f9e6c924e330578573ab554a94339f2fab6810aa2b14d5a07eb481972ac5d28adc3ad661d522a5daa55244220')


build() {
  cd "$srcdir/Sys-HostAddr-$pkgver"
  perl Makefile.PL || return 1
  make || return 1
  make test || return 1
}

package() {
	cd "${srcdir}"/Sys-HostAddr-${pkgver}
	make install DESTDIR="${pkgdir}"
}
