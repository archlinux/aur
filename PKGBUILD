# Maintainer: Pavlo Ilin <ilin.pa@gmail.com>
# Contributor: swiftscythe <swiftscythe@gmail.com>

pkgname=gigolo-git
pkgver=0.4.2.r34.g803dd15
pkgrel=1
epoch=1
pkgdesc="Frontend to manage connections to remote filesystems using GIO/GVFS"
arch=(i686 x86_64)
url="http://goodies.xfce.org/projects/applications/gigolo"
license=('GPL2')
groups=('xfce4-git')
depends=('gtk2')
makedepends=('git' 'xfce4-dev-tools')
provides=("gigolo")
conflicts=('gigolo')
source=("$pkgname::git://git.xfce.org/apps/gigolo")

noextract=()
md5sums=('SKIP')


pkgver() {
  cd $pkgname
  git describe --long | sed -E 's/gigolo.//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  ./autogen.sh  
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}
