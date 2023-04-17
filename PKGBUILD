# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=linuxwave
pkgname=$_pkgname-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Generate music from the entropy of Linux (binary release)"
arch=('x86_64')
url="https://github.com/orhun/linuxwave"
license=('MIT')
conflicts=($_pkgname)
provides=($_pkgname)
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.gz")
sha256sums_x86_64=('872f7632275e3fd0df3793c8f75132015d08d48b241844af324d54006da9dcf5')

package() {
  cd $_pkgname-$pkgver
  gzip -f man/$_pkgname.1
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 man/$_pkgname.1.gz -t "$pkgdir/usr/share/man/man1"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
}
