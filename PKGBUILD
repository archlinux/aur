# Maintainer: hugo.dn.ferreira@gmail.com
pkgname=p2ascii
pkgver=1.0.0
pkgrel=1
pkgdesc="Image to ASCII converter using OpenCV"
arch=('any')
url="https://github.com/Hugana/p2ascii"
license=('MIT')
depends=('python' 'opencv' 'numpy')
source=(
  "p2ascii.py::https://raw.githubusercontent.com/Hugana/p2ascii/main/p2ascii.py"
  "edgesASCII.png::https://raw.githubusercontent.com/Hugana/p2ascii/main/Images/edgesASCII.png"
  "edgesASCII-Transparent.png::https://raw.githubusercontent.com/Hugana/p2ascii/main/Images/edgesASCII-Transparent.png"
  "1x0 8x8 2.png::https://raw.githubusercontent.com/Hugana/p2ascii/main/Images/1x0%208x8%202.png"
  "1x0 8x8 2-Transparent.png::https://raw.githubusercontent.com/Hugana/p2ascii/main/Images/1x0%208x8%202-Transparent.png"
)
noextract=()
sha256sums=('f3f05c482fab3fc066e61f2b850ec273abde5310f252fb857782547899bc4c1d'
'1f1bb49dee041e658b6210edf4a1a365105add547bc825a1ce51eda91a2bcefe'
'eb51cc804857a5ca77db3096ed1d17342a424baf37df947d173e86794ca37303'
'50d6368a764efb78d60a3611af0e92ef536843a01a511ba824a150446feef23b'
'd38e38a153f854e11ac5778030966394c1132fcdd3a9a910445b2e8548437b4c')

package() {
  install -d "$pkgdir/usr/share/$pkgname/Images"

  # Install main script
  install -m755 "$srcdir/p2ascii.py" "$pkgdir/usr/share/$pkgname/"

  # Install images from src/ directly (flat layout)
  install -m644 "$srcdir/"*.png "$pkgdir/usr/share/$pkgname/Images/"

  # Symlink for easy execution
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/p2ascii.py" "$pkgdir/usr/bin/p2ascii"
}
