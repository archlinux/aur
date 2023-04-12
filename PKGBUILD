# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
pkgname=conservation_mode
pkgver=0.1.1
pkgrel=1
pkgdesc="enable conservation_mode for lenovo laptop"
arch=('i686' 'x86_64')
license=('GPL3')
depends=(systemd)
makedepends=()
conflicts=()
provides=()
source=("conservation_mode.service"
        "conservation_mode.sh")

md5sums=( 'bef5ce746f5e702300883b8810e2617e'
          '6befeda5a6834bee7e49d2778e1f242a')

package() {
  install -Dm644 "${startdir}/${pkgname}.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"

  install -Dm775 "${startdir}/${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}.sh"

  echo to enable, run systemctl enable conservation_mode
  echo to temporarily disble, sudo conservation_mode.sh 0
}
