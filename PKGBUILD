# Maintainer: willker <wz[dot]willker[at]gmail[dot]com>

pkgname=pcl-n-bin
pkgver=1.2.7
pkgrel=1
pkgdesc="一个基于 PCL-CE 开发的 Minecraft 启动器"
arch=('x86_64')
url="https://github.com/PCL-N-Edition/PCL-N"
license=('Apache-2.0')
depends=('dotnet-runtime-10.0')
source=("$url/releases/download/v$pkgver-release/PCL_N_Release_linux-x64_NoRuntime_NoPlugin.tar.gz"
        "https://raw.githubusercontent.com/PCL-N-Edition/PCL-N/refs/heads/dev/PCL.Desktop/Assets/icon.png"
        "pcl-n.desktop")
sha256sums=('b04bc7ea10c8269900476482e9db7589aeae409dc3d51576ad0ddad5b0bc1b69'
            '774d947a09c84e59200504edae792bfd92e1e3d1a76ce9d5188d00b83e7070cb'
            '513c6146af42c2855faa195cf1e884af44955f7cc078217a8418c2798cae283d')
options=('!strip')

package() {
    install -Dm755 PCL.Desktop "$pkgdir/usr/bin/PCL-N"
    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/pcl-n.png"
    install -Dm644 pcl-n.desktop "$pkgdir/usr/share/applications/pcl-n.desktop"
}
