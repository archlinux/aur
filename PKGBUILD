# Maintainer: Your Name <your@email.com>
pkgname=imvu
pkgver=1.0.0
pkgrel=1
pkgdesc="IMVU Classic and IMVU Desktop clients via Wine"
arch=('x86_64')
url="https://www.imvu.com/"
license=('custom')
depends=('wine' 'wine-gecko' 'wine-mono' 'desktop-file-utils')
optdepends=('winetricks: for extra DLL/runtime fixes')
source=(
  "InstallIMVU_554.8.exe::https://static-akm.imvu.com/imvufiles/installers/InstallIMVU_554.8.exe"
  "IMVUApp-BETA-15.6.1.exe::https://electron-client.imvu.com/electron-client/win32/15.6.1/IMVUApp-BETA-15.6.1.exe"
  "imvu-classic"
  "imvu-classic-setup"
  "imvu-desktop"
  "imvu-desktop-setup"
  "imvu-classic.desktop"
  "imvu-desktop.desktop"
)
sha256sums=(
  '1d4202099d75b1c0a031e28ebcbfa81cb78b296244972ab84b3b779d7d5fb731'
  '0cc610973780d07481977504be67d8388eff33a3feab0eb14fb25504ad06f684'
  '6f08a830d80e63325efc13fa5924f4538d19c3caca2a4032fa3a75e955fb384b'
  '8f921467359063c33496e952f2e0d3ad3d25dda9529bfcaca15b07b75cbd2699'
  '988dbbbe0fbad22c04aa9aa0cb8c232579650b377df5b47f2463652010ec1105'
  '88116c6d6f598d0d275b00416ac08469fc638ab51eb73b70a6f1d84542e8ffc1'
  '445e5af83cb4fc207ecf3aa26ddd540a7968ee72212b11d6d6bc922707270787'
  '09cf6cd331cbcd2c3612db90744d56dde5a91b21598cce499cbc1ea236ee281b'
)

package() {
  install -dm755 "$pkgdir/usr/share/imvu"
  install -Dm644 "$srcdir/InstallIMVU_554.8.exe" "$pkgdir/usr/share/imvu/"
  install -Dm644 "$srcdir/IMVUApp-BETA-15.6.1.exe" "$pkgdir/usr/share/imvu/"

  install -Dm755 "$srcdir/imvu-classic" "$pkgdir/usr/bin/imvu-classic"
  install -Dm755 "$srcdir/imvu-classic-setup" "$pkgdir/usr/bin/imvu-classic-setup"
  install -Dm755 "$srcdir/imvu-desktop" "$pkgdir/usr/bin/imvu-desktop"
  install -Dm755 "$srcdir/imvu-desktop-setup" "$pkgdir/usr/bin/imvu-desktop-setup"

  install -Dm644 "$srcdir/imvu-classic.desktop" "$pkgdir/usr/share/applications/imvu-classic.desktop"
  install -Dm644 "$srcdir/imvu-desktop.desktop" "$pkgdir/usr/share/applications/imvu-desktop.desktop"
}
