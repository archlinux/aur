# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=tunnelto-bin
_gitname=${pkgname%-bin}
pkgver=0.1.15
pkgrel=1
pkgdesc="Expose your local web server to the internet with a public URL."
arch=('any')
url="https://tunnelto.dev/"
license=('MIT')
makedepends=('cargo')
conflicts=('tunnelto')
provides=('tunnelto')
source=("tunnelto-linux-$pkgver.tar.gz::https://github.com/agrinman/$_gitname/releases/download/$pkgver/tunnelto-linux.tar.gz" "https://raw.githubusercontent.com/agrinman/$_gitname/$pkgver/LICENSE")
sha256sums=('f531c3892acb44c13b11fa94f3dd07915d766b02be52ad76f9fe2d998a52fd4f' '4cebbaca47e31d07a63c35507d43daf85daaf0e34408263c433dff6022415ba2')

package() {
  # install binary
  install -Dm 755 "${srcdir}/tunnelto" -t "${pkgdir}/usr/bin"
  # install license
  install -Dm 644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
