pkgname=grabit
pkgver=1.0.4
pkgrel=1
pkgdesc="Screenshot and file uploader for Zipline and other services"
arch=('any')
url="https://git.creations.works/creations/grabit"
license=('BSD')
depends=('bash' 'curl' 'jq' 'xdg-utils' 'python' 'tk')
optdepends=(
  'grim: Wayland screenshot support'
  'slurp: Wayland region selection'
  'wl-clipboard: Wayland clipboard'
  'flameshot: X11 screenshot support'
  'xclip: X11 clipboard'
  'python-pillow: image preview'
  'python-screeninfo: screen placement'
)
source=("git+https://git.creations.works/creations/grabit.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/$pkgname"/* "$pkgdir/usr/share/$pkgname"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/main.sh" "$pkgdir/usr/bin/grabit"
}
