# Maintainer: l42 <i at tfwno dot gf>
pkgname=stretchly-bin
_pkgname=Stretchly
pkgver=1.21.0 # renovate: datasource=github-tags depName=hovancik/stretchly
pkgrel=2
_rlsver=v$pkgver
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

sha256sums=('1cda17a79c97f5103711cc8f96470e6dce93cf7b15b22d1a5985e33be0d8f593')
sha256sums_x86_64=('6584a08a352c20cff0657d13d36d282a12407f11632fa57164053e7647c09ad4')
sha256sums_aarch64=('96a4a347b53e3efc8be128e967f2aa547fb7130bb35170b222ed4df24cd38be2')

package() {
	# copy binaries to fakeroot
	cp -r opt usr ${pkgdir}

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
