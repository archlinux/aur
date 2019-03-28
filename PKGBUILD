# Maintainer: Alexandros Theodotou <alex@zrythm.org>
pkgname=zrythm
pkgver=0.2.046
pkgrel=1
pkgdesc="An highly automated, intuitive, Digital Audio Workstation (DAW)"
arch=( 'x86_64' )
url='https://git.zrythm.org/zrythm/zrythm'
license=( 'GPL3' )
depends=('gtk3' 'lv2' 'lilv' 'libx11' 'jack' 'libsndfile' 'libyaml' 'gettext'
         'portaudio' 'libsamplerate')
makedepends=('python' 'gettext' 'sed')
conflicts=( 'zrythm-git' )
source=( "https://git.zrythm.org/zrythm/${pkgname}/-/archive/v$pkgver/${pkgname}-v$pkgver.tar.gz" )
md5sums=( '9873c6f8c63857e4eb8b0478f67bdd76' )

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
