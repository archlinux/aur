# Maintainer: Justin Gross <jgross.biz@gmail.com>

pkgname=libpurple-carbon-git
pkgver=v0.1.0.r0.ge7735e5
pkgrel=1
pkgdesc="Exerimental XEP-0280: Message Carbons plugin for libpurple"
arch=(i686 x86_64)
url="https://github.com/justintime4tea/carbons.git"
license=('GPL2')
depends=('libpurple')
makedepends=('glib2' 'gcc' 'pkg-config' 'libxml2')
provides=('libpurple-carbons')
source=("libpurple-carbons-git::git+https://github.com/justintime4tea/carbons.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
