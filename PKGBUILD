# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: AllayMC <https://github.com/AllayMC>

pkgname=allay-launcher
_pkgname=allay
pkgver=1.1.0
pkgrel=1
pkgdesc="The launcher for Allay that aims to be small, fast and ready out of the box⚡"
arch=('x86_64' 'aarch64')
url="https://github.com/AllayMC/AllayLauncher"
license=('LGPL3')
conflicts=(allay-launcher-git)
optdepends=('jre-openjdk: for Java enviroment')

source_x86_64=(
    "${pkgname}-${arch}.zip::${url}/releases/download/${pkgver}/${pkgname}-linux-x86_64-release.zip"
    "LICENSE"::"${url}/blob/main/LICENSE"
    "allay.1"
)
source_aarch64=(
    "${pkgname}-${arch}.zip::${url}/releases/download/${pkgver}/${pkgname}-linux-arm64-v8a-release.zip"
    "LICENSE"::"${url}/blob/main/LICENSE"
    "allay.1"
)

sha256sums_x86_64=(
    '0fed5b971e7edc5e46d9935b5d01ac408603c6591ffc8a3edd65d9a25213f290'
    'SKIP'
    'ef7d618595d5f9eced792956646bf504dcd4f17e1ae9588f0234863d39ad5eb0'
)
sha256sums_aarch64=(
    'd8f4cf93b41f99ff68961791f34c19449688ead209707ec62dd484bd0692e89a'
    'SKIP'
    'ef7d618595d5f9eced792956646bf504dcd4f17e1ae9588f0234863d39ad5eb0'
)

prepare() {
    unzip ${pkgname}-${arch}.zip -d .
}

package() {
    install -Dm 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm 644 ${_pkgname}.1 ${pkgdir}/usr/share/man/man1/${_pkgname}.1
}
