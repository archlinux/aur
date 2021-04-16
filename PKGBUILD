# Maintainer: l42 <i at tfwno dot gf>
pkgname=stretchly-bin
_pkgname=Stretchly
pkgver=1.6.0
pkgrel=1
_rlsver=v1.6.0
pkgdesc="The break time reminder app"
arch=('x86_64' 'aarch64')
url="https://github.com/hovancik/stretchly/"
license=('BSD')
provides=('stretchly')
conflicts=('stretchly')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
install=${_pkgname}.install

source=("LICENSE::https://raw.githubusercontent.com/hovancik/stretchly/$_rlsver/LICENSE")
source_x86_64=("https://github.com/hovancik/stretchly/releases/download/$_rlsver/$_pkgname-$pkgver.pacman")
source_aarch64=("https://github.com/hovancik/stretchly/releases/download/$_rlsver/$_pkgname-$pkgver-aarch64.pacman")

sha256sums=('d4262f71a6c02b19bdbdf760033803c0c7ca24acf2591ba425633f7e3315790a')
sha256sums_x86_64=('6df19fe942de7f2ac7007e5b8a99b76088b6781f38344242bd4b7b332dbbde61')
sha256sums_aarch64=('aa6456ae57258c3e833d1ef71f0a472d3e5c37e9e158393581075cee06b3accb')

package() {
	# copy binaries to fakeroot
	cp -r opt usr ${pkgdir}

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
