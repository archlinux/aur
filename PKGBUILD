# Maintainer: aksr <aksr at t-com dot me>
pkgname=mutt-solarized-git
pkgver=r12.3b23c55
pkgrel=1
pkgdesc="Solarized Colorscheme for Mutt."
arch=('any')
url="http://ethanschoonover.com/solarized"
license=('MIT')
makedepends=('git')
depends=('mutt')
conflicts=('mutt-solarized')
provides=('mutt-solarized')
install=mutt-solarized-git.install
source=("$pkgname::git+https://github.com/altercation/mutt-colors-solarized.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  directory="/usr/share/doc/mutt/colors/solarized/"
  mkdir -p $pkgdir/$directory
  install -m644 *.muttrc $pkgdir/$directory
  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
  install -Dm755 mutt-compile-colors.sh $pkgdir/usr/share/doc/$pkgname/mutt-compile-colors.sh
}

