# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=jellyshot-git
pkgver=r37.feb3ecc
pkgrel=1
pkgdesc="A simple screenshot and uploading tool"
arch=('any')
url="https://github.com/jelly/jellyshot"
license=('MIT')
depends=('imagemagick' 'openssh')
optdepends=('optipng: compress png for upload')
makedepends=('git')
source=("$pkgname::git+https://github.com/jelly/jellyshot.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -d $pkgdir/usr/bin/
  install -Dm755 jellyshot $pkgdir/usr/bin/
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
