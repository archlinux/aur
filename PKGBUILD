# Maintainer: fatalis <fatalis@fatalis.pw>
pkgname=scream-pulse
pkgver=3.0
pkgrel=1
pkgdesc='A scream receiver using pulseaudio as audio output'
arch=('x86_64')
depends=('pulseaudio')
url='https://github.com/duncanthrax/scream'
license=('custom:MS-PL')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('bd259e72875fb7f0d66e3a2e1576fb6d8d811feec645f52c6ac02eb948d5eced')

build() {
  cd "scream-${pkgver}/Receivers/pulseaudio"
  make
}

package() {
  cd "scream-${pkgver}"
  install -Dm755 "Receivers/pulseaudio/${pkgname}" "${pkgdir}/usr/bin/${pkgname}" 
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
