# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='git-wt'
pkgver=0.26.2
pkgrel=1
pkgdesc='A Git subcommand that makes `git worktree` simple'
url='https://github.com/k1LoW/git-wt'

license=('MIT')
arch=('aarch64' 'x86_64')
depends=()
conflicts=()
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('4451249aeee8f66c3190c4106f524c95736d40ca6a62009a50d50da9a7f9eb5a')
sha256sums_x86_64=('19ceb0365a4faf755868e87dd1382ffdfc2a4905402d47faf9fc91eca19e09c0')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/${pkgname} "$pkgdir/usr/bin/${pkgname}"
}

check() {
  ${srcdir}/${pkgname} --version
}
