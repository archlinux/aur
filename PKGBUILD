# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=frink
pkgver=2.2.2
pkgrel=1
pkgdesc="Frink is a tcl formatting and static check program. It can prettify your program, minimise, obfuscate or just sanity check it. It can also do some rewriting."
url="http://catless.ncl.ac.uk/Programs/Frink/"
arch=('x86_64' 'i686')
license=('Other')
depends=('tcl')
optdepends=()
makedepends=(gcc make)
conflicts=()
replaces=()
backup=()
install=
source=("http://hpux.connect.org.uk/ftp/hpux/Development/Languages/frink-2.2.2/frink-2.2.2-src-11.11.tar.gz")

md5sums=('24841aa401c932fb6c0aac6af02d92ed')

build() {
  tar xzf frink-${pkgver}-src-11.11.tar.gz
  cd frink-${pkgver}
  ./configure --prefix=/usr
  make
  }

package() {
  cd frink-${pkgver}
  make DESTDIR="${pkgdir}" install
  }
