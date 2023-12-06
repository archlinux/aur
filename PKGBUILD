# Maintainer: l42 <i at tfwno dot gf>
pkgname=stretchly-bin
_pkgname=Stretchly
pkgver=1.15.1
pkgrel=2
_rlsver=v1.15.1
pkgdesc="The break time reminder app"
arch=('x86_64' 'aarch64')
url="https://github.com/hovancik/stretchly/"
license=('BSD')
provides=('stretchly')
conflicts=('stretchly')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify')
optdepends=(
  'libappindicator-gtk2: sys tray support (GTK+ 2)'
  'libappindicator-gtk3: sys tray support (GTK+ 3)'
)
install=${_pkgname}.install

source=("LICENSE::https://raw.githubusercontent.com/hovancik/stretchly/$_rlsver/LICENSE")
source_x86_64=("https://github.com/hovancik/stretchly/releases/download/$_rlsver/$_pkgname-$pkgver.pacman")
source_aarch64=("https://github.com/hovancik/stretchly/releases/download/$_rlsver/$_pkgname-$pkgver-aarch64.pacman")

sha256sums=('d4262f71a6c02b19bdbdf760033803c0c7ca24acf2591ba425633f7e3315790a')
sha256sums_x86_64=('edb0f5d62ac53da08ac658d44aa5c22c82b1f02e4e0b52efe8dc2fb34073f09f')
sha256sums_aarch64=('a9bef8b1414a807971ebafc39b57772e065a3b209f299ae049af8193e51bbd32')

package() {
	# copy binaries to fakeroot
	cp -r opt usr ${pkgdir}

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
