# Maintainer: Carter Green <crtrgreen@gmail.com>
# Contributor: Mario Aichinger <aichingm@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ccat
pkgver=1.1.0
pkgrel=3
pkgdesc="Colorizes output for cat."
arch=('any')
url="https://github.com/jingweno/ccat"
license=('CUSTOM')
makedepends=('go' 'git')
conflicts=('ccat-git' 'ccrypt')
options=('!strip' '!emptydirs')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b02d2c8d573f5d73595657c7854c9019d3bd2d9e6361b66ce811937ffd2bfbe1')

build() {
  cd "${pkgname}-${pkgver}"
  msg2 'Building...'
  ./script/build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

