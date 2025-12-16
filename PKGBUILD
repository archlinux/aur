pkgname=dyad-bin
pkgver=0.29.0
pkgrel=1
pkgdesc="Free, local, open-source AI app builder | v0 / lovable / Bolt alternative"
arch=('x86_64')
url="https://github.com/dyad-sh/dyad"
license=('Apache')
depends=('libsecret' 'webkit2gtk' 'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils')
source=("https://github.com/dyad-sh/dyad/releases/download/v${pkgver}/dyad_${pkgver}_amd64.deb")
sha256sums=('f96e64652e914043ea2f16007e64c4be4bab4528624bec8de78061d19a0f40d7')

package() {
  cd "$srcdir"

  ar x "dyad_${pkgver}_amd64.deb"
  for tarball in data.tar.*; do
    bsdtar -xf "$tarball" -C "$pkgdir"
  done

  desktop-file-install --dir="$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/applications/dyad.desktop"
}
