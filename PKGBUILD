# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ludusavi-bin
_app_id="com.mtkennerly.${pkgname%-bin}"
pkgver=0.31.0
pkgrel=1
pkgdesc="Backup tool for PC game saves"
arch=('x86_64')
url="https://github.com/mtkennerly/ludusavi"
license=('MIT')
depends=(
  'bzip2'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
)
optdepends=('rclone: upload backups to the cloud')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux.tar.gz"
        "$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-legal.zip"
        "${_app_id}.metainfo-$pkgver.xml::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/linux/${_app_id}.metainfo.xml"
        "icon-$pkgver.png::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/icon.png"
        "icon-$pkgver.svg::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/icon.svg"
        "${_app_id}-$pkgver.desktop::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/assets/linux/${_app_id}.desktop"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/mtkennerly/${pkgname%-bin}/v$pkgver/LICENSE")
sha256sums=('7322ff45d41eae7ae064a80d8c9ecccc5b8fb6fc090a603a66369cd4b054068d'
            '9fce11fc44942efdd5969928d89b106c229f9a041d7a713c424a6da981660ebf'
            '677377b0be85f1e3c1ad7300a87deb33673626289d9a7c947f9c3cf6e1c722a5'
            'a8eb8375fae6120f3233e7f03a9e120c9b0484890191c6758ffe63ff7affcf84'
            '1eb345aff3c931c7dd5476f783cf6586442563eacb29565a5484eb9260179939'
            '33d8aa70046e9bd508de06d29d33127e6b7c63405adfad6b9bdf7b442c967f3d'
            'dba5a9bdc2280142b90a68fcd76134f48e6c765f14bfde7356b19b55370b27aa')

package() {
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 "${_app_id}.metainfo-$pkgver.xml" \
    "$pkgdir/usr/share/metainfo/${_app_id}.metainfo.xml"
  install -Dm644 "icon-$pkgver.png" \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/${_app_id}.png"
  install -Dm644 "icon-$pkgver.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
  install -Dm644 "${_app_id}-$pkgver.desktop" \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "LICENSE-$pkgver" \
    "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "${pkgname%-bin}-v$pkgver-legal.txt" \
    "$pkgdir/usr/share/licenses/${pkgname%-bin}/legal.txt"
}
