# Maintainer: Maiko Tan <maiko.tan.coding@gmail.com>
pkgname=xc-bin
_pkgname=xc
pkgver=0.8.6
pkgrel=1
pkgdesc="Markdown defined task runner (binary release)."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/joerdav/xc"
license=('MIT')
depends=('glibc')
provides=('xc')
conflicts=('xc' 'xc-git')
if [[ $CARCH == x86_64 ]]; then
  source=("$pkgname-$pkgver.tar.gz::https://github.com/joerdav/xc/releases/download/v$pkgver/xc_${pkgver}_linux_amd64.tar.gz")
elif [[ $CARCH == i686 ]]; then
  source=("$pkgname-$pkgver.tar.gz::https://github.com/joerdav/xc/releases/download/v$pkgver/xc_${pkgver}_linux_386.tar.gz")
elif [[ $CARCH == armv7h ]]; then
  source=("$pkgname-$pkgver.tar.gz::https://github.com/joerdav/xc/releases/download/v$pkgver/xc_${pkgver}_linux_armv7.tar.gz")
elif [[ $CARCH == aarch64 ]]; then
  source=("$pkgname-$pkgver.tar.gz::https://github.com/joerdav/xc/releases/download/v$pkgver/xc_${pkgver}_linux_arm64.tar.gz")
fi
sha256sums=('5aeef7a285f2a67d9fdd0d6dc601c2e3072faacd2b0f5f023cc75704e99d27a9')

package() {
  install -Dm755 "$srcdir/xc" "$pkgdir/usr/bin/xc"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
