# Maintainer: Rico Beier-Grunwald DL4LM <DL4LM AT DARC DOT DE>

pkgname=vara-hf
pkgver=4.9.0
pkgrel=1
pkgdesc='High performance HF software modem, run through Wine'
arch=('x86_64')
url='https://varamodem.com/'
license=('LicenseRef-VARA-Shareware')
options=('!strip')

depends=('wine' 'winetricks' 'bash' 'util-linux')

source=(
  "${pkgname}-${pkgver}.zip::https://downloads.winlink.org/VARA%20Products/VARA%20HF%20v${pkgver}%20%20setup.zip"
  'VARA-Terms-of-use.pdf::https://varamodem.com/wp-content/uploads/2026/04/Terms-of-use.pdf'
  'vara-hf'
  'vara-hf.desktop'
)

sha256sums=('5ad7d75c722e4414705dec998c28a711b7567f8568bea75cb84e8aa7c991f48a'
            '6e4feabf958622bde6ec3fb6a80e99c6452887b0fb57f62b1701b5fd7958cee6'
            '54ed8eeed9e5925ab930f51314f6c85904b94b6c77971aaf63093b1f5f930fcb'
            '31415cabdedf5c0fca6fffd524e4b1decf0acc4b0c85f64f2bb12bc436581170')

package() {
  install -Dm644 "$srcdir/VARA setup (Run as Administrator).exe" "$pkgdir/usr/share/vara-hf/VARA-setup.exe"
  install -Dm644 "$srcdir/VARA-Terms-of-use.pdf" "$pkgdir/usr/share/licenses/$pkgname/VARA-Terms-of-use.pdf"
  install -Dm755 "$srcdir/vara-hf" "$pkgdir/usr/bin/vara-hf"
  install -Dm644 "$srcdir/vara-hf.desktop" "$pkgdir/usr/share/applications/vara-hf.desktop"
  install -Dm644 /dev/null "$pkgdir/usr/share/vara-hf/version"
  printf '%s-%s\n' "$pkgver" "$pkgrel" > "$pkgdir/usr/share/vara-hf/version"
}
