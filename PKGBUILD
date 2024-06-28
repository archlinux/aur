# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ludusavi-bin
_app_id="com.github.mtkennerly.${pkgname%-bin}"
pkgver=0.24.2
pkgrel=1
pkgdesc="Backup tool for PC game saves"
arch=('x86_64')
url="https://github.com/mtkennerly/ludusavi"
license=('MIT')
depends=('bzip2' 'gcc-libs' 'hicolor-icon-theme')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux.zip"
        "$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-legal.zip"
        "${_app_id}.metainfo-$pkgver.xml::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/${_app_id}.metainfo.xml"
        "icon-$pkgver.png::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/icon.png"
        "icon-$pkgver.svg::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/icon.svg"
        "${pkgname%-bin}-$pkgver.desktop::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/${pkgname%-bin}.desktop"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/LICENSE")
sha256sums=('b9478015b48e66739c39f40e0cee4930e2e9cc44451fbacf69f10aed7cafe9ca'
            '2ab0e5f7646c99ea9f896df1172f37abbd3363353bd5a992b2f3e6bcba3b0567'
            '33f423ddd1b6c7bbf3426ad5a976d02cca13464eb96ab47aa677ee9f5da67a07'
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
    "$pkgdir/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "LICENSE-$pkgver" \
    "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "${pkgname%-bin}-v$pkgver-legal.txt" \
    "$pkgdir/usr/share/licenses/${pkgname%-bin}/legal.txt"
}
