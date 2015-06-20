# Maintainer: Lothar_m <lothar_m at riseup dot net>
# Contributor: willemw <willemw12@gmail.com>
 
_pkgname=marrie
pkgname=$_pkgname-git
pkgver=0.3.2.r1.g565643e
pkgrel=3
pkgdesc="A simple podcast client that runs on the Command Line Interface."
arch=('i686' 'x86_64')
url="https://github.com/rafaelmartins/marrie"
license=('BSD')
makedepends=('git')
depends=('python2-feedparser')
optdepends=('wget: content downloading tool'
            'mplayer: video/audio playback support')
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git://github.com/rafaelmartins/marrie.git)
md5sums=('SKIP')
 
pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
 
build() {
  cd $_pkgname
  python2 setup.py build
}
 
package() {
  cd $_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

