# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=ferrite-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='A fast, lightweight text editor for Markdown, JSON, YAML, and TOML files.'
arch=('x86_64')
url=https://github.com/OlaProeis/Ferrite
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver/"
license=('MIT')
depends=(glibc gcc-libs openssl zlib hicolor-icon-theme)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=(
	"$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-linux-x64.tar.gz"
	"LICENSE_$pkgver::$_rawurl/LICENSE"
	"ferrite_$pkgver.desktop::$_rawurl/assets/icons/linux/ferrite.desktop"
  "ferrite_16_$pkgver.png::$_rawurl/assets/icons/linux/ferrite_16.png"
  "ferrite_32_$pkgver.png::$_rawurl/assets/icons/linux/ferrite_32.png"
  "ferrite_48_$pkgver.png::$_rawurl/assets/icons/linux/ferrite_48.png"
  "ferrite_64_$pkgver.png::$_rawurl/assets/icons/linux/ferrite_64.png"
  "ferrite_128_$pkgver.png::$_rawurl/assets/icons/linux/ferrite_128.png"
  "ferrite_256_$pkgver.png::$_rawurl/assets/icons/linux/ferrite_256.png"
)

sha256sums=('f351e6c596a58f702c1ddc6ad405e6a7065c84c92558b1e7bb5830bc880bd110'
            'c94952dae4438b71667a129c1f7dd0e196e6d7dbf37db4525511c69536c27ac1'
            '79415739aa458c27bfb595d40ce73d81d81aae81fb53771d978209b6f193c7b2'
            '51857ee258352581aaf2c6c886303b55b0df9f460bcb37716d999a3f6c7d6494'
            '84b8e9d2ce7b6037e2269cab475523fa205de67cef1f94a9549c523ab7edff6a'
            'fc731ce961d0438e29f472d5dd266d948e841b25a84993441cc38543877a8f4e'
            'f405fed1e4d31fa287db005b435f3e63a5a378e89fcc71ca6720afd361030979'
            '308862d147b2be6c9a2171518c843a91c4289e949fad27724a35e608347b75a2'
            'b56d591a01d55c7ea8e4df24ed80c54a48f24c8c7a61c170018c015695644524')

package() {
  install -Dm0755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 "LICENSE_$pkgver" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "ferrite_$pkgver.desktop" "$pkgdir/usr/share/applications/ferrite.desktop"
  install -Dm644 "ferrite_16_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/ferrite.png"
  install -Dm644 "ferrite_32_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/ferrite.png"
  install -Dm644 "ferrite_48_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/ferrite.png"
  install -Dm644 "ferrite_64_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/ferrite.png"
  install -Dm644 "ferrite_128_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/ferrite.png"
  install -Dm644 "ferrite_256_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/ferrite.png"
}
