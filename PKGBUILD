# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: futrime <https://github.com/futrime>
pkgname=lip-bin
_pkgname=lip
pkgver=0.32.0
pkgrel=1
pkgdesc="A general package installer"
arch=('x86_64' 'aarch64')
url="https://github.com/futrime/lip"
license=('GPL3')
conflicts=('lip-git')
options=(!strip)
source_x86_64=(
    "$pkgname-$arch.tar.gz::$url/releases/download/v$pkgver/$_pkgname-cli-linux-x64.tar.gz"
    "LICENSE::$url/blob/main/COPYING"
    "lip.1")
source_aarch64=(
    "$pkgname-$arch.tar.gz::$url/releases/download/v$pkgver/$_pkgname-cli-linux-arm64.tar.gz"
    "LICENSE::$url/blob/main/COPYING"
    "lip.1")

sha256sums_x86_64=('f4811b0a84c4a5700a5c778e4f28c102f54fd49c6d3d8faf0e68c8d15f7ce64a'
                   'SKIP'
                   '341f8366713c3463d309d7db58b4b4f1ac270a03afe5714ddd3bc2195d293cfd')
sha256sums_aarch64=('ebd16fee06805cde19b4206d325a8e61feb65f10e8d6babb6939b3cfb8625834'
                    'SKIP'
                    '341f8366713c3463d309d7db58b4b4f1ac270a03afe5714ddd3bc2195d293cfd')
prepare() {
    tar -zxf "$pkgname-$arch.tar.gz" "$_pkgname"
}
package() {
    install -Dm 755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm 644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
