# Maintainer: Tianyu Liu <lty1993[at]lty[dot]me>
pkgname=rwhoisd
pkgver=1.5.9.6
pkgrel=2
pkgdesc="RWhois (Referral Whois) is a Directory Services protocol which extends and enhances the Whois concept in a hierarchical and scalable fashion."
url="http://projects.arin.net/rwhois/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://projects.arin.net/rwhois/ftp/${pkgname}-${pkgver}.tar.gz")
sha256sums=('66793f02bc9370914ca3f579409e8f79b6a394b8a981168ead7b1a6654a83a2a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/opt 
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
