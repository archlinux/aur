pkgname=grabit
pkgver=1.1.6
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
sha256sums=('e3fd06785924d3169e0c823874b2147ae92463cd7cf7a08e5fb2fe87b5343612')

package() {
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/$pkgname"/* "$pkgdir/usr/share/$pkgname"

  chmod +x "$pkgdir/usr/share/$pkgname/main.sh"
  chmod +x "$pkgdir/usr/share/$pkgname/helpers/show_image.py"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/main.sh" "$pkgdir/usr/bin/grabit"
}
