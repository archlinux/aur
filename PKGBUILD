# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

pkgname=dotrix
pkgver=0.1.0
pkgrel=1
pkgdesc="The pedantic dotfiles manager"
arch=(i686 x86_64)
url="https://gitlab.com/dennis.hamester/dotrix"
license=('custom:ISC')
makedepends=('rust' 'cargo')
source=("dotrix-v$pkgver.tar.gz::https://gitlab.com/dennis.hamester/dotrix/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('33c1042cc0cc33cb57ddb747330f681642aa15384719cca9614fb9ab6a6311a7')

build() {
    cd $pkgname.git
    cargo build --release
}

package() {
    install -Dm755 "$srcdir"/$pkgname.git/target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 "$srcdir"/$pkgname.git/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
