# Maintainer: NameSetter <ssmzhn@163.com>
# Contributor: HitCoder <hitcoder9768@gmail.com>
pkgname=openutau-arm64
pkgver=0.1.501.42
pkgrel=1
pkgdesc="An open source UTAU successor - installer script for local updating. For arm64 devices."
arch=('aarch64')
url="https://github.com/xunmengshe/OpenUtau"
license=('MIT')
depends=('dotnet-host' 'dotnet-runtime' 'dotnet-targeting-pack' 'dotnet-sdk' 'fuse2' 'fuse3' 'fuse-common')
options=(staticlibs)
conflicts=('openutau' 'openutau-git' 'openutau-bin' 'openutau-installer' 'openutau-beta')
source=("https://github.com/xunmengshe/OpenUtau/releases/download/0.1.501.42/OpenUtau-linux-arm64-0.1.501.42.zip"
        "openutau"
        "OpenUtau.desktop"
        "openutau.svg")
sha256sums=('SKIP'
            '3d905282c844a47270cc37c5f9883a5d008fa9498f4a00aab5dd03e16580780e'
            '7f60562029daf75404f82f8ec2ab4a1089bbf3261709815853cbbf50a0afa445'
            '490fd7489bb3c4225c3f2d1e96ba8320bd481da6eb031b97229dcf06997c2f5b')

package() {
    # create directory
    install -d "${pkgdir}/usr/lib/openutau-arm64/openutau"

    # extract
    unzip -d "${pkgdir}/usr/lib/openutau-arm64/openutau" "${srcdir}/OpenUtau-linux-arm64-0.1.501.42.zip"

    # install wrapper
    install -Dm755 "$srcdir"/openutau "$pkgdir"/usr/bin/openutau

    # Icon
    install -Dm644 "$srcdir"/openutau.svg "$pkgdir"/usr/share/pixmaps/openutau.svg

    # Desktop file
    install -Dm644 "$srcdir"/OpenUtau.desktop "$pkgdir"/usr/share/applications/OpenUtau.desktop
}
