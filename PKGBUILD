# Maintainer: aksr <aksr at t-com dot me>
pkgname=jaypack-git
pkgver=r2.bdb16f2
pkgrel=1
epoch=
pkgdesc="A simple, crude utility to scan a hard disk surface and find/salvage JPEG files off of it."
arch=('i686' 'x86_64')
url="https://github.com/geomaster/jaypack/"
license=('MIT')
categories=()
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('jaypack')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/geomaster/jaypack.git")
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
  install -Dm755 jaypack $pkgdir/usr/bin/jaypack
  install -Dm755 jaypack-client $pkgdir/usr/bin/jaypack-client
  install -Dm755 jaypack-server $pkgdir/usr/bin/jaypack-server
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

