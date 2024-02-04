# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=typiskt
pkgver=2022.07.24
pkgrel=1
pkgdesc='touchtype training in the terminal'
arch=('any')
url='https://github.com/budlabs/typiskt'
license=('BSD')
depends=('bash' 'bc' 'gawk' 'ncurses')
# makedepends=('gawk')
optdepends=('curl')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('227be4406d7004625455352c379792baceca4ede086b901bccca7075be33d258')

# sha256sums=('SKIP')
# url='file:///home/bud/git/lab/typiskt'
# source=("${pkgname}-${pkgver}::git+$url")

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
