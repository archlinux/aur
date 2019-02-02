# Maintainer: Nils Kvist <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=bashbud
pkgver=2019.02.02.7
pkgrel=1
pkgdesc='Generate documents and manage projects'
arch=('any')
url='https://github.com/budlabs/bashbud'
license=('MIT')
groups=()
depends=('bash>=4.0.0')
makedepends=()
optdepends=('go-md2man: generate man page with default template')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/budlabs/$pkgname/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('2f437bd1f3190a49a024bd640456ffb128adc3f6def618519d4757582da91e8b')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
