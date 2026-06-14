# Maintainer: @aardbol
pkgname=picocrypt-ng-cli-bin
pkgver=2.14
pkgrel=1
pkgdesc="A very small, very simple, yet very secure encryption tool. (CLI)"
arch=('x86_64' 'aarch64')
url="https://github.com/Picocrypt-NG/Picocrypt-NG"
license=('GPL3')
provides=('Picocrypt-NG-cli')
conflicts=('Picocrypt-NG-cli' 'Picocrypt-NG-cli-git')
source_x86_64=("${url}/releases/download/${pkgver}/Picocrypt-NG-cli")
source_aarch64=("${url}/releases/download/${pkgver}/Picocrypt-NG-cli-arm64")
sha256sums_x86_64=('a0d30fcff565cefff116c0246c30afbe0f04e8858db9bc3e251da5dc5218200b')
sha256sums_aarch64=('a570ad6cc4321557653633c914b0cea4d70d953fbb587aa130a384a8af034832')

package() {
    local srcbin
    case "$CARCH" in
        x86_64) srcbin="Picocrypt-NG-cli" ;;
        aarch64) srcbin="Picocrypt-NG-cli-arm64" ;;
    esac

    install -Dm755 "$srcdir/$srcbin" "$pkgdir/usr/bin/picocrypt-ng-cli"
}