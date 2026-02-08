pkgname=grabit
pkgver=1.1.4
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
sha256sums=('faf8fb22d38475489919ef9d3f0c55868befbca45064288ebb65928f429c2275')

package() {
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/$pkgname"/* "$pkgdir/usr/share/$pkgname"

  chmod +x "$pkgdir/usr/share/$pkgname/main.sh"
  chmod +x "$pkgdir/usr/share/$pkgname/helpers/show_image.py"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/main.sh" "$pkgdir/usr/bin/grabit"
}
