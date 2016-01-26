# Maintainer: Michael Straube <m.s.online gmx.de>

pkgname=vlc-pause-click-plugin
pkgver=0.2.1
pkgrel=1
pkgdesc='This plugin allows you to pause/play a video by clicking on the video image.'
arch=('i686' 'x86_64')
license=('LGPL')
url='https://github.com/nurupo/vlc-pause-click-plugin'
depends=('vlc')
install=pause-click.install
source=("https://github.com/nurupo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c8252f388729546d34d15327fbd477f99cf7a9faf81b422e7d6e27a16b6bdc63')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/vlc-2.2.x+/"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/vlc-2.2.x+/"
  make DESTDIR="${pkgdir}" install
}
