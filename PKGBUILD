# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=yank
pkgver=0.8.1
pkgrel=1
pkgdesc='Copy terminal output to clipboard'
arch=('i686' 'x86_64')
url="https://github.com/mptre/yank"
license=("MIT")
depends=("xsel")
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("${url}/archive/v$pkgver.tar.gz")
sha1sums=('b6fc9648dab28b5559d346a9036126e2db275fbe')

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
