# Maintainer: Frans-Willem Hardijzer <fw@hardijzer.nl>

pkgname=velocidrone
pkgver=1.11.0.299
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
	"velocidrone-$pkgver.zip::gdrive://0B5ZmVufmkjnwQU5jTVZ4TFJIZGs"
	"velocidrone.desktop"
	"https://www.velocidrone.com/img/logo.png")
noextract=("velocidrone-$pkgver.zip")
sha256sums=('ce7ed4266599bdd0cef1fa8165ef75eebdba8e1a78214db489caf352a5dee140'
            '66ab24798d6b40f2c69f42368b79205f1e39ace4d8880785bfeb47f7f20d98cb'
            'dca386606781e552fc310bf414a911b335bb8d48114091f337d02db46befdee1')

package() {
	mkdir -p "$pkgdir/opt/velocidrone/"
	unzip "$srcdir/velocidrone-$pkgver.zip" -d "$pkgdir/opt/velocidrone/"
	chmod ugo+x "$pkgdir/opt/velocidrone/velocidrone.x86_64"
	install -Dm644 "$srcdir/velocidrone.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
	install -Dm 644 "$srcdir/logo.png" "${pkgdir}/opt/velocidrone/icon.png"
}
