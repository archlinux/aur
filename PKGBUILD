# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=shellfirm-bin
_pkgname=shellfirm
pkgver=0.4.2
pkgrel=1
pkgdesc='Intercept any risky patterns (default or defined by you) and prompt you a small challenge for double verification'
arch=('x86_64' 'aarch64')
url='https://github.com/kaplanelad/shellfirm'
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'openssl-3')
options=('!debug')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.xz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-linux.tar.xz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.xz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-linux.tar.xz")
sha256sums=('4c2493df918ecca8c9f36292661f81a504d5ff7101dede8980d71fbf463f7f4f')
sha256sums_x86_64=('b00d5ec25084e79251ab7a000a338bb9f0d285cf05143c280db8e1364ab072a7')
sha256sums_aarch64=('b06b8fa59d92c06cdf82b9eeda33a4accf9610f2ea3a4f3a1a88c8b6c72660a5')

package() {
    install -Dm755 "$srcdir/$_pkgname-v$pkgver-$CARCH-linux/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    cp -r docs/. "$pkgdir/usr/share/doc/$_pkgname/"
}
