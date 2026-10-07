# Maintainer: Goran Jovanovic
# mdai-bin: gotov Linux binar (bez updatera; azurira pacman).
# sha256 tarbala i .SRCINFO se popunjavaju u AUR klonu pri izdanju
# (docs/RELEASE-CHECKLIST.md 3h).
pkgname=mdai-bin
pkgver=1.2.6
pkgrel=1
pkgdesc="Local-first Markdown editor with BYOK AI (proprietary, binary)"
arch=(x86_64)
url="https://mdai.me"
license=(LicenseRef-proprietary)
depends=(webkit2gtk-4.1 gtk3 libsoup3 glib2 cairo gdk-pixbuf2 dbus hicolor-icon-theme glibc gcc-libs zlib)
optdepends=("hunspell-en_us: spell checking (English)")
provides=(mdai)
conflicts=(mdai)
options=(!strip !debug)
source=("${pkgname}-${pkgver}.tar.gz::https://dl.mdai.me/mdai_${pkgver}_x86_64-linux.tar.gz"
        mdai.sh)
sha256sums=(764667449a14eb6f68ce5684bcf590dab4ca5f4911bb855aeebc8890c9d6557e
            f72eed84ccf15e7bbbefa8f64eb3203bbdaeb26dd6b8ed645e299ea83050c1e2)
package() {
  # pravi binar u /usr/lib/mdai, a /usr/bin/mdai je omotac (mdai.sh)
  install -Dm755 mdai "$pkgdir/usr/lib/mdai/mdai"
  install -Dm755 mdai.sh "$pkgdir/usr/bin/mdai"
  install -Dm644 mdai.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/mdai.png"
  install -Dm644 mdai-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/mdai.png"
  install -Dm644 mdai.desktop "$pkgdir/usr/share/applications/mdai.desktop"
  install -Dm644 EULA.md "$pkgdir/usr/share/licenses/$pkgname/EULA.md"
}
