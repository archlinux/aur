# Maintainer: Scott Percival <code at moral.net.au>

pkgname=qm-dsp
pkgver=1.7.1
pkgrel=1
pkgdesc="A C++ library of functions for DSP and Music Informatics purposes"
arch=('i686' 'x86_64')
url="http://ardour.org/"
license=('GPL')
depends=()
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}::git://github.com/c4dm/qm-dsp.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -f build/linux/Makefile.linux32
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 -t ${pkgdir}/usr/lib libqm-dsp.a
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/base base/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/dsp/chromagram dsp/chromagram/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/dsp/keydetection dsp/keydetection/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/dsp/mfcc dsp/mfcc/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/dsp/onsets dsp/onsets/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/dsp/phasevocoder dsp/phasevocoder/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/dsp/rateconversion dsp/rateconversion/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/dsp/rhythm dsp/rhythm/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/dsp/segmentation dsp/segmentation/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/dsp/signalconditioning dsp/signalconditioning/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/dsp/tempotracking dsp/tempotracking/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/dsp/tonal dsp/tonal/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/dsp/transforms dsp/transforms/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/dsp/wavelet dsp/wavelet/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/maths maths/*.h 
  install -Dm644 -t ${pkgdir}/usr/include/qm-dsp/thread thread/*.h 

}

# vim:set ts=2 sw=2 et:
