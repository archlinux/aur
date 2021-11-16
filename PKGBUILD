# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=cryptobox
pkgver=20211115.r14.d939c56
pkgrel=1
pkgdesc='A script that makes it easy to create, mount and unmount encrypted images in Linux using LUKS'
url='https://github.com/prurigro/cryptobox'
license=('MIT')
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
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
