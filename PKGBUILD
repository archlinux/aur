# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='git-wt'
pkgver=0.24.0
pkgrel=1
pkgdesc='A Git subcommand that makes `git worktree` simple'
url='https://github.com/k1LoW/git-wt'

license=('MIT')
arch=('aarch64' 'x86_64')
depends=()
conflicts=()
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('bb1554b8806123e32bd354a70832b342b9a60ddbd5fcd2b0bbe4dabeaaf7ff33')
sha256sums_x86_64=('e0fbbabc4aa64c62a1ff24138c1a09d3f3c5b60bd5342f043c61aa24a5a0dbee')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/${pkgname} "$pkgdir/usr/bin/${pkgname}"
}

check() {
  ${srcdir}/${pkgname} --version
}
