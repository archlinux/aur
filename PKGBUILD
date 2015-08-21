# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pyanimenc-git
pkgver=r50.a4b1d9f
pkgrel=1
pkgdesc='Python Transcoding Tools'
arch=('any')
url='https://github.com/alucryd/pyanimenc'
license=('GPL3')
depends=('ffmpeg' 'python-gobject' 'python-lxml' 'python-pymediainfo'
         'vapoursynth')
makedepends=('git' 'python-setuptools')
optdepends=('faac: faac encoder'
            'fdkaac: fdkaac encoder'
            'lame: lame encoder'
            'opus-tools: Opus encoder'
            'vapoursynth-plugin-flash3kyuu_deband-git: f3kdb deband filter'
            'vapoursynth-plugin-fluxsmooth-git: FluxSmooth denoise filters'
            'vapoursynth-plugin-ffms2: ffms2 source filter'
            'vapoursynth-plugin-lsmashsource: L-SMASH source filters'
            'vapoursynth-plugin-temporalsoften-git: TemporalSoften denoise filter'
            'vorbis-tools: Vorbis encoder'
            'x264: x264 and x264-10bit encoders'
            'x265: x265, x265-10bit and x265-12bit encoders')
provides=('pyanimenc')
conflicts=('pyanimenc')
source=('git+https://github.com/alucryd/pyanimenc.git')
sha256sums=('SKIP')

pkgver() {
  cd pyanimenc

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd pyanimenc

  python setup.py build
}

package(){
  cd pyanimenc

  python setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
