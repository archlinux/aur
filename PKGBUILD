# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=clifm
pkgver=1.2.1
pkgrel=1
pkgdesc="The KISS, non-curses terminal file manager"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'aarch64' 'armv7h')
url="https://github.com/leo-arch/clifm"
license=(GPL2)
provides=('clifm')
depends=('libcap' 'readline' 'acl' 'file')
makedepends=('make')
optdepends=(
	'archivemount: Archives mount'
	'atool: Archives/compression support'
	'p7zip: ISO 9660 support'
	'cdrtools: ISO 9660 support'
	)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leo-arch/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('5a74270f07c54915c6c67ebb56c33a2b53ed9abdd04815f4d4dc618a160aba79')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man PREFIX=/usr install
}
