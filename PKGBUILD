# Maintainer: aksr <aksr at t-com dot me>
pkgname=sqlrpt-git
pkgver=r13.8d8bba3
pkgrel=1
epoch=
pkgdesc="Render SQLite query as groff table for convenient in-terminal viewing or printing"
arch=('i686' 'x86_64')
url="https://github.com/jklowden/sqlrpt"
license=('BSD')
categories=()
groups=()
depends=('')
makedepends=('git')
optdepends=('groff')
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/jklowden/sqlrpt.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 sqlrpt   $pkgdir/usr/bin/sqlrpt
  install -Dm644 sqlrpt.1 $pkgdir/usr/share/man/man1/sqlrpt.1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
  install -Dm644 readme.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}

