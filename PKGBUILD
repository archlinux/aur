# Maintainer: SneakySnake <radiantstatue@gmail.com>
# Submit issues/pull requests at https://github.com/crumblingstatue/pkgbuilds

pkgname=portaudio-svn
pkgver=1913
pkgrel=1
pkgdesc='A Free, cross platform, open-source, audio I/O library.'
arch=('i686' 'x86_64')
url="http://www.portaudio.com"
license=('custom')
depends=('gcc-libs' 'jack')
makedepends=('subversion')
conflicts=('portaudio')
provides=('portaudio')
options=('!libtool')
source=("${pkgname}::svn+https://subversion.assembla.com/svn/portaudio/portaudio/trunk/")
md5sums=('SKIP')

build() {
  cd $pkgname
  ./configure --prefix=/usr --enable-cxx
  make -j1
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
