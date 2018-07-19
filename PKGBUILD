# Maintainer: Daniël de Kok <me@danieldk.eu>
# Contributor: Brendan Abolivier <brendan@cozycloud.cc>
pkgname=xqilla
pkgver=2.3.4
pkgrel=2
pkgdesc="An XQuery and XPath 2.0 library, written in C++ and built on top of Xerces-C."
arch=("x86_64")
url="http://xqilla.sourceforge.net/"
license=("GPL3")
depends=("xerces-c" "icu")
# Temporarily use Ubuntu archive for the source tarball. Upstream modified the
# archive without bumping the version.
# source=("https://downloads.sourceforge.net/project/xqilla/XQilla-${pkgver}.tar.gz")
source=("http://archive.ubuntu.com/ubuntu/pool/universe/x/xqilla/xqilla_${pkgver}.orig.tar.gz")
sha256sums=('adfd4df011fcda08be3f51771006da23e852bac81e2fe63159beddc3633b3f55')

prepare() {
  cd "XQilla-${pkgver}"
}

build() {
  cd "XQilla-${pkgver}"
  ./configure --prefix=/usr --with-xerces=/usr
  make
}

package() {
  cd "XQilla-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
