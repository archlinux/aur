# Maintainer: aksr <aksr at t-com dot me>
pkgname=psm-git
pkgver=0.7.6.gf1868a6
pkgrel=1
epoch=
pkgdesc="Simple, accurate memory reporting for Linux."
arch=('i686' 'x86_64')
url="https://github.com/bpowers/psm"
license=('MIT')
groups=()
depends=('')
makedepends=('git' 'go>=2:1-2' 'asciidoc' 'xmlto')
optdepends=()
checkdepends=()
provides=()
conflicts=('psm')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/bpowers/psm.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/--*/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  go build
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

