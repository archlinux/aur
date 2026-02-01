# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='git-wt'
pkgver=0.17.0
pkgrel=1
pkgdesc='A Git subcommand that makes `git worktree` simple'
url='https://github.com/k1LoW/git-wt'

license=('MIT')
arch=('aarch64' 'x86_64')
depends=()
conflicts=()
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('37eee880929bd356f88d134c394ccc2a748882389ff81ec94b002d3c443fad4d')
sha256sums_x86_64=('dc56818ddb1bd13f9ddfb7f59a2e5a3b1244cf4d0bf9ffc1ddec6338c38a4685')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/${pkgname} "$pkgdir/usr/bin/${pkgname}"
}

check() {
  ${srcdir}/${pkgname} --version
}
