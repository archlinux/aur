# Maintainer: pacmanics

pkgname=aur-security-auditor
pkgver=1.4.7
pkgrel=1
pkgdesc="Explainable security auditor for AUR packages and supply-chain risks"
arch=('any')
url="https://altbox.de/"
license=('GPL-3.0-or-later')
depends=('python' 'pacman' 'binutils' 'libcap' 'sudo' 'hicolor-icon-theme')
optdepends=(
  'xdg-utils: automatically open the local dashboard in a browser'
  'git: inspect recent AUR Git history'
  'devtools: build packages in an isolated clean chroot for deep scans'
  'namcap: inspect package quality during deep scans'
  'libarchive: inspect built package archives with bsdtar'
  'zstd: inspect local .tar.zst package source archives'
)
conflicts=('aur-scanner' 'aur-malware-scanner')
source=(
  'aur-security-auditor'
  'aur-security-auditor-launcher'
  'core.py'
  'dashboard.html'
  'atomic-arch-packages.txt'
  'iocs.json'
  'aur-security-auditor.svg'
  'aur-security-auditor.desktop'
  'LICENSE'
)
sha256sums=('8be0f129792aec9de64f7ca9271add41d2b0b25e08fa429754f18a6ddde19304'
            '956a10f18102d49df5136add3331f67f84949a3d6e5e68a4e7dece0e4f242ec1'
            '528544018bdad8f096ccf99b354175116b4aa7f9de9389db63d1361e85602dff'
            'c3a410156ea46328324c5088287b08c7a793384e2249d2b9ba67059de1d46a77'
            'a2f4c2381a0fcdd16d63a97e8fd8318758ee5af04cf192f316ef4ef02b9a06df'
            '7fe42d20bfe2687143b01a172e290af124169f27a1f83dd437ed2421eaaf89d4'
            '66d653b6d46a47ee42cfb771a32d803f3ae15a703daea47235c9a4ca17d403c3'
            '401cea5fa27addf76c3bef2c33117c3878497fbfff5d11a55e33d4747098ea0b'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm755 "$srcdir/aur-security-auditor" "$pkgdir/usr/bin/aur-security-auditor"
  install -Dm755 "$srcdir/aur-security-auditor-launcher" "$pkgdir/usr/bin/aur-security-auditor-launcher"
  install -Dm644 "$srcdir/core.py" "$pkgdir/usr/lib/aur-security-auditor/core.py"
  install -Dm644 "$srcdir/dashboard.html" "$pkgdir/usr/share/aur-security-auditor/dashboard.html"
  install -Dm644 "$srcdir/atomic-arch-packages.txt" "$pkgdir/usr/share/aur-security-auditor/atomic-arch-packages.txt"
  install -Dm644 "$srcdir/iocs.json" "$pkgdir/usr/share/aur-security-auditor/iocs.json"
  install -Dm644 "$srcdir/aur-security-auditor.svg" "$pkgdir/usr/share/aur-security-auditor/aur-security-auditor.svg"
  install -Dm644 "$srcdir/aur-security-auditor.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/aur-security-auditor.svg"
  install -Dm644 "$srcdir/aur-security-auditor.desktop" "$pkgdir/usr/share/applications/aur-security-auditor.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/aur-security-auditor/LICENSE"
}
