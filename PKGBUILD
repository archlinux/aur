# Maintainer: l42 <i at tfwno dot gf>
pkgname=stretchly-bin
_pkgname=Stretchly
pkgver=1.3.0
pkgrel=1
_rlsver=v1.3.0
pkgdesc="The break time reminder app"
arch=('x86_64')
url="https://github.com/hovancik/stretchly/"
license=('BSD')
provides=('stretchly')
conflicts=('stretchly')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
install=${_pkgname}.install
source=(
  "https://github.com/hovancik/stretchly/releases/download/$_rlsver/$_pkgname-$pkgver.pacman"
  "LICENSE::https://raw.githubusercontent.com/hovancik/stretchly/$_rlsver/LICENSE"
)
sha256sums=('61a94553dc912389d2601b859c25e24f12655695d84fd7d5bae7ef2b034fcf0b'
            'd4262f71a6c02b19bdbdf760033803c0c7ca24acf2591ba425633f7e3315790a')

package() {
	# copy binaries to fakeroot
	cp -r opt usr ${pkgdir}

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
