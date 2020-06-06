# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=saait
pkgver=0.7.1
pkgrel=1
pkgdesc="The most boring static page generator"
arch=('x86_64')
url="https://codemadness.org/${pkgname}.html"
license=('custom:ISC license')
source=("https://codemadness.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
depends=('glibc')
makedepends=('gcc-libs')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
sha256sums=('cba86b0c01ef1ff7aa154de4c45f720acb9d18c8f397af1a2642aadb7e8bdd35')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}