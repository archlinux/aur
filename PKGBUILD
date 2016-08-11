# Contributor: flu
# Maintainer: aksr <aksr at t-com dot me>
pkgname=yank-git
pkgver=0.7.0.r2.g2e78c28
pkgrel=1
epoch=
pkgdesc="Yank terminal output to clipboard"
arch=('i686' 'x86_64')
url="https://github.com/mptre/yank"
license=('MIT')
categories=()
groups=()
depends=('xsel')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('yank')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/mptre/yank.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/"/usr install
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

