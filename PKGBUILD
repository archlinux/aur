pkgname=mono-addins
pkgver=1.3
pkgrel=1
pkgdesc="Generic framework for creating extensible applications, and for creating libraries which extend those applications."
arch=(i686 x86_64)
license=('custom:MIT')
url="http://www.mono-project.com/Mono.Addins/"
depends=('gtk-sharp-2'  'mono')
makedepends=('git' 'pkgconfig')
options=('!makeflags')
provides=('mono-addins=1.3')
source=(git://github.com/mono/mono-addins.git)
md5sums=('SKIP')

build() {
  cd "${srcdir}"/${pkgname}

  ./autogen.sh --prefix=/usr --enable-gui
  make
}

package() {
  cd "${srcdir}"/${pkgname}
  make DESTDIR="${pkgdir}" install
}
