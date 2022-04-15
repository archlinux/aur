# Maintainer: Nils Kvist <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=bashbud
pkgver=2022.04.15.2
_pkgver=2.0.0
pkgrel=1
pkgdesc='make(1) bash scripting better'
arch=('any')
# url="file://${HOME}/git/lab/${pkgname}OLD"
url='https://github.com/budlabs/bashbud'
license=('MIT')
groups=()
depends=('bash>=4.0.0')
makedepends=(gawk lowdown)
source=("$url/archive/$_pkgver.tar.gz")
# source=("${pkgname}::git+$url")
noextract=()
sha256sums=('56b3e78295a9448a066ff521ff215e88b4e1115b170ac374f5e9341e44ba8a5e')

package() {
  cd "$pkgname-$_pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
