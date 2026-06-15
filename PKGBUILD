pkgname=maestro-bin
pkgver=2.6.1
pkgrel=1
pkgdesc='Mobile UI testing framework (binary release)'
arch=('any')
url='https://maestro.dev'
license=('Apache-2.0')
depends=('bash' 'java-runtime-headless>=17')
provides=('maestro')
conflicts=('maestro' 'maestro-dev')
source=("maestro-${pkgver}.zip::https://github.com/mobile-dev-inc/maestro/releases/download/cli-${pkgver}/maestro.zip")
sha256sums=('3440825f514f537c6a96bcf5de995780c2a4a7f83a43208fdc95d4f1fecfad3b')

package() {
  install -d "$pkgdir/opt/maestro" "$pkgdir/usr/bin"
  cp -a maestro/. "$pkgdir/opt/maestro/"
  ln -s /opt/maestro/bin/maestro "$pkgdir/usr/bin/maestro"
}
