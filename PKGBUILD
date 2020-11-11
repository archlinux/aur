# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=cryptobox
pkgver=20201111.r11.da853cb
pkgrel=1
pkgdesc='A script that makes it easy to create, mount and unmount encrypted images in Linux using LUKS'
url='https://github.com/prurigro/cryptobox'
license=('GPL3')
depends=('coreutils' 'cryptsetup' 'util-linux')
makedepends=('git')
arch=('any')
source=("git://github.com/prurigro/${pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
}
