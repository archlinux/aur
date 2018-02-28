# Maintainer: Ramana Kumar <firstname|@|member.fsf.org>
# Contributor: Lars Hupel <lars@hupel.info>
pkgname=opentheory
epoch=1
pkgver=1.3.20180226
pkgrel=1
pkgdesc="a tool for processing higher-order logic theory packages"
arch=('i686' 'x86_64')
url="http://www.gilith.com/software/opentheory"
license=('MIT')
groups=()
depends=()
makedepends=(mlton)
source=("https://github.com/gilith/$pkgname/releases/download/v$pkgver/$pkgname.tar.gz")
sha256sums=('888ad4fa39af1c918e83cb3f6e0efe67662bb6d5a4e967df5292cc338a5e9521')

build() {
  cd "$srcdir/$pkgname"
  make mlton
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp -p "$srcdir/$pkgname/bin/mlton/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
