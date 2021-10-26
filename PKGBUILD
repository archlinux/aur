# Maintainer: suliman altassan <suliman.p2019@gmail.com>

pkgname=alusus
pkgver=0.8.1
pkgrel=4
pkgdesc="ALUSUS PROGRAMMING LANGUAGE - لغة الأسس البرمجية"
arch=('x86_64')
url="https://alusus.org/"
license=('custom')
makedepends=('python' 'python-pip' 'cmake' 'git')
md5sums=('SKIP')
source=("$pkgname"::"git+https://github.com/Alusus/Alusus.git")

prepare() {
    cd $srcdir/$pkgname
    git checkout v$pkgver
}

build() {
  cd "$srcdir/$pkgname"
	mkdir -p opt/Alusus
	./Tools/build.sh --bloc . --iloc opt/Alusus --btype r
}

package() {
  cd "$srcdir/$pkgname"
  cp -r "opt/" "$pkgdir/opt/"
}
