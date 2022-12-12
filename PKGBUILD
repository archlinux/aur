# Maintainer: Michael Arthur Long <adhaxclient at hotmail dot com>

_pkgname=min-ed-launcher
pkgname=${_pkgname}-bin
pkgver=v0.7.5
pkgrel=1
pkgdesc="Minimal Elite Dangerous Launcher"
arch=('x86_64')
url="https://github.com/Rfvgyhn/min-ed-launcher"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
install="${_pkgname}.install"
changelog=CHANGELOG.md
source=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux-x64.tar.gz"
	"CHANGELOG.md"
	"${_pkgname}.install")
sha512sums=('3e410c55c0aaab9b55d607bf39ca3d453fa96a58477e905ad3b16702f8608e6f034ed8fab58b29bfbabb46e00d87c5526292ddc2e12673f62b11f22c64054743'
            '18158e743b05c4c151097c86812aeded370b322d0d3c3fed657cac4f6c8177c02c35130a364f916a933241b5075663f9ebde7a79a31db51cced6c85f82974c57'
            '94416c923681cb959293c740a4e4fe54fff97188bfa6ab90fb6eac4296474f43bf2515f42c754bc0c8f13bb981ffa392ebe9b41aa887e27b6a9e14db910438e0')

package() {
  # Make directory
  install -d "$pkgdir"/opt/min-ed-launcher
  install -d "$pkgdir"/usr/bin

  # Copy files
  cd "$srcdir/${_pkgname}_${pkgver}_linux-x64"
  install -Dm644 CHANGELOG.md "$pkgdir"/opt/min-ed-launcher/CHANGELOG.md
  install -Dm755 MinEdLauncher "$pkgdir"/opt/min-ed-launcher/MinEdLauncher
  install -Dm644 README.md "$pkgdir"/opt/min-ed-launcher/README.md

  # Make symlink
  ln -sf /opt/min-ed-launcher/MinEdLauncher "$pkgdir"/usr/bin/MinEdLauncher
}
