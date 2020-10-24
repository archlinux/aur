# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='saait'
pkgver=0.7.1
pkgrel=2
pkgdesc='Fast and simple static site generator'
arch=('x86_64')
url='https://codemadness.org/saait.html'
_url_source='https://codemadness.org/releases/saait'
license=('ISC')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cba86b0c01ef1ff7aa154de4c45f720acb9d18c8f397af1a2642aadb7e8bdd35')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
