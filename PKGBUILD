# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=yank
pkgver=1.0.0
pkgrel=2
pkgdesc='Copy terminal output to clipboard'
arch=('i686' 'x86_64')
url='https://github.com/mptre/yank'
license=('MIT')
depends=('xsel')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
# https://github.com/mptre/yank/releases/download/v$%7BV%7D/yank-$%7BV%7D.tar.gz
source=("${url}/releases/download/v${pkgver}/${pkgname}-$pkgver.tar.gz")
sha256sums=('20ba1b01a7514f2f670702e83846f42429e2e90491dc1f679c8319a45a0382de')

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
