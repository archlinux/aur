# Maintainer: danieltetraquark

pkgname=pishrink-git
_name=pishrink
pkgver=r124.43f1a88
pkgrel=1
pkgdesc="Make your pi images smaller!"
makedepends=('git')
depends=()
license=('MIT')
arch=('any')
url="https://github.com/Drewsif/PiShrink"
source=(${pkgname}::git+$url)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 pishrink.sh "$pkgdir/usr/bin/pishrink.sh"
}
