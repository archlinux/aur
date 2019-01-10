# Maintainer: fatalis <fatalis@fatalis.pw>
pkgname=scream-pulse
pkgver=2.0
pkgrel=1
pkgdesc='A scream receiver using pulseaudio as audio output'
arch=('x86_64')
depends=('pulseaudio')
url='https://github.com/duncanthrax/scream'
license=('unknown')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('c8940ee9012cdc2c92737eeb2325a0481261f4b11e8911c5be2332f5a7220623')

build() {
  cd "scream-${pkgver}/Receivers/pulseaudio"
  make
}

package() {
  cd "scream-${pkgver}/Receivers/pulseaudio"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}" 
}
