# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pyhenkan-git
pkgver=r83.2b4fb75
pkgrel=1
pkgdesc='Transcoding suite built around VapourSynth and FFmpeg'
arch=('any')
url='https://github.com/alucryd/pyhenkan'
license=('GPL3')
depends=('ffmpeg' 'python-gobject' 'python-lxml' 'python-pymediainfo'
         'vapoursynth' 'vapoursynth-plugin-lsmashsource')
makedepends=('git' 'python-setuptools')
optdepends=('ffmpeg-full: More codecs'
            'vapoursynth-plugin-f3kdb: f3kdb deband filter'
            'vapoursynth-plugin-fluxsmooth: FluxSmooth denoise filters'
            'vapoursynth-plugin-ffms2: ffms2 source filter'
            'vapoursynth-plugin-temporalsoften-git: TemporalSoften denoise filter')
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
