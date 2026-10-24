# Maintainer: GreenVenom77 <hosome2222 at gmail dot com>

_pkgname=ktfmt
pkgname=$_pkgname-bin
pkgver=0.65
pkgrel=1
pkgdesc='A program that reformats Kotlin source code to comply with the common community standard for Kotlin code conventions (prebuilt native binary)'
url='https://github.com/Kotlin/ktfmt'
arch=('x86_64')
license=('Apache-2.0')
depends=('glibc')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip')
source=("$_pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64-$pkgver.tar.gz"
        "$_pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/Kotlin/$_pkgname/refs/tags/v$pkgver/LICENSE")
sha256sums=('3684327b092db9b76fffcb9525decf73f8331ed17e00ce3232769c11cd36d352'
            '5f1521fb886be393d8afc4655ab7c6ffe84e1d4f15dfd321ceec3ce62968d058')

package() {
  install -Dm755 "$srcdir/$_pkgname-linux-x86_64-$pkgver/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
