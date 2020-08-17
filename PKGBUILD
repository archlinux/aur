# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=stagit-gopher
pkgver=0.9.4
pkgrel=1
pkgdesc='Static gopher site generator for git version control'
arch=('x86_64')
url='https://codemadness.org/stagit-gopher.html'
license=('MIT')
depends=('libgit2')
optdepends=('geomyidae: small c-based gopherd'
            'git: scripting functionality')
source=("https://codemadness.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('afcbf4ddcd88454ff239b892365f5b0df8de442474e06b60adb0f94d45a3cd73')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${pkgname}-${pkgver}" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/LICENSE"
}

# vim: ts=2 sw=2 et:
