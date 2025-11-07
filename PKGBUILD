# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: AllayMC <https://github.com/AllayMC>
pkgname=allay-launcher
_pkgname=allay
pkgver=1.1.0
pkgrel=2
pkgdesc="The launcher for Allay that aims to be small, fast and ready out of the box⚡"
arch=('x86_64' 'aarch64')
url="https://github.com/AllayMC/AllayLauncher"
license=('LGPL3')
conflicts=('allay-launcher-git')
optdepends=('jre-openjdk: for Java enviroment')
source_x86_64=(
    "$pkgname-$arch::$url/releases/download/$pkgver/$pkgname-linux-x86_64-release"
    "LICENSE::$url/blob/main/LICENSE"
    "allay.1")
source_aarch64=(
    "$pkgname-$arch::$url/releases/download/$pkgver/$pkgname-linux-arm64-v8a-release"
    "LICENSE::$url/blob/main/LICENSE"
    "allay.1")
sha256sums_x86_64=('5f69faf13e266e158be2cad791c36c1b7c1f304b01b0eb882ed0eb0992e9e27a'
                   'SKIP'
                   'ef7d618595d5f9eced792956646bf504dcd4f17e1ae9588f0234863d39ad5eb0')
sha256sums_aarch64=('a627a4a8bfeaa06458cc9de49850cdc7c0828f07bdc433c3ec1c42a825f1bae2'
                    'SKIP'
                    'ef7d618595d5f9eced792956646bf504dcd4f17e1ae9588f0234863d39ad5eb0')
package() {
    install -Dm 755 "$pkgname-$arch" "$pkgdir/usr/bin/$_pkgname"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
