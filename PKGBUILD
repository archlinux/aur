# Maintainer: dillacorn (AUR: dillacorn, Reddit: u/dillacorn)
pkgname=smtty
pkgver=13.5
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
sha256sums=('fc9fa82c20f5f2caa84b041eaaedd29a90e8a65da2a28a7cbf5a29af08e32987')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 smtty "${pkgdir}/usr/bin/smtty"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
