# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=yank
pkgver=0.8.2
pkgrel=1
pkgdesc='Copy terminal output to clipboard'
arch=('i686' 'x86_64')
url="https://github.com/mptre/yank"
license=("MIT")
depends=("xsel")
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("${url}/archive/v$pkgver.tar.gz")
sha1sums=('3219d15e24bdca03a79212320bdb53ba5a3c1286')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 yank "${pkgdir}"/usr/bin/yank
  install -Dm0644 README.md "${pkgdir}"/usr/share/doc/${pkgname%-*}/README.md
  install -Dm0644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname%-*}/LICENSE
}

# vim:set ts=2 sw=2 et:
