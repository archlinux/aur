# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pyhenkan-git
pkgver=r53.52a09aa
pkgrel=1
pkgdesc='Python Transcoding Tools'
arch=('any')
url='https://github.com/alucryd/pyhenkan'
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
provides=('pyhenkan')
conflicts=('pyhenkan')
source=('git+https://github.com/alucryd/pyhenkan.git')
sha256sums=('SKIP')

pkgver() {
  cd pyhenkan

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd pyhenkan

  python setup.py build
}

package(){
  cd pyhenkan

  python setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
