# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='git-wt'
pkgver=0.15.1
pkgrel=1
pkgdesc='A Git subcommand that makes `git worktree` simple'
url='https://github.com/k1LoW/git-wt'

license=('MIT')
arch=('aarch64' 'x86_64')
depends=()
conflicts=()
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('dded48a826ca311194bd92bd58a0ea9adec281b347105c56cc317d5a267d555b')
sha256sums_x86_64=('18ac6f62a69f2a5bb59a037074cfa0cdfa1924f2098890af2add64b0f6c2b76b')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/${pkgname} "$pkgdir/usr/bin/${pkgname}"
}

check() {
  ${srcdir}/${pkgname} --version
}
