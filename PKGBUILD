# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: AllayMC <https://github.com/AllayMC>

pkgname=allay-launcher
_pkgname=allay
pkgver=1.0.1
pkgrel=2
pkgdesc="The launcher for Allay that aims to be small, fast and ready out of the box⚡"
arch=('x86_64' 'aarch64')
url="https://github.com/AllayMC/AllayLauncher"
license=('LGPL3')
conflicts=(allay-launcher-git)

source_x86_64=(
    "${pkgname}-${arch}::${url}/releases/download/${pkgver}/${pkgname}-linux-x64-release"
    "LICENSE"::"${url}/blob/main/LICENSE"
    "allay.1"
)
source_aarch64=(
    "${pkgname}-${arch}::${url}/releases/download/${pkgver}/${pkgname}-linux-arm64-v8a-release"
    "LICENSE"::"${url}/blob/main/LICENSE"
    "allay.1"
)

sha512sums_x86_64=(
    '2b2b2da33ef299cd40f0805abcb1ff3800364e85aedfc95c7d051f2a170b4b06b5384884cae1f3c04d686590fd2e4b877d4d8262fbc9b9b1d75c9b8a2a45923c'
    'SKIP'
    'd6d3bab6578ef9677e0cfb31446ba0f82fee8c5473a3a77b144cd716f95fcf8ce46d0ad05d4f8e0bebc21897a406f6aaad68422e299d3d354404193b367f810c'
)
sha512sums_aarch64=(
    '0fe2b9c31dad5baefab963c8eb52042c87c788874ac3d0d1e61306a710b6d954c8f76a8f53d70ed7d705ac6d8a00058ea3dc2c5138f6c0eedc99ea9afb97380a'
    'SKIP'
    'd6d3bab6578ef9677e0cfb31446ba0f82fee8c5473a3a77b144cd716f95fcf8ce46d0ad05d4f8e0bebc21897a406f6aaad68422e299d3d354404193b367f810c'
)

package() {
    install -Dm 755 ${pkgname}-${arch} ${pkgdir}/usr/bin/${_pkgname}
    install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm 644 ${_pkgname}.1 ${pkgdir}/usr/share/man/man1/${_pkgname}.1
}
