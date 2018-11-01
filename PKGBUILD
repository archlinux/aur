# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=yank
pkgver=1.1.0
pkgrel=1
pkgdesc='Copy terminal output to clipboard'
arch=('i686' 'x86_64')
url='https://github.com/mptre/yank'
license=('MIT')
depends=('xsel')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("${url}/releases/download/v${pkgver}/${pkgname}-$pkgver.tar.gz")
sha256sums=('f197107cd604c41ef3c2390175bd34e5ad3c7cf1feafedefe357ba75149f1c59')

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
