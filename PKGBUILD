pkgname=mono-addins-git
_pkgname=mono-addins
pkgver=1.3.1
pkgrel=3
pkgdesc="Generic framework for creating extensible applications, and for creating libraries which extend those applications."
arch=(i686 x86_64)
license=('custom:MIT')
url="http://www.mono-project.com/Mono.Addins/"
depends=('mono' 'gtk-sharp-2')
makedepends=('git' 'pkgconfig')
options=('!makeflags')
provides=('mono-addins=1.3.1')
source=(git://github.com/mono/mono-addins.git)
md5sums=('SKIP')

build() {
  cd "${srcdir}"/${_pkgname}

  ./autogen.sh --prefix=/usr --enable-gui
  make
}

package() {
  cd "${srcdir}"/${_pkgname}
  make DESTDIR="${pkgdir}" install
}
