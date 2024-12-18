# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=jaq-bin
pkgver=2.0.1
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
b2sums=('909f8b2278c86bc62e4f89b5db7eda05cb648e0f6be09026f8c180783a131f2c00a906d835073a7ce4d9b3e3856048867a34eab31c53d93ca61e208cb55a141c'
        'fb26aba82fe953b9895595c5b7c11b5363b83bd60cf1cb6aab572df6dadb940711eda080f8ad77fb519e79309211318b6200081bb05be7b71117a07082c3815d')
options=(!strip)

package() {
  install -Dm644 LICENSE-MIT -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm755 $pkgname-$pkgver "$pkgdir"/usr/bin/jaq
  ln -s "$pkgdir"/usr/bin/jq jaq
}
