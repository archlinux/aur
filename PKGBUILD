# Maintainer: Michael Arthur Long <adhaxclient at hotmail dot com>

_pkgname=min-ed-launcher
pkgname=${_pkgname}-bin
pkgver=v0.5.3
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
sha256sums=('f94fe90b98bb518f71b8144c0e8e8af24fe0b71823241a81570f5ed0d173489d'
            '1202a6afc4f6dcb177840ddaee878a01f73b7c0541f859c8e78f32fb5cb2906b'
            'e6827e6d4705ad29af2d87803f2824f9590af5650289aea005846baf5e58db4c')

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
