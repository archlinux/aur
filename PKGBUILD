# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=vivaldi-autoinject-custom-js-ui
pkgver=2020.11.22.9
pkgrel=1
pkgdesc='manage custom js UI mods for the vivaldi web browser'
arch=('any')
url='https://github.com/budlabs/vivaldi-autoinject-custom-js-ui'
license=('BSD')
groups=()
depends=('bash' 'sed' 'vivaldi')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
noextract=()
sha256sums=('5450c80514fc92b3824c7eac81e6a07b76c20ed5c3e225f40e480a46bda8f477')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
