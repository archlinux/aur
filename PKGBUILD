# Maintainer: dillacorn (AUR: dillacorn, Reddit: u/dillacorn)
pkgname=smtty
pkgver=14.0
pkgrel=1
pkgdesc='TTY "Steam Machine" launcher that runs Steam Gamepad UI inside gamescope'
arch=('any')
url='https://github.com/dillacorn/smtty'
license=('MIT')

depends=('bash')
optdepends=(
  'steam: Steam client (Gamepad UI / Big Picture)'
  'gamescope: compositor wrapper used by smtty'
  'pciutils: lspci (GPU detection)'
  'curl: optional version check'
  'wget: optional version check'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dillacorn/smtty/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('58849569963f1433d278ffafaab0445266a110e469664ef67a41cf0129ca29d0')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 smtty "${pkgdir}/usr/bin/smtty"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
