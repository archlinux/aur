# Maintainer: Pablo Moyano (p4block)
pkgname=polarisbioseditor-git
pkgver=r41.31add7b
pkgrel=1
pkgdesc="BIOS editor for AMD Polaris cards"
arch=('x86_64')
url="https://github.com/jaschaknack/PolarisBiosEditor"
license=('GPL3')
depends=('mono')
makedepends=('git')
source=("git+https://github.com/jaschaknack/PolarisBiosEditor.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/PolarisBiosEditor
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/PolarisBiosEditor
  ./build.sh
}

package() {
  cd $srcdir/PolarisBiosEditor
  install -Dm755 PolarisBiosEditor.exe  "${pkgdir}/usr/bin/polarisbioseditor"
}

