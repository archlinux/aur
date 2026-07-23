# Maintainer: dillacorn (AUR: dillacorn, Reddit: u/dillacorn)
pkgname=smtty
pkgver=13.6
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
sha256sums=('72f4ef919a60b2f3c9c8d764dcee50412c3b9845624be34b48445a808786d2da')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 smtty "${pkgdir}/usr/bin/smtty"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
