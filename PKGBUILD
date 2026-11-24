# Maintainer: DBeidachazi <a269502169@gmail.com>

pkgname=antigravity-latest-bin
pkgver=2.35.0
pkgrel=1
_build=6394266482769920
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
b2sums_aarch64=('4d338fd9fbf5adba7df8c4fb87381d7549d16f68c548d8a78b0783099f4e7239ae9bb2fa3671121b92034e0a0fd784338fa2e52635d913eef05670aae88b1b95')
b2sums_x86_64=('40215e3f0ee134bcc4649444b47362ceabd797827c81b4d6df8268019b13a4bee879a849b8967815e68c1b06247e7bb4db33fb65c9f9fa2402acc2f03587947d')

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
