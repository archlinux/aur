# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pyanimenc-git
pkgver=r41.66af141
pkgrel=1
pkgdesc='Python Transcoding Tools'
arch=('any')
url='https://github.com/alucryd/pyanimenc'
license=('GPL3')
depends=('ffms2' 'python-gobject' 'python-lxml' 'vapoursynth')
makedepends=('git' 'python-setuptools')
optdepends=('fdkaac: fdkaac encoder'
            'lame: lame encoder'
            'vapoursynth-plugin-flash3kyuu_deband-git: f3kdb deband filter'
            'vapoursynth-plugin-fluxsmooth-git: FluxSmooth denoise filters'
            'vapoursynth-plugin-lsmashsource-git: L-SMASH source filters'
            'vapoursynth-plugin-temporalsoften-git: TemporalSoften denoise filter'
            'x264: x264 and x264-10bit encoders'
            'x265: x265 encoder')
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
