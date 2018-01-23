# Maintainer: Jordan MacDonald <jordan(at)wastedintelligence(dot)com>
pkgname=amp
pkgver=0.3.1
pkgrel=1
pkgdesc='A modal text editor for the terminal.'
arch=('x86_64')
url='https://github.com/jmacdonald/amp'
license=('GPL3')
depends=('libxcb')
makedepends=('rust' 'git' 'python' 'cmake' 'libxcb')
source=("https://github.com/jmacdonald/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('4824c9c12d740da48963155633ead215f28099defb35cb9b50cda2a2f7a5eb3266b9df914f907247a887d8d67329b9df2d1c47011dd0aad49bf94a7120105a71')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/amp" "$pkgdir/usr/bin/amp"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
