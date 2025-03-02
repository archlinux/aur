# Maintainer: archcrack <leo.clifm@outlook.com>

pkgname=clifm
pkgver=1.24
pkgrel=1
pkgdesc="The command line file manager"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'aarch64' 'armv7h')
url="https://github.com/leo-arch/${pkgname}"
license=(GPL-2.0-or-later)
provides=('clifm')
conflicts=('clifm-bin' 'clifm-git' 'clifm-nerd')
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
sha256sums=('fd279bcd8cfebaba1c6134ffdc0b429e2cd0b7d8ece94037bfb57cb210564a5e')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man PREFIX=/usr install
}
