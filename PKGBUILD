# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_projectname=Fluida.lv2
pkgname="${_projectname,,}"
pkgver=0.7
pkgrel=2
pkgdesc="An LV2 plugin which wraps the fluidsynth SF2 soundfont player"
arch=('i686' 'x86_64')
url="https://github.com/brummer10/${_projectname}"
license=('GPL2')
depends=('cairo')
makedepends=('fluidsynth' 'lv2' 'xxd')
groups=('lv2-plugins' 'pro-audio')
source=("https://github.com/brummer10/Fluida.lv2/files/6329806/${_projectname%*.lv2}_${pkgver}.tar.gz")
sha256sums=('9334e7cf2019f79711fd00037953eeed6b1272e826497c2db014dc66a50315a8')


build() {
  cd "${srcdir}/${_projectname%*.lv2}_${pkgver}"
  make
}

package() {
  depends+=('libfluidsynth.so')
  cd "${srcdir}/${_projectname%*.lv2}_${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
