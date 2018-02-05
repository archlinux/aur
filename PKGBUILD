# Maintainer: JoshuaRLi <joshua.r.li.98 at gmail com>
# Please submit comments/issues here: https://github.com/JoshuaRLi/PKGBUILDs

pkgname=vape
pkgver=0.1.3
pkgrel=1
pkgdesc="A command-line tool that converts text into 'vaporwave' text."
arch=('x86_64')
_ghrepo_=vape
url="https://github.com/JoshuaRLi/${_ghrepo_}"
license=('MIT')
makedepends=('rust')

source_x86_64=("${url}/archive/v${pkgver}.tar.gz")
sha512sums_x86_64=('3c17c2b909e3b5f15435c4471ceceb5b512005635a08159a0ef0b7d60bf1f4ecf55b5a0d87d796ae35cfaa14e824b0fe471b633b78417fdc4a43b95afc5340fb')

_srcdir_="${_ghrepo_}-${pkgver}"

build () {
  cd "$_srcdir_"
  cargo build --release
}

check () {
  cd "$_srcdir_"
  cargo test --release
}

package () {
  cd "$_srcdir_"
  install -Dm 755 "target/release/vape" "${pkgdir}/usr/bin/vape"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
