# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=pacmarge
pkgver=1
pkgrel=2
pkgdesc="A tool for automatically merging .pacnew files"
arch=('any')
url="https://github.com/foutrelis/pacmarge"
license=('ISC')
depends=('bash' 'pacman-contrib' 'git' 'coreutils' 'sed' 'diffutils' 'patch')
makedepends=('asciidoc')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/foutrelis/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('75591848d74834042e61268a4d3c3530885413f7c90a772ca17f0b56d122bb1f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
