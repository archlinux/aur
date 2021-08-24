# Maintainer: Supdrewin <https://github.com/supdrewin>

pkgname=batterycm-switcher-preview
pkgver=1.1.0
pkgrel=1
pkgdesc="An advanced Ideapad Laptops conservation mode adjustment tool"
arch=('any')

url="https://github.com/supdrewin/batterycm-switcher"
license=('GPL3')

depends=('bash' 'coreutils' 'man-db' 'polkit' 'vim')
makedepends=('git' 'gzip' 'make' 'xz')
optdepends=(
  'acpid: For enable use function key to switch mode'
  'espeak: For enable show status using voice'
  'systemd: For optional function key backend service'
)

provides=('batterycm' 'batterycm-switcher' 'batterycm-charger')
conflicts=('batterycm' 'batterycm-switcher' 'batterycm-charger')

_srcname=batterycm-switcher
install=batterycm.install
source=("$_srcname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$_srcname-$pkgver"
  make
}

package() {
  cd "$_srcname-$pkgver"
  make DESTDIR="$pkgdir" install
}
