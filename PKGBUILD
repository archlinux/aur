# Maintainer: archcrack <leo.clifm@outlook.com>

pkgname=clifm
pkgver=1.14.6
pkgrel=1
pkgdesc="The command line file manager"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'aarch64' 'armv7h')
url="https://github.com/leo-arch/${pkgname}"
license=(GPL2)
provides=('clifm')
depends=('libcap' 'readline' 'acl' 'file')
makedepends=('make' 'gzip')
optdepends=(
	'archivemount: Archives mount'
	'atool: Archives/compression support'
	'p7zip: ISO 9660 support'
	'cdrtools: ISO 9660 support'
	'fzf: fzf mode for TAB completion'
	'smenu: smenu mode for TAB completion'
	'udevil: (un)mount storage devices'
	'udisks2: (un)mount storage devices'
	)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f26b9ee1c41f02ec50dcae4108865b7f463d6dcf5dbd1f0271fbe1dbed93b2a1')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man PREFIX=/usr install
}
