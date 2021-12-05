# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=clifm
pkgver=1.3
pkgrel=1
pkgdesc="The command line file manager"
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
	'fzf: fzf mode for TAB completion'
	'udevil: (un)mount storage devices'
	'udisks2: (un)mount storage devices'
	)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leo-arch/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('8418c71e90fe3b88b2e5b30eeadcb829574f99a9c90049e550a38f8c9e3f1076')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man PREFIX=/usr install
}
