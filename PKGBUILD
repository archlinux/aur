# Maintainer: PSposito <http://bit.do/linuxer> 
# 			      <https://gitlab.com/psposito>
# Maintainer: Justin Vreeland <vreeland.justin@gmail.com>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Charles Pigott <charlespigott@googlemail.com>
# Contributor: Andrei "Garoth" Thorp <garoth "at the nice" gmail "dot" com>

pkgname=debhelpergit
aliasname=debhelper
pkgver=12.10
pkgrel=1
pkgdesc="A collection of programs that can be used in a debian/rules file to automate common tasks"
arch=('any')
url="https://salsa.debian.org/debian/debhelper.git/"
license=('GPL2' 'GPL3')
depends=('binutils' 'dpkg>=1.16.2' 'file>=3.23' 'html2text' 'man-db>=2.5.1' 'perl>=5.6.0' 'po-debconf')
makedepends=('po4a>=0.24' 'man-db>=2.5.1' 'file>=3.23' 'git')
optdepends=('dh-make')
source=("git+https://salsa.debian.org/debian//debhelper.git#tag=debian/$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$aliasname"
  make
}

package() {
  cd "$srcdir/$aliasname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
