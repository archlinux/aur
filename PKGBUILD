# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=pacmarge
pkgver=0.r1.ca743cd
pkgrel=1
pkgdesc="A tool to automatically merge .pacnew files (hopefully correctly!)"
arch=('any')
url="https://github.com/foutrelis/pacmarge"
license=('ISC')
depends=('pacman' 'diffutils' 'patch' 'git')
install=$pkgname.install
source=(git+https://github.com/foutrelis/pacmarge.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -D scripts/pacmarge "$pkgdir/usr/bin/pacmarge"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
