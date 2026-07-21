# Maintainer: Max Weber <abex at runelite dot net>
# Contributor: Jason Stryker <public at jasonstryker dot com>

pkgname=runelite
pkgver=2.8.0
pkgrel=1
epoch=1
pkgdesc="Open source Old School RuneScape client."
url='https://runelite.net/'
arch=(any)
license=('BSD')
depends=(
    'java-runtime>=17'
    'ttf-font')
optdepends=(
    'gvfs: enable links'
    'libnotify: native tray notifications')
makedepends=()
source=("${pkgver}_RuneLite.jar::https://github.com/runelite/launcher/releases/download/${pkgver}/RuneLite.jar"
    "${pkgver}_RuneLite.LICENSE::https://raw.githubusercontent.com/runelite/launcher/${pkgver}/LICENSE"
    "${pkgver}_runelite.png::https://raw.githubusercontent.com/runelite/launcher/${pkgver}/appimage/runelite.png"
    runelite.desktop
    runelite)
noextract=('RuneLite.jar')
sha256sums=('6ac03129ee7df2034883f368ba10f4b91fed364d0aa699a4a7f4b5e9511524e0'
    '1487fb5a1804002fd63fe8c01c75258c148fbfa0e2c5d9e97056f9fcd607c0ad'
    '81cb6ce7d8c4b9154e9840ab9d2938d0e6234f227049f004cacf90724f95cc11'
    'SKIP'
    'SKIP')

package() {
    install -D -m644 \
        "${srcdir}/${pkgver}_RuneLite.jar" \
        "${pkgdir}/usr/share/java/runelite/RuneLite.jar"

    install -D -m644 \
        "${srcdir}/runelite.desktop" \
        "${pkgdir}/usr/share/applications/runelite.desktop"

    install -D -m644 \
        "${srcdir}/${pkgver}_runelite.png" \
        "${pkgdir}/usr/share/pixmaps/runelite.png"

    install -D -m644 \
        "${srcdir}/${pkgver}_RuneLite.LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D -m755 \
        "${srcdir}/runelite" \
        "${pkgdir}/usr/bin/runelite"
}
