# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=antigravity
pkgver=2.8.1
pkgrel=1
pkgdesc='Google Antigravity 2.0 multi-agent orchestration platform'
arch=(aarch64 x86_64)
url=https://antigravity.google/product/antigravity-2
license=(LicenseRef-Google-Antigravity)
depends=(alsa-lib
         at-spi2-core
         cairo
         dbus
         expat
         glib2
         glibc
         gtk3
         libcups
         libgcc
         libx11
         libxcb
         libxcomposite
         libxdamage
         libxext
         libxfixes
         libxkbcommon
         libxrandr
         mesa
         nspr
         nss
         pango
         systemd-libs)
options=(!strip !debug)
source=(antigravity.desktop
        antigravity.png)
_build=6512087774658560
source_x86_64=(Antigravity-$pkgver-x86_64.tar.gz::https://storage.googleapis.com/antigravity-public/antigravity-hub/$pkgver-$_build/linux-x64/Antigravity.tar.gz)
source_aarch64=(Antigravity-$pkgver-aarch64.tar.gz::https://storage.googleapis.com/antigravity-public/antigravity-hub/$pkgver-$_build/linux-arm/Antigravity.tar.gz)
b2sums=('ec2c74f0e6f2458f2ef1c67b1321c058a3f7c422e364d8871a0a933220ec52ee5736e449cb797b6f135cff1f4adfe6f81e0fdbc76d3ec67c245aea002b8577d8'
        '772849ebf4574dccc7d2fc30751baed10b4a5d4091c524f3d69938192387693501c0c54ea5b43fa2ed382f70ecdff369a4c65ce3d0f778c68712fa0c2b5e84b8')
b2sums_aarch64=('78cf085afd4e50dd21c24be8d71b830bc6e9ef8aace1020318b7787ca7c0e857ce4126e8ff9b4a64a25c821867f80268fcd0d03668f8b34179b982033cc46d22')
b2sums_x86_64=('28cd85a27589086fab14fccc11aacde0ca03ec5d2526eca0df62e654fec019c4e59008e259462b2cf7d09d6601a4f988d4ce7eec8096c19d9f0a1100e2f7c3aa')

package() {
    install -d "$pkgdir/opt"
    cp -a Antigravity-*/ "$pkgdir/opt/Antigravity"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/Antigravity/antigravity "$pkgdir/usr/bin/$pkgname"

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/Antigravity/LICENSE.electron.txt -t "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/Antigravity/LICENSES.chromium.html -t "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 $pkgname.png -t "$pkgdir/usr/share/pixmaps"
}
