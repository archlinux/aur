# Maintainer: archcrack <leo.clifm@outlook.com>

pkgname=clifm-nerd
_pkgname=clifm
pkgver=1.23
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
sha256sums=('5209a7286541bebc9649537abe9dfc1cfa76c6aa317afb5a6ed87270c1d069aa')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  CPPFLAGS=-D_NERD make PREFIX=/usr
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man PREFIX=/usr install
}
