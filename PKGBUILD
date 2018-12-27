# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: quomoow <quomoow@gmail.com>
# Contributor: Thomas Mudrunka <harvie@@email..cz>

pkgname=gretl
pkgver=2018d
pkgrel=1
pkgdesc='A cross-platform software package for econometric analysis, written in the C programming language'
arch=('x86_64')
url="http://gretl.sourceforge.net/"
license=('GPL')
options=('!makeflags')
depends=('gtksourceview3' 'curl' 'lapack' 'mpfr' 'fftw' 'gnuplot' 'gmp')
optdepends=('readline: provides a nice editable command line in gretlcli'
            'JSON-GLib: provides for parsing of data from various websites'
            'openmpi: provides means for dividing labor among multiple nodes')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('2a46cf04f495a660cf22922fdc53d75631d8ea1f1bf903affff792c3a194cffb')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr --disable-xdg-utils
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
