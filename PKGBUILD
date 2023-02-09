# Maintainer: budRich von budlabs
# Contributor: budRich

pkgname=pkg-listn-git
pkgver=r42.1c21f8d
pkgrel=1
pkgdesc='Manage linux packages with a textfile'
arch=('any')
url='https://github.com/budRich/pkg-listn'
# url='file:///home/bud/git/bud/pkg-listn'
license=('Unlicense')
depends=('bash>=4.0.0' 'sed')
makedepends=(m4)
optdepends=('yay: AUR helper' 'paru: AUR helper')
conflicts=()
source=("${pkgname}::git+$url")
provides=()
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
