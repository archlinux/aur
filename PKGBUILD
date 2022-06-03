# Maintainer:  budRich
# Contributor: budRich

pkgname=gurl
pkgver=2022.05.27.1
pkgrel=1
pkgdesc='ganoo slash URL handler and plumber framework'
arch=('any')
url="https://github.com/budlabs/$pkgname"
license=('BSD')
groups=()
depends=('bash>=4.0.0')
makedepends=(gawk)
optdepends=()

source=("$url/archive/$pkgver.tar.gz")
sha256sums=('1b985451dfa67526a3fc87b5aa4f1d79ad5dd10200f7d2d80e09c3a96c1fdc46')

# sha256sums=('SKIP')
# url="file:///home/bud/git/lab/$pkgname"
# source=("${pkgname}-${pkgver}::git+$url")

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
