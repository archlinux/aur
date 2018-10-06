# Maintainer: Jordan MacDonald <jordan(at)wastedintelligence(dot)com>
pkgname=amp
pkgver=0.5.1
pkgrel=1
pkgdesc='A modal text editor for the terminal.'
arch=('x86_64')
url='https://github.com/jmacdonald/amp'
license=('GPL3')
depends=('libxcb')
makedepends=('rust' 'git' 'python' 'cmake' 'libxcb')
source=("https://github.com/jmacdonald/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('dfe959a4e7a721a13c0c05e09b61ba5d93dd4fae8d779a3847720fdffe66f3f08a953b3cb97ec3753c22e5b36649fcbd47b6f2ab1053590a8e4d231b92ebeff5')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/amp" "$pkgdir/usr/bin/amp"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
