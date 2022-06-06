# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=xmille
pkgver=2.0
pkgrel=4
pkgdesc='A X11 mille borne game'
license=('unknown')
source=('https://master.dl.sourceforge.net/project/xmille/Xmille.tar.gz'
        'patch.diff'
        'patch2.diff')
sha256sums=('3520fe1936a38eccf641e5265ba46522358e3faf817ff1c4decee79f6b9bbf0c'
            'de9bfb716dcd3fedad019a96f93d5cb04d200cbab0f6ab16ccbe922d9cdb9200'
            '1366802562e1e92fd422bd789fc4c9eda93ff767d06ce72e6f375dabce924525')
arch=('x86_64')
depends=('libxext')

package() {
  cd "${srcdir}/Xmille"
  make install DESTDIR="${pkgdir}/usr"
  make install.man DESTDIR="${pkgdir}/usr/share"
}

prepare() {
  cd "${srcdir}/Xmille"
  patch <${startdir}/patch.diff
  patch <${startdir}/patch2.diff
}

build() {
  cd "${srcdir}/Xmille"
  make clean
  make
}
