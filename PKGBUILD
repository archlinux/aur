# Maintainer: willker <wz[dot]willker[at]gmail[dot]com>

pkgname=pcl-n-bin
pkgver=1.2.7
pkgrel=3
pkgdesc="一个基于 PCL-CE 开发的 Minecraft 启动器"
arch=('x86_64')
url="https://github.com/PCL-N-Edition/PCL-N"
license=('Apache-2.0')
depends=('dotnet-runtime-10.0' 'hicolor-icon-theme')
source=("$url/releases/download/v$pkgver-release/PCL_N_Release_linux-x64_NoRuntime_NoPlugin.tar.gz"
        "https://raw.githubusercontent.com/PCL-N-Edition/PCL-N/refs/heads/dev/PCL.Desktop/Assets/icon.png"
        "pcl-n"
        "pcl-n.desktop")
sha256sums=('b04bc7ea10c8269900476482e9db7589aeae409dc3d51576ad0ddad5b0bc1b69'
            '774d947a09c84e59200504edae792bfd92e1e3d1a76ce9d5188d00b83e7070cb'
            'f92fd09e12fa53a8b623a96d969c90ab17d7402a47aa84d4d7271edfb257a7a0'
            '23c9bb1fb895be68f664c7b4cb142e492941e09b641f5f5a8267af5b03a9c857')
options=('!strip')

package() {
    install -Dm755 PCL.Desktop "$pkgdir/usr/bin/PCL-N"
    install -Dm755 -t "$pkgdir/usr/bin" pcl-n
    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/pcl-n.png"
    install -Dm644 -t "$pkgdir/usr/share/applications" pcl-n.desktop
}
