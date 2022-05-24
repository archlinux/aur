# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=typiskt
pkgver=2022.05.24.1
pkgrel=1
pkgdesc='touchtype training in the terminal'
arch=('any')
url='https://github.com/budlabs/typiskt'
license=('BSD')
depends=('bash' 'bc' 'gawk' 'ncurses')
makedepends=('gawk')
optdepends=('curl')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('f539cc3dd2a541386f5d58774d489ef35744331b4f3c55be66e9c5c390755d5e')

# sha256sums=('SKIP')
# url='file:///home/bud/git/lab/typiskt'
# source=("${pkgname}-${pkgver}::git+$url")

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
