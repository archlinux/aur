# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=edconv-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="An intuitive FFmpeg GUI"
arch=('x86_64')
url="https://github.com/edneyosf/Edconv"
license=('GPL-2.0')
source=("https://github.com/edneyosf/Edconv/releases/download/${pkgver}/Edconv-${pkgver}-x86_64.deb")
sha256sums=('54c850c4bf475a40dd9935f51033e39c0290ed80f6aa55055a90a0468620c778')

package() {
  cd "$srcdir"

  ar x "Edconv-${pkgver}-x86_64.deb"
  for tarball in data.tar.*; do
    bsdtar -xf "$tarball" -C "$pkgdir"
  done

  desktop-file-install --dir="$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/applications/edconv.desktop"
}
