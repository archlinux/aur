# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Benjamin Andresen <benny@klapmuetz.org>
# Contributor: Thomas Baechler <thomas.baechler@rwth-aachen.de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=bin2iso
pkgver=2.0
pkgrel=1
pkgdesc="Converts RAW format (.bin/.cue) files to ISO/WAV format"
arch=(x86_64 i686 pentium4 armv7h aarch64)
url="https://gitlab.com/bunnylin/bin2iso"
#url="https://xpt.sourceforge.net/techdocs/media/video/dvdvcd/dv09-NonIsoCDFormats/ar01s10.html"
license=(WTFPL)
depends=(glibc)
source=("https://gitlab.com/bunnylin/bin2iso/-/archive/${pkgver}/bin2iso-${pkgver}.tar.gz")
sha256sums=('c96af43f331e58b40a6fc0934b4a232003f65136aa40e29882519205de72e428')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 bin2iso -t "${pkgdir}/usr/bin/"
}

