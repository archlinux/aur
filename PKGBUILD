# Maintainer: DBeidachazi <a269502169@gmail.com>

pkgname=antigravity-latest-bin
pkgver=2.35.2
pkgrel=1
_build=4585983447007232
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
b2sums_aarch64=('363ab973ccecac82900039da2f8cf197bba118c5d3b89ac8b4e70b75cc4658628b6613f5dec8c55472ca8a5d07dc1e681dff54b70d593f0c5b1a49013f19e6ea')
b2sums_x86_64=('557bc1de90b1c1a46a48774cfbbd3fb43a752590fbd8cef9284b5aeb333d7f9f69bb81547e1e59a38cbfe147b49483152e0256f364fd62e653451ec1a38f7eca')

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
