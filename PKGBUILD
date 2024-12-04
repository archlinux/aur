# Maintainer: Jaël Champagne Gareau <gareau_jael@hotmail.com>
# Contributor:
pkgname=clustertool-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool to help bootstrap a Kubernetes cluster"
arch=('x86_64')
url="https://truecharts.org"
license=('BUSL-1.1')
options=("!debug")
source=("https://github.com/truecharts/public/releases/download/v${pkgver}/clustertool_${pkgver}_linux_amd64.pkg.tar.zst"
        "https://raw.githubusercontent.com/truecharts/public/refs/heads/master/clustertool.LICENSE")
sha256sums=('5fc03c4a4b977717b493797e382935b1d25dac3b7ec9a0279c533d379c12458d'
            '90b97d8e350b71ab689daaa3dbcb9fe752da2d821caba1952caf8ce614d6c72e')

package() {
  # Extract the main package, excluding debug files and metadata
  bsdtar --exclude=.MTREE --exclude=.PKGINFO -xf "${srcdir}/clustertool_${pkgver}_linux_amd64.pkg.tar.zst" -C "$pkgdir"

  # Install the license
  install -Dm644 "${srcdir}/clustertool.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
