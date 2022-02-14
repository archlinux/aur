# Maintainer: aksr <aksr at t-com dot me>
pkgname=leanify-git
pkgver=0.4.3.r193.ge3cedec
pkgrel=1
epoch=
pkgdesc="A lightweight lossless file minifier/optimizer."
arch=('i686' 'x86_64')
url="https://github.com/JayXon/Leanify"
license=('MIT')
categories=()
groups=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('leanify')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/JayXon/Leanify.git")
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
  install -Dm755 leanify $pkgdir/usr/bin/leanify
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

