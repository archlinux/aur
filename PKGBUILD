# Maintainer: Valentin-Costel Haloiu <vially.ichb+aur@gmail.com>

pkgname=volumectl
pkgver=0.1.0
pkgrel=2
pkgdesc="A command line utility to control the volume"
arch=('x86_64')
url="https://github.com/vially/volumectl"
license=(MIT)
depends=('pulse-native-provider')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vially/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('b9d935e1da512a36716c6bcc62f5e51e9e58ee835d87733ae15c93fb2954969df04e7ede5b7994a628efb094ba2f1e19a78e91290960412099db17c707755f92')

_gourl=github.com/vially/volumectl
_gitroot="https://github.com/vially/volumectl.git"

build() {
  cd $pkgname-$pkgver
  go build .
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
