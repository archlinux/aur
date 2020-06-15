# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=saait
pkgver=0.7.1
pkgrel=2
pkgdesc='The most boring static page generator'
arch=('x86_64')
url='https://codemadness.org/saait.html'
license=('ISC')
source=("https://codemadness.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cba86b0c01ef1ff7aa154de4c45f720acb9d18c8f397af1a2642aadb7e8bdd35')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${pkgname}-${pkgver}" install
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et: