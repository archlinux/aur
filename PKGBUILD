# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=pslab-desktop
pkgver=2.6.0
pkgrel=1
pkgdesc="PSLab Desktop App"
arch=('x86_64')
url="https://pslab.io"
license=('GPL3')
depends=('electron' 'python-pslab')
makedepends=('git' 'npm')
provides=("${pkgname}")
conflicts=("${pkgname}-latest")
install=
source=(
  "https://github.com/fossasia/${pkgname}/releases/download/v${pkgver}/pslab-${pkgver}.tar.xz"
)
sha256sums=('c0a366bf0fc627f1ad9ca80e0663a89975070121d116235cff84318e4be46306')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/opt/"
  mkdir -p "$pkgdir/usr/bin/"
  cp -r pslab-$pkgver "$pkgdir/opt/pslab-desktop"
  ln -s /opt/pslab-desktop/pslab "$pkgdir/usr/bin/pslab-desktop"
  # TODO: desktop file
  #install -Dm 755 pslab.desktop "$pkgdir/usr/share/applications/pslab.desktop"
}
