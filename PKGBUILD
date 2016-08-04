# Maintainer: aksr <aksr at t-com dot me>
pkgname=fileprune-git
pkgver=1.10.r36.ge60da14
pkgrel=1
epoch=
pkgdesc="Prune a file set according to a given age distribution"
arch=('i686' 'x86_64')
url="https://github.com/dspinellis/fileprune"
url="http://www.spinellis.gr/sw/unix/fileprune/"
license=('Apache')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('fileprune')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/dspinellis/fileprune.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^R//'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

