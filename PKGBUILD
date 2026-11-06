# Maintainer: robertfoster
pkgname=openrig-bin
pkgver=0.11.0 # renovate: datasource=github-releases depName=Siryu6/OpenRig
pkgrel=1
pkgdesc="Open-source guitar multi-effects pedalboard: NAM, LV2 and impulse responses"
arch=(x86_64 aarch64)
url="https://github.com/Siryu6/OpenRig"
license=(GPL-3.0-or-later)
depends=(alsa-lib fontconfig glibc libgcc libstdc++ lilv serd
  libglvnd libx11 libxcb libxcursor libxi libxkbcommon libxkbcommon-x11 libxrender wayland)
optdepends=('jack: JACK audio backend')
provides=(openrig)
conflicts=(openrig)
source_x86_64=("${url}/releases/download/v${pkgver}/openrig-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/openrig-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('4a4b549154e4eaa0b89929ec2930dfd41c70733663cebea3489784f8dda8c093')
sha256sums_aarch64=('d2b03f9a53a2b76616ca78d770410260b1ce9405e04fda2d4e431996072ceb97')

package() {
  cd "openrig-${pkgver}-linux-${CARCH}"
  install -Dm755 pedalboard "${pkgdir}/usr/bin/openrig"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
