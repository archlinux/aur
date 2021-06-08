# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='stagit-gopher'
pkgver=0.9.6
pkgrel=1
pkgdesc='Static gopher site generator for git version control'
arch=('x86_64')
url='https://codemadness.org/stagit-gopher.html'
_url_source='https://codemadness.org/releases/stagit-gopher'
license=('MIT')
depends=('libgit2')
optdepends=(
  'geomyidae: small c-based gopherd'
  'git: scripting functionality'
)
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('567d7630feebbce247e448c9485f23bc239014a289c0984504e4038d67cac8fbe6c6dcb46451662cd035b054b2ad561d6b8a42e2087ac042b69d70c14bf5991c')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
