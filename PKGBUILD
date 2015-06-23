# Maintainer: aksr <aksr at t-com dot me>
pkgname=jchroot-git
pkgver=r25.8b1ca1c
pkgrel=1
epoch=
pkgdesc="A chroot with more isolation."
arch=('i686' 'x86_64')
url="https://github.com/vincentbernat/jchroot"
license=('ISC')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/vincentbernat/jchroot")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  unset CPPFLAGS
  make jchroot
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 jchroot $pkgdir/usr/bin/jchroot
  install -Dm644 jchroot.8 $pkgdir/usr/share/man/man8/jchroot.8
  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README
}

