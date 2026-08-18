# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=ccusage-statusline-rs-bin
_pkgname=ccusage-statusline-rs
pkgver=1.13.0
pkgrel=1
pkgdesc="Fast statusline for Claude Code w/usage tracking, billing blocks, burn rate monitoring"
arch=('x86_64' 'aarch64')
url="https://github.com/ticpu/ccusage-statusline-rs"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
validpgpkeys=('E5998E49DC9E1DCFDB9B46EC77EBA10790CFFCCD')
source=("$_pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.xz"
        "$_pkgname-$pkgver.tar.xz.asc::$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.xz.asc")
source_x86_64=("$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64"
               "$_pkgname-$pkgver-x86_64.asc::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.asc")
source_aarch64=("$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64"
                "$_pkgname-$pkgver-aarch64.asc::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.asc")
sha256sums=('864a5f3e58047b489745716f0e15c993a2cbde45b6b3f825d515da0c1115d368'
            'SKIP')
sha256sums_x86_64=('a8a0d195df3d137319cd2add271b712f88f5c7077019b5053cdfbc60e62d2c01'
                   'SKIP')
sha256sums_aarch64=('8dd96a6415ff8b933f964975f5a811d36ac46b49cedaa97a6614c17d8388eab4'
                    'SKIP')

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
    cd "$_pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
