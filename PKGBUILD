# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=jaq-bin
pkgver=3.1.0
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
b2sums=('10d61e661ce660a1ec2b308958b783e4bc6ab5e27333e86659b6a16f20ac47cc8ebe465697246460a64c25df7421fe40badfcc232a6eec01bb86f7ed2193237c'
        'fb26aba82fe953b9895595c5b7c11b5363b83bd60cf1cb6aab572df6dadb940711eda080f8ad77fb519e79309211318b6200081bb05be7b71117a07082c3815d')
options=(!strip)

package() {
  install -Dm644 LICENSE-MIT -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm755 $pkgname-$pkgver "$pkgdir"/usr/bin/jaq
  ln -s "$pkgdir"/usr/bin/jq jaq
}
