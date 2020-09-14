# Maintainer: l42 <i at tfwno dot gf>
pkgname=stretchly-bin
_pkgname=Stretchly
pkgver=1.1.0
pkgrel=1
_rlsver=v1.1.0
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
sha256sums=('ccbd8423752cc9fae635e7470a95b606326e00939be2a737befa9a09769cdb79'
            'd4262f71a6c02b19bdbdf760033803c0c7ca24acf2591ba425633f7e3315790a')

package() {
	# copy binaries to fakeroot
	cp -r opt usr ${pkgdir}

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
