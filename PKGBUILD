# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: quomoow <quomoow@gmail.com>
# Contributor: Thomas Mudrunka <harvie@@email..cz>

pkgname=gretl
pkgver=2019b
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
sha256sums=('7ee8846c2fe9a0b745fd1cb8439c31c376241fbb1de4182b698086efcf722131')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr --disable-xdg-utils
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
