# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=genmonify
pkgver=2022.06.03.1
pkgrel=1
pkgdesc='precision control for xfce4-panels genmon plugin'
arch=('any')
url='https://github.com/budlabs/genmonify'
license=('BSD')
depends=('bash' 'sed' 'gawk' 'xfce4-genmon-plugin')
makedepends=(gawk)
optdepends=()

source=("$url/archive/$pkgver.tar.gz")
sha256sums=('e59e7df4c49dbdac701a24417afa65316fcff64e7c9a4538968bef9568be7f4e')

# sha256sums=('SKIP')
# url="file:///home/bud/git/lab/$pkgname"
# source=("${pkgname}-${pkgver}::git+$url")

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
