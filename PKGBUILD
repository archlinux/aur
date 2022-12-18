# Maintainer: HitCoder <hitcoder9768@gmail.com>
pkgname=openutau-installer
pkgver=1.0.1
pkgrel=2
pkgdesc="An open source UTAU successor - installer script for local updating"
arch=('x86_64')
url="https://github.com/stakira/OpenUtau"
license=('MIT')
depends=('dotnet-host' 'dotnet-runtime' 'dotnet-targeting-pack' 'dotnet-sdk' 'fuse2' 'fuse3' 'fuse-common')
options=(staticlibs)
conflicts=('openutau' 'openutau-git' 'openutau-bin')
source=("https://github.com/stakira/OpenUtau/releases/latest/download/OpenUtau-linux-x64.tar.gz"
        "openutau"
        "OpenUtau.desktop"
        "openutau.svg")
sha256sums=('SKIP'
            'daa0115af49f653400b7ef5bd6795d7cb703834bb9503584b4551f9a416682e7'
            '6c2939d1126db03e744deceed9464a4d4d25c03a17c1f2d7585697f1fc2a5f17'
            '490fd7489bb3c4225c3f2d1e96ba8320bd481da6eb031b97229dcf06997c2f5b')

package() {
    # create directory
    install -d "${pkgdir}/usr/lib/openutau-installer/openutau"

    # extract
    bsdtar -xf "${srcdir}/OpenUtau-linux-x64.tar.gz" --directory "${pkgdir}/usr/lib/openutau-installer/openutau"

    # install wrapper
    install -Dm755 "$srcdir"/openutau "$pkgdir"/usr/bin/openutau

    # Icon
    install -Dm644 "$srcdir"/openutau.svg "$pkgdir"/usr/share/pixmaps/openutau.svg

    # Desktop file
    install -Dm644 "$srcdir"/OpenUtau.desktop "$pkgdir"/usr/share/applications/OpenUtau.desktop
}
