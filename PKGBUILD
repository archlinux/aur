# Maintainer: DBeidachazi <a269502169@gmail.com>

pkgname=antigravity-latest-bin
pkgver=2.36.0
pkgrel=1
_build=5596661662220288
pkgdesc='Google Antigravity 2.0 multi-agent orchestration platform (Prebuilt binary)'
arch=('aarch64' 'x86_64')
url='https://antigravity.google/product/antigravity-2'
license=('LicenseRef-Google-Antigravity')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'glib2'
    'glibc'
    'gtk3'
    'libcups'
    'libgcc'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
)
provides=('antigravity')
conflicts=('antigravity' 'antigravity-bin')
options=('!strip' '!debug')
source=(
    'antigravity.desktop'
    'antigravity.png'
)
source_aarch64=("Antigravity-${pkgver}-${_build}-aarch64.tar.gz::https://storage.googleapis.com/antigravity-public/antigravity-hub/${pkgver}-${_build}/linux-arm/Antigravity.tar.gz")
source_x86_64=("Antigravity-${pkgver}-${_build}-x86_64.tar.gz::https://storage.googleapis.com/antigravity-public/antigravity-hub/${pkgver}-${_build}/linux-x64/Antigravity.tar.gz")
b2sums=('ec2c74f0e6f2458f2ef1c67b1321c058a3f7c422e364d8871a0a933220ec52ee5736e449cb797b6f135cff1f4adfe6f81e0fdbc76d3ec67c245aea002b8577d8'
        '772849ebf4574dccc7d2fc30751baed10b4a5d4091c524f3d69938192387693501c0c54ea5b43fa2ed382f70ecdff369a4c65ce3d0f778c68712fa0c2b5e84b8')
b2sums_aarch64=('54e8d538f584a9b6559b9e1d1e02a9d1ceb7b564e6253494dc4c9f53c4ca2712ce621e291c2d7f5cdbab8ad751dea0544723383d275b67c494c28c5a1abd684b')
b2sums_x86_64=('544f78644e06dc18b67cd975baf47e6b020b1335cb76aa37146357c25ce0fc110ba5823b526cde55d1c9dcacdf7f97d6e3dee733807e29104dd07abb737cfb04')

package() {
    install -d "$pkgdir/opt"
    cp -a Antigravity-*/ "$pkgdir/opt/Antigravity"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/Antigravity/antigravity "$pkgdir/usr/bin/antigravity"

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/Antigravity/LICENSE.electron.txt -t "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/Antigravity/LICENSES.chromium.html -t "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm644 antigravity.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 antigravity.png -t "$pkgdir/usr/share/pixmaps"
}
