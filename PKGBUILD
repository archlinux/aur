pkgname=grabit
pkgver=1.1.5
pkgrel=1
pkgdesc="Screenshot, screen recording, and file uploader with OCR support for Zipline and other services"
arch=('any')
url="https://heliopolis.live/creations/grabit.git"
license=('BSD')
depends=('bash' 'curl' 'jq' 'xdg-utils' 'python' 'tk' 'libnotify' 'python-pillow' 'python-screeninfo')
optdepends=(
  'grim: Wayland screenshot support'
  'slurp: Wayland region selection'
  'wl-clipboard: Wayland clipboard'
  'wf-recorder: Wayland screen recording'
  'flameshot: X11 screenshot support'
  'xclip: X11 clipboard'
  'ffmpeg: X11 screen recording'
  'slop: X11 region selection for recording'
  'python-pyocr: OCR text extraction'
  'tesseract: OCR engine'
  'spectacle: KDE screenshot and recording support'
)
source=("git+https://heliopolis.live/creations/grabit.git#tag=v${pkgver}")
sha256sums=('aa07a4d8d8b3143b70af1dd40240aa89923306aa8a477c7983b05fc1bc446d3d')

package() {
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/$pkgname"/* "$pkgdir/usr/share/$pkgname"

  chmod +x "$pkgdir/usr/share/$pkgname/main.sh"
  chmod +x "$pkgdir/usr/share/$pkgname/helpers/show_image.py"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/main.sh" "$pkgdir/usr/bin/grabit"
}
