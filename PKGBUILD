pkgname=grabit
pkgver=1.0.9
pkgrel=1
pkgdesc="Screenshot, screen recording, and file uploader with OCR support for Zipline and other services"
arch=('any')
url="https://heliopolis.live/creations/grabit.git"
license=('BSD')
depends=('bash' 'curl' 'jq' 'xdg-utils' 'python' 'tk' 'libnotify')
optdepends=(
  'grim: Wayland screenshot support'
  'slurp: Wayland region selection'
  'wl-clipboard: Wayland clipboard'
  'wf-recorder: Wayland screen recording'
  'flameshot: X11 screenshot support'
  'xclip: X11 clipboard'
  'ffmpeg: X11 screen recording'
  'slop: X11 region selection for recording'
  'python-pillow: image preview'
  'python-screeninfo: screen placement'
  'python-pyocr: OCR text extraction'
  'tesseract: OCR engine'
  'spectacle: KDE screenshot and recording support'
)
source=("git+https://heliopolis.live/creations/grabit.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/$pkgname"/* "$pkgdir/usr/share/$pkgname"

  chmod +x "$pkgdir/usr/share/$pkgname/main.sh"
  chmod +x "$pkgdir/usr/share/$pkgname/helpers/show_image.py"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/main.sh" "$pkgdir/usr/bin/grabit"
}
