# Maintainer: aksr <aksr at t-com dot me>
pkgname=fileweight-git
pkgver=r14.141108b
pkgrel=1
epoch=
pkgdesc="How much does a file weigh?"
arch=('i686' 'x86_64')
url="https://github.com/dertuxmalwieder/fileweight"
license=('WTFPL2')
categories=()
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cc -o fileweight fileweight.c
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 fileweight $pkgdir/usr/bin/fileweight
  install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}

