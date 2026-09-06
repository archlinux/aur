# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=ccusage-statusline-rs-bin
_pkgname=ccusage-statusline-rs
pkgver=1.15.0
pkgrel=1
pkgdesc="Fast statusline for Claude Code w/usage tracking, billing blocks, burn rate monitoring"
arch=('x86_64' 'aarch64')
url="https://github.com/ticpu/ccusage-statusline-rs"
license=('MIT')
depends=()
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
sha256sums=('de77161b4b86eafd26e0f993427a3b373a5ea6a060b5ae1cb7e955a0a61dc80d'
            'SKIP')
sha256sums_x86_64=('9ff0ba58894959319d6bfbebb8f09277f2cd316e107266381b02b8fbd73e87ab'
                   'SKIP')
sha256sums_aarch64=('6d16ae298bf60f0ede4c66b680efea17d11a4bbd06e94fd2450c5f1c451225af'
                    'SKIP')

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
    cd "$_pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
