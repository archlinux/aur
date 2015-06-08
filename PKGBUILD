# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Thomas Zervogiannis <tzervo@gmail.com>
# Contributor: Patrick Palka <patrick@parcs.ath.cx>

pkgname=cliweather-git
pkgver=1.0.r2.g55c51f8
pkgrel=1
pkgdesc="Simple CLI for Google's weather API"
url="https://github.com/AaronFoltz/cliweather"
arch=('any')
license=('WTFPL')
depends=('python2')
makedepends=('git')
source=($pkgname::git://github.com/AaronFoltz/cliweather)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i "s|python[ \t]*$|python2|" cliweather
}

package() {
  cd $pkgname
  install -Dm755 cliweather "$pkgdir/usr/bin/cliweather"
  install -Dm644 README.md "$pkgdir/usr/share/cliweather/README.md"
}

