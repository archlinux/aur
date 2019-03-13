# Maintainer: Alexandros Theodotou <alex@zrythm.org>
pkgname=zrythm
pkgver=0.1.046
pkgrel=1
pkgdesc="An highly automated, intuitive, Digital Audio Workstation (DAW)"
arch=( 'x86_64' )
url='https://git.zrythm.org/zrythm/zrythm'
license=( 'GPL3' )
depends=('gtk3' 'lv2' 'lilv' 'libx11' 'jack' 'libsndfile' 'breeze-icons' 'libyaml'
         'portaudio' 'libsamplerate')
makedepends=('python')
conflicts=( 'zrythm-git' )
source=( "https://git.zrythm.org/zrythm/${pkgname}/-/archive/v$pkgver/${pkgname}-v$pkgver.tar.gz" )
md5sums=( 'f8d32689e578413f57a5e5ae4bd66f9a' )

rootdir="${pkgname}-v${pkgver}"

build() {
  cd ${rootdir}/
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd ${rootdir}/
  make DESTDIR="${pkgdir}/" install
}
