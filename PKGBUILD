# Maintainer: fatalis <fatalis@fatalis.pw>
pkgname=scream-pulse
pkgver=1.3
pkgrel=1
pkgdesc='A scream receiver using pulseaudio as audio output'
arch=('x86_64')
depends=('pulseaudio')
url='https://github.com/duncanthrax/scream'
license=('unknown')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('ed08ef864ef561d95dfad976b14974421b427d7f444893c60a7737aec64f11ce')

build() {
  cd "scream-${pkgver}/Receivers/pulseaudio"
  make
}

package() {
  cd "scream-${pkgver}/Receivers/pulseaudio"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}" 
}
