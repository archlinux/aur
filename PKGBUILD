# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=shellfirm-bin
_pkgname=shellfirm
pkgver=0.4.1
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
sha256sums=('97ba51d3428ad39856e95b52aaebe95f42b859ba7c30b3cfeb09b0bf05c4fa41')
sha256sums_x86_64=('625a398446ec72ec1a10da7c5f8381fa91c2e48dfd9e397f381b1b0bcbaf008f')
sha256sums_aarch64=('9142365b7ea679ccc93d2ca4e8410ca1d1a343fd350474132248b9a1a369bd23')

package() {
    install -Dm755 "$srcdir/$_pkgname-v$pkgver-$CARCH-linux/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    cp -r docs/. "$pkgdir/usr/share/doc/$_pkgname/"
}
