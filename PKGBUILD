# Maintainer: l42 <i at tfwno dot gf>
pkgname=stretchly-bin
_pkgname=Stretchly
pkgver=1.0.0
pkgrel=3
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
sha256sums=('368b077ff202f61bef22dbc3ab907420177c1d5c3ac094a72883232c47ae72d2'
            '16dbfd55e41847ca5a82055ba15bc5c23aa96a49ba38200f26226b740b2f11d0')

package() {
	# copy binaries to fakeroot
	cp -r opt usr ${pkgdir}

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
