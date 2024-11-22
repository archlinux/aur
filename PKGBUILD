# Maintainer: archcrack <leo.clifm@outlook.com>

pkgname=clifm-nerd
_pkgname=clifm
pkgver=1.21
pkgrel=2
pkgdesc="The command line file manager (with Nerd fonts icons support)"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'aarch64' 'armv7h')
url="https://github.com/leo-arch/${_pkgname}"
license=(GPL2)
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
sha256sums=('cb219ca6ce1b4a31ec98701a43da51142c8bc7f15a22cb81dda93f881e6f6877')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  CPPFLAGS=-D_NERD make PREFIX=/usr
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man PREFIX=/usr install
}
