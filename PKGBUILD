# Maintainer: Matrix <thysupremematrix atttttttttt tuta dottttttt io>

_pkgname=fluentui-system-icons
pkgname=ttf-fluentui-system-icons-git
pkgver=1.1.293.r416.g64e5aa7
pkgrel=1
epoch=1
pkgdesc="A collection of familiar, friendly and modern icons from Microsoft."
arch=(any)
url='https://aka.ms/fluentui-system-icons'
license=('MIT')
makedepends=('git')
source=("git+https://github.com/microsoft/fluentui-system-icons.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/fluentui-system-icons"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/fluentui-system-icons/fonts
  for i in *.ttf; do
    install -Dm755 "$i" "/$pkgdir/usr/share/fonts/$_pkgname/$i"
  done
  install -Dm644 $srcdir/fluentui-system-icons/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
