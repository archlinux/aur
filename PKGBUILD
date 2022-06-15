# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=genmonify
pkgver=2022.06.16.1
pkgrel=1
pkgdesc='precision control for xfce4-panels genmon plugin'
arch=('any')
url='https://github.com/budlabs/genmonify'
license=('BSD')
depends=('bash' 'sed' 'gawk' 'xfce4-genmon-plugin')
makedepends=(gawk)
optdepends=()

source=("$url/archive/$pkgver.tar.gz")
sha256sums=('b332460880d47acbc992def1f20ea100e4b3efbe90e0f3cf88cfeeb83ac23953')

# sha256sums=('SKIP')
# url="file:///home/bud/git/lab/$pkgname"
# source=("${pkgname}-${pkgver}::git+$url")

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
