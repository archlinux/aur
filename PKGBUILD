# Maintainer: aksr <aksr at t-com dot me>
pkgname=notify-cat-git
pkgver=r7.032e614
pkgrel=1
epoch=
pkgdesc="Turn a pipe into notifications"
arch=('i686' 'x86_64')
url="https://github.com/psychon/notify-cat"
license=('WTFPL')
categories=()
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('notify-cat')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/psychon/notify-cat.git")
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
  install -Dm755 notify-cat $pkgdir/usr/bin/notify-cat
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}

