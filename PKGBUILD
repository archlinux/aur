# Maintainer: Igor Kalicinski <igorkalicinski@gmail.com>
pkgname=twig-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight Git GUI with native Wayland support — lighter than the rest"
arch=('x86_64')
url="https://github.com/hoxton314/git-twig"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('twig')
conflicts=('twig' 'twig-git')
options=('!strip')

source_x86_64=("$pkgname-$pkgver.AppImage::https://github.com/hoxton314/git-twig/releases/download/v${pkgver}/twig_${pkgver}_amd64.AppImage"
               "twig.desktop::https://github.com/hoxton314/git-twig/releases/download/v${pkgver}/twig.desktop"
               "twig.png::https://github.com/hoxton314/git-twig/releases/download/v${pkgver}/twig.png")
sha256sums_x86_64=('SKIP' 'SKIP' 'SKIP')

package() {
  # Install AppImage binary
  install -Dm755 "$pkgname-$pkgver.AppImage" "$pkgdir/usr/bin/twig"

  # Install desktop entry
  install -Dm644 "twig.desktop" "$pkgdir/usr/share/applications/twig.desktop"

  # Install icon
  install -Dm644 "twig.png" "$pkgdir/usr/share/pixmaps/twig.png"
}
