# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=yank
pkgver=1.2.0
pkgrel=2
pkgdesc='Copy terminal output to clipboard'
arch=('i686' 'x86_64')
url='https://github.com/mptre/yank'
license=('MIT')
depends=('xsel')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("${url}/releases/download/v${pkgver}/${pkgname}-$pkgver.tar.gz")
sha256sums=('b500d1a71378e69a2a348032107e6d8db728b8f6af280a9bb4cb446c1d26e43a')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 yank "${pkgdir}"/usr/bin/yank
  install -Dm0644 yank.1 "${pkgdir}"/usr/share/man/man1/yank.1
  install -Dm0644 README.md "${pkgdir}"/usr/share/doc/${pkgname%-*}/README.md
  install -Dm0644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname%-*}/LICENSE
}

# vim:set ts=2 sw=2 et:
