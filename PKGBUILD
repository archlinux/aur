# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>
# Contributor: quellen <lodgerz@gmail.com>

pkgname='epub2txt'
pkgver=2.08
pkgrel=1
pkgdesc='Extract text from EPUB documents'
arch=('x86_64')
url='https://github.com/kevinboone/epub2txt2'
license=('GPL-3.0-or-later')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0936a6344754881543ec6b9d79ca2a0f89c3348f82688f485283e547c5fecfe1')

build() {
  make -C "${pkgname}2-${pkgver}"
}

package() {
  cd "${pkgname}2-${pkgver}"
  install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "man1/${pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

