# Maintainer: Brodi Elwood <brodielwood@gmail.com>

pkgname=vandelay-bin
_pkgname=vandelay
pkgver=1.0.0
pkgrel=1
pkgdesc='Migration and backup tool that imports mail/calendar/contacts and exports to JMAP'
arch=('x86_64' 'aarch64')
url='https://github.com/stalwartlabs/vandelay'
license=('Apache-2.0' 'MIT')
depends=('glibc' 'gcc-libs')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip')

source=("$_pkgname-$pkgver-Apache-2.0.txt::https://raw.githubusercontent.com/stalwartlabs/vandelay/v$pkgver/LICENSES/Apache-2.0.txt"
        "$_pkgname-$pkgver-MIT.txt::https://raw.githubusercontent.com/stalwartlabs/vandelay/v$pkgver/LICENSES/MIT.txt")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.xz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.xz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.xz")

sha256sums=('a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2'
            '23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3')
sha256sums_x86_64=('32ea0ef35e4098cf947d18803d6df01464a629737dcae5d9e211ed57e8244aa8')
sha256sums_aarch64=('2057abf07a16b028fc1a8a0d949c3fe8273fa6eb1cf2316baca26d90b8a3c6a4')

package() {
    local _dir="$_pkgname-$CARCH-unknown-linux-gnu"

    install -Dm755 "$_dir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$_dir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 "$_dir/CHANGELOG.md" "$pkgdir/usr/share/doc/$_pkgname/CHANGELOG.md"

    install -Dm644 "$_pkgname-$pkgver-Apache-2.0.txt" "$pkgdir/usr/share/licenses/$_pkgname/Apache-2.0.txt"
    install -Dm644 "$_pkgname-$pkgver-MIT.txt" "$pkgdir/usr/share/licenses/$_pkgname/MIT.txt"
}
