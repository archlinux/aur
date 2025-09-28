# Maintainer: archcrack <leo.clifm@outlook.com>

pkgname=clifm-nerd
_pkgname=clifm
pkgver=1.26.3
pkgrel=1
pkgdesc="The command line file manager (with Nerd fonts icons support)"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'aarch64' 'armv7h')
url="https://github.com/leo-arch/${_pkgname}"
license=(GPL-2.0-or-later)
provides=('clifm')
conflicts=('clifm' 'clifm-bin' 'clifm-git')
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
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('902badc747aee1eb1a3a5556ff3fd9d83d2aa987d24e058024064df8a4b6b71f')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  CPPFLAGS=-D_NERD make PREFIX=/usr
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man PREFIX=/usr install
}
