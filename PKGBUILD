# Maintainer: meanlint <meanlint@outlook.com>
# Contributor: Robert Baker <reiichi001@gmail.com>
pkgname=xivlauncher-cn-bin-no-conflict
pkgver=1.1.0.3
pkgrel=2
pkgdesc="Custom Launcher for Final Fantasy XIV Online CN (Not conflict with xivlauncher)"
arch=('x86_64')
url='https://github.com/ottercorp/XIVLauncher.Core'
license=('GPL')
depends=(
    'aria2'
    'sdl2'
    'libsecret'
    'desktop-file-utils'
    'jxrlib'
)
options=('!strip')
provides=("xivlauncher-cn=${pkgver}")
conflicts=("xivlauncher-cn" "xivlauncher-cn-bin")
source=(
    "XIVLauncher.Core.tar.gz::https://github.com/ottercorp/XIVLauncher.Core/releases/download/${pkgver}/XIVLauncher.Core-arch.tar.gz"
    "512.png"
    "XIVLauncherCN.desktop"
    "xivlauncher-core-cn"
)
sha512sums=('aab660a671e93b0a6f17b69a5d8fe5875bb4b6840238666683c6b2844251c43b1e4d2b6e95b4adecf510495918e810e272c1b8af81065de125b3452ee3177eed'
            '3a95e052263310fbcfb67be8d229c8d71baecb1a8b7b19e4499039362f32b1a80e557cd219860c06de2098a1432e6fa802b772612c3c8805197299907f314974'
            'c6f90684f5b6c1e0f83b88c4a7cdc1c258b4cb00d03b74806cd00ce7ae51751c270956337f2cf9583867e43580a937fee0940c54640202d8a59ba0d5cced3ef4'
            '71aa8d36c1f18eec6706dbb7d2518b8995c5d8153fcc32a5b29ae3d9738f6c2248fab181bb758750afddb78a8a1a01fddb28c5b1159a15c10db5f6de1065e575')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/opt/XIVLauncherCN/"
    install -D -m644 "${srcdir}/XIVLauncherCN.desktop" "${pkgdir}/usr/share/applications/XIVLauncherCN.desktop"
    install -D -m644 "${srcdir}/512.png" "${pkgdir}/usr/share/pixmaps/xivlaunchercn.png"
    cp -r "${srcdir}/." "${pkgdir}/opt/XIVLauncherCN/"
    ln -s ../../opt/XIVLauncherCN/XIVLauncher.Core "${pkgdir}/usr/bin/XIVLauncher.Core.CN"
    install -D -m755  "${srcdir}/xivlauncher-core-cn" "${pkgdir}/usr/bin/xivlauncher-core-cn"
}
