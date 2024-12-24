# Maintainer: l42 <i at tfwno dot gf>
pkgname=stretchly-bin
_pkgname=Stretchly
pkgver=1.17.0
pkgrel=2
_rlsver=v1.17.0
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
sha256sums_x86_64=('668ca00c71badbf4ca27719437d9b685adab468d7b8469350fcbefc0ce9d3b50')
sha256sums_aarch64=('6dfcf9c7d74695e3a195300922df22b13c47ccad39e9ec2d63c180ef52675ef9')

package() {
	# copy binaries to fakeroot
	cp -r opt usr ${pkgdir}

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
