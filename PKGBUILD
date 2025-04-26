# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=jaq-bin
pkgver=2.2.0
pkgrel=1
pkgdesc='A jq clone focused on correctness, speed, and simplicity'
url='https://github.com/01mf02/jaq'
arch=(x86_64 i686 aarch64)
license=(MIT)
conflicts=('jq' 'jaq')
provides=('jq' "jaq=$pkgver")
depends=('gcc-libs' 'glibc')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/jaq-$CARCH-unknown-linux-gnu"
        "https://raw.githubusercontent.com/01mf02/jaq/7a3466f/LICENSE-MIT")
b2sums=('42a72b607768dbb4e0b90b228830b498e82b486042c50a8250af6dd887adb66ccedc1d187148d83b1e0aa56d8532993d7bc0d2bc9c2e9af16ebf92103de8ffca'
        'fb26aba82fe953b9895595c5b7c11b5363b83bd60cf1cb6aab572df6dadb940711eda080f8ad77fb519e79309211318b6200081bb05be7b71117a07082c3815d')
options=(!strip)

package() {
  install -Dm644 LICENSE-MIT -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm755 $pkgname-$pkgver "$pkgdir"/usr/bin/jaq
  ln -s "$pkgdir"/usr/bin/jq jaq
}
