# Maintainer: l42 <i at tfwno dot gf>
pkgname=stretchly-bin
_pkgname=Stretchly
pkgver=1.0.0
pkgrel=2
_rlsver=v1.0.0
pkgdesc="Break time reminder app"
arch=('x86_64')
url="https://github.com/hovancik/stretchly/"
license=('BSD')
provides=('stretchly')
conflicts=('stretchly')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
install=${_pkgname}.install
source=(
  "https://github.com/hovancik/stretchly/releases/download/$_rlsver/$_pkgname-$pkgver.pacman"
  "LICENSE::https://github.com/hovancik/stretchly/blob/$_rlsver/LICENSE"
)
sha256sums=(
  '368b077ff202f61bef22dbc3ab907420177c1d5c3ac094a72883232c47ae72d2'
  'f3ef648ba055efa4299fcb25d7d6cef232caa72e1a9461b3a29cfdd0812940c7'
)

package() {
	# copy binaries to fakeroot
	cp -r opt usr ${pkgdir}

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
