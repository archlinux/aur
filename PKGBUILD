# Maintainer: ceri <ceri@dev.null>
pkgname=apkeep
pkgver=0.15.0
pkgrel=1
pkgdesc='Tool for downloading android APK files from various sources'
url='https://github.com/EFForg/apkeep'
source=("$pkgver.tar.gz::https://github.com/EFForg/apkeep/archive/$pkgver.tar.gz")
arch=('i686' 'x86_64' 'arm' 'armv7h' 'aarch64')
license=('custom:MIT')
depends=('openssl' 'gcc-libs')
makedepends=('rust>=1.56.1')
sha256sums=('439815cc2eb75df1235bb1106135548af2465e47486df6d1742cd47c0bd687dc')

build () {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 target/release/apkeep "${pkgdir}/usr/bin/apkeep"
}
 
