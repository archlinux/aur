# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=lmms-beta-bin
_basever=1.2.0
_rc=rc6
pkgver=${_basever}_${_rc}
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
source=("lmms.AppImage::https://github.com/LMMS/lmms/releases/download/v${_basever}-${_rc}/lmms-${_basever}-${_rc}-linux-x86_64.AppImage"
        "lmms-beta"
        "lmms-beta.desktop")
sha1sums=('e8bcd46a305e0c43a786f8e83b2ecf31413d5cf1'
          '1ac832190a5c3cde4ba1fad3cfe3725dd9c269a5'
          'f77c37a31050c94cac403ce9ef6b9074cb96456c')

package() {
  mkdir -p "$pkgdir"/opt/lmms-beta/
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/applications/
  
  install -Dm755 lmms.AppImage -t "$pkgdir"/opt/lmms-beta/
  install -Dm755 lmms-beta -t "$pkgdir"/usr/bin/
  install -Dm755 lmms-beta.desktop -t "$pkgdir"/usr/share/applications/
}
