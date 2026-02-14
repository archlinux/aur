# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='git-wt'
pkgver=0.21.1
pkgrel=1
pkgdesc='A Git subcommand that makes `git worktree` simple'
url='https://github.com/k1LoW/git-wt'

license=('MIT')
arch=('aarch64' 'x86_64')
depends=()
conflicts=()
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('f58f48d8745e8aad1d26c8b496599bef1543f6c54cb4d15acb6b6237d02193df')
sha256sums_x86_64=('9ac14bebbfaddee71935ca54f8969d0c47ab2cc050d9bf4c0e7c6139f3fdd88d')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/${pkgname} "$pkgdir/usr/bin/${pkgname}"
}

check() {
  ${srcdir}/${pkgname} --version
}
