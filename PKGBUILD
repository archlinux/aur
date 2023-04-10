# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ludusavi-bin
_app_id="com.github.mtkennerly.${pkgname%-bin}"
pkgver=0.17.1
pkgrel=1
pkgdesc="Backup tool for PC game saves"
arch=('x86_64')
url="https://github.com/mtkennerly/ludusavi"
license=('MIT')
depends=('bzip2' 'fontconfig' 'gcc-libs' 'hicolor-icon-theme')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux.zip"
        "$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-legal.zip"
        "${_app_id}.metainfo-$pkgver.xml::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/${_app_id}.metainfo.xml"
        "icon-$pkgver.png::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/icon.png"
        "icon-$pkgver.svg::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/icon.svg"
        "${pkgname%-bin}-$pkgver.desktop::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/${pkgname%-bin}.desktop"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/LICENSE")
sha256sums=('e8a4ec7d5faff8ffad7563f4691098b6dd181eb4a98c3755016b038888b2ff8d'
            'd3083999e4df192aa6454dc71666860479c3469244e18863589776149996b079'
            'ded881b4f129479bf8dd89b166efc68e5a2f36da145e5736b96b923d1d6d9ed1'
            'a8eb8375fae6120f3233e7f03a9e120c9b0484890191c6758ffe63ff7affcf84'
            '1eb345aff3c931c7dd5476f783cf6586442563eacb29565a5484eb9260179939'
            '8757b3673c910019fa02e030a4e153eae3c461d96d5c9de1b6bc153344903e55'
            'dba5a9bdc2280142b90a68fcd76134f48e6c765f14bfde7356b19b55370b27aa')

package() {
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 "${_app_id}.metainfo-$pkgver.xml" \
    "$pkgdir/usr/share/metainfo/${_app_id}.metainfo.xml"
  install -Dm644 "icon-$pkgver.png" \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/${pkgname%-bin}.png"
  install -Dm644 "icon-$pkgver.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
  install -Dm644 "${pkgname%-bin}-$pkgver.desktop" \
    "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
  install -Dm644 "LICENSE-$pkgver" \
    "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "${pkgname%-bin}-v$pkgver-legal.txt" \
    "$pkgdir/usr/share/licenses/${pkgname%-bin}/legal.txt"
}
