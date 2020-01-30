# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=xlogin
pkgver=20160928
_gitver=6e566b5b399005c4f62e6c275f91a3625baa1bef
pkgrel=2
pkgdesc="Login to X without a desktop manager."
arch=('any')
url="https://github.com/joukewitteveen/xlogin"
depends=('bash' 'xorg-server')
makedepends=('git')
license=('GPL2')
source=("git+https://github.com/joukewitteveen/xlogin.git#commit=$_gitver")
backup=('etc/X11/xinit/xinitrc.d/25-xlogin.sh')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git log --date=iso -1 | sed -rn -e 's/-//g' -e 's/Date:\s+([0-9]+).*/\1/p'
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
