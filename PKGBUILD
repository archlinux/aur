# Maintainer: Jian Zeng <anonymousknight96 AT gmail.com>

pkgname=su-exec
pkgver=0.2
pkgrel=1
pkgdesc='switch user and group id, setgroups and exec'
arch=('i686' 'x86_64')
url='https://github.com/ncopa/su-exec'
license=('MIT')
makedepends=('gcc')
source=("https://github.com/ncopa/su-exec/archive/v$pkgver.tar.gz")
sha256sums=('ec4acbd8cde6ceeb2be67eda1f46c709758af6db35cacbcde41baac349855e25')

build() {
    cd "$pkgname-$pkgver" || exit 1
    gcc -O2 -Wall -Werror -o "$pkgname" su-exec.c
}

package() {
    cd "$pkgname-$pkgver" || exit 1
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
