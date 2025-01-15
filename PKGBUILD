# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ludusavi-bin
_app_id="com.mtkennerly.${pkgname%-bin}"
pkgver=0.28.0
pkgrel=1
pkgdesc="Backup tool for PC game saves"
arch=('x86_64')
url="https://github.com/mtkennerly/ludusavi"
license=('MIT')
depends=(
  'bzip2'
  'gcc-libs'
  'gtk3'
  'hicolor-icon-theme'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux.tar.gz"
        "$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-legal.zip"
        "${_app_id}.metainfo-$pkgver.xml::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/linux/${_app_id}.metainfo.xml"
        "icon-$pkgver.png::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/icon.png"
        "icon-$pkgver.svg::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/icon.svg"
        "${_app_id}-$pkgver.desktop::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/linux/${_app_id}.desktop"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/LICENSE")
sha256sums=('5c82201e8e8449a46a43faa74b9ccfdeb17a68eccc44daaccdc7f80bcc21d22d'
            '373461e8485eee6e1cc1cf02ff2db5014d49505fd8d5bd21617fb14ec1953c56'
            '012cf5afcf9e662799300816d7f3de38f08a603fb12b8c919497bb026f1181ad'
            'a8eb8375fae6120f3233e7f03a9e120c9b0484890191c6758ffe63ff7affcf84'
            '1eb345aff3c931c7dd5476f783cf6586442563eacb29565a5484eb9260179939'
            '33d8aa70046e9bd508de06d29d33127e6b7c63405adfad6b9bdf7b442c967f3d'
            'dba5a9bdc2280142b90a68fcd76134f48e6c765f14bfde7356b19b55370b27aa')

package() {
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 "${_app_id}.metainfo-$pkgver.xml" \
    "$pkgdir/usr/share/metainfo/${_app_id}.metainfo.xml"
  install -Dm644 "icon-$pkgver.png" \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/${pkgname%-bin}.png"
  install -Dm644 "icon-$pkgver.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
  install -Dm644 "${_app_id}-$pkgver.desktop" \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "LICENSE-$pkgver" \
    "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "${pkgname%-bin}-v$pkgver-legal.txt" \
    "$pkgdir/usr/share/licenses/${pkgname%-bin}/legal.txt"
}
