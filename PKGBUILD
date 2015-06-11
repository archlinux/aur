# Maintainer : jyantis <yantis@yantis.net>
# Contributor: jjdanimoth <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=emerald-themes
pkgver=0.8.10
pkgrel=1
pkgdesc="Themes for emerald"
arch=('any')
url="http://www.northfield.ws/projects/compiz"
license=('GPL')
depends=('emerald')
makedepends=('intltool' 'pkgconfig')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
conflicts=('emerald-themes-git')
source=('http://www.northfield.ws/projects/compiz/releases/0.8.10/emerald-themes.tar.gz')
sha256sums=('07224509f85f37f3e080a50532a43bf5e5cbcfdc92faae14df42966648be85d0')

build() {
  cd emerald-themes
  ./autogen.sh 
  ./configure --prefix=/usr 
  make
}

package() {
  cd emerald-themes
  make DESTDIR=${pkgdir} install 
}
