# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: futrime <https://github.com/futrime>
pkgname=lip-bin
_pkgname=lip
pkgver=0.34.0
pkgrel=1
pkgdesc="A general package installer"
arch=('x86_64' 'aarch64')
url="https://github.com/futrime/lip"
license=('GPL3')
conflicts=('lip-git')
options=(!strip)
source_x86_64=(
    "$pkgname-$arch-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x64.tar.xz"
    "LICENSE::$url/blob/main/COPYING"
    "lip.1")
source_aarch64=(
    "$pkgname-$arch-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-arm64.tar.xz"
    "LICENSE::$url/blob/main/COPYING"
    "lip.1")
sha256sums_x86_64=('c67cb617043ed43cd31c59b4de9bc645f4359fb79a4d60051b6b5b53af8d8dd6'
                   'SKIP'
                   '341f8366713c3463d309d7db58b4b4f1ac270a03afe5714ddd3bc2195d293cfd')
sha256sums_aarch64=('8912e91def7fc267b160804d1ad4eaf4e0484daa4ca6d51b735a795291b28d9c'
                    'SKIP'
                    '341f8366713c3463d309d7db58b4b4f1ac270a03afe5714ddd3bc2195d293cfd')
prepare() {
    tar -Jxf "$pkgname-$arch-$pkgver.tar.xz"
}
package() {
    install -Dm 755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm 755 "${_pkgname}d" "$pkgdir/usr/bin/${_pkgname}d"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm 644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
