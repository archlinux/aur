# Maintainer: Jaël Champagne Gareau <gareau_jael@hotmail.com>
# Contributor:
pkgname=clustertool-bin
pkgver=2.0.6
pkgrel=1
pkgdesc="Tool to help bootstrap a Kubernetes cluster"
arch=('x86_64')
url="https://truecharts.org"
license=('BUSL-1.1')
options=("!debug")
source=("https://github.com/truecharts/public/releases/download/v${pkgver}/clustertool_${pkgver}_linux_amd64.pkg.tar.zst"
        "https://raw.githubusercontent.com/truecharts/public/refs/heads/master/clustertool.LICENSE")
sha256sums=('76b43795d4945e553fd4c4747b8edf27f21ea7405f8d3d12e101169dbe561d53'
            '90b97d8e350b71ab689daaa3dbcb9fe752da2d821caba1952caf8ce614d6c72e')

package() {
  # Extract the main package, excluding debug files and metadata
  bsdtar --exclude=.MTREE --exclude=.PKGINFO -xf "${srcdir}/clustertool_${pkgver}_linux_amd64.pkg.tar.zst" -C "$pkgdir"

  # Install the license
  install -Dm644 "${srcdir}/clustertool.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
