# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=tunnelto-bin
_gitname=${pkgname%-bin}
pkgver=0.1.14
pkgrel=3
pkgdesc="Expose your local web server to the internet with a public URL."
arch=('any')
url="https://tunnelto.dev/"
license=('MIT')
makedepends=('cargo')
conflicts=('tunnelto')
provides=('tunnelto')
source=("tunnelto-linux-$pkgver.tar.gz::https://github.com/agrinman/$_gitname/releases/download/$pkgver/tunnelto-linux.tar.gz" "https://raw.githubusercontent.com/agrinman/$_gitname/$pkgver/LICENSE")
sha256sums=('edeb7ede6b6823b65aac742844de01090515e42268f544aa8b69b9ea1ad591b4' '4cebbaca47e31d07a63c35507d43daf85daaf0e34408263c433dff6022415ba2')

package() {
  # install binary
  install -Dm 755 "${srcdir}/tunnelto" -t "${pkgdir}/usr/bin"
  # install license
  install -Dm 644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
