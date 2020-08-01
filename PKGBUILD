# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=lmms-beta-bin
_basever=1.2.2
# _rc=rc8
#pkgver=${_basever}_${_rc}
pkgver=${_basever}
pkgrel=1
pkgdesc='Beta version of the Linux MultiMedia Studio.'
arch=('x86_64')
url='https://lmms.io/'
license=('GPL')
depends=('fuse2' 'sdl' 'glib2' 'fluidsynth' 'libpng' 'libvorbis' 'libxft' 'libxinerama' 'qt5-base' 'qt5-x11extras' 'sdl_sound'
         'libsamplerate' 'shared-mime-info' 'fltk')
optdepends=('wine: VST support (experimental)'
            'fftw: SpectrumAnalyzer plugin'
            'stk: STK instruments plugins'
            'pulseaudio: PulseAudio output'
            'libgig: needed for decoding .gig files')
options=('!strip')
# "lmms.AppImage::https://github.com/LMMS/lmms/releases/download/v${_basever}-${_rc}/lmms-${_basever}-${_rc}-linux-x86_64.AppImage"
source=("lmms.AppImage::https://github.com/LMMS/lmms/releases/download/v${_basever}/lmms-${_basever}-linux-x86_64.AppImage"
        "lmms-beta"
        "lmms-beta.desktop")
sha256sums=('6cdc45a0699b8cd85295c49bcac03fcce6f3d8ffd7da23d646d0cb4258869b76'
            '784119511992d86354edd1b1a39e32adb5168dd63af0eb44838e9aa579270bed'
            '804266e15b21d4c5d003897a29f75e03927898bf17255ff4da6c0468cd56adc4')

package() {
  mkdir -p "$pkgdir"/opt/lmms-beta/
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/applications/
  
  install -Dm755 lmms.AppImage -t "$pkgdir"/opt/lmms-beta/
  install -Dm755 lmms-beta -t "$pkgdir"/usr/bin/
  install -Dm755 lmms-beta.desktop -t "$pkgdir"/usr/share/applications/
}
