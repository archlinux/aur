# Maintainer: Frans-Willem Hardijzer <fw@hardijzer.nl>

pkgname=velocidrone
pkgver=1.11.0.418
pkgrel=1
pkgdesc="Velocidrone: Fast paced FPV drone racing action with multiplayer and offline modes!"
arch=('x86_64')
url="http://www.velocidrone.com/"
license=('proprietary')
makedepends=(wget unzip)
depends=(gcc-libs gtk2)
optdepends=(steam)
conflicts=()
_source_id=""
DLAGENTS+=('gdrive::./gdrive-download.sh %u %o')
source=(
	"velocidrone-$pkgver.zip::gdrive://1-1GUMzEQVWmhunqapUMmZOH9I2fZCukM"
	"velocidrone.desktop"
	"https://www.velocidrone.com/img/logo.png")
noextract=("velocidrone-$pkgver.zip")
sha256sums=('4bed1615377317279bafc61f6ba57fa37f0ae969a37c62724f70c5814f94ffff'
            '66ab24798d6b40f2c69f42368b79205f1e39ace4d8880785bfeb47f7f20d98cb'
            'dca386606781e552fc310bf414a911b335bb8d48114091f337d02db46befdee1')

package() {
	mkdir -p "$pkgdir/opt/velocidrone/"
	unzip "$srcdir/velocidrone-$pkgver.zip" -d "$pkgdir/opt/velocidrone/"
	chmod ugo+x "$pkgdir/opt/velocidrone/velocidrone.x86_64"
	install -Dm644 "$srcdir/velocidrone.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
	install -Dm 644 "$srcdir/logo.png" "${pkgdir}/opt/velocidrone/icon.png"
}
