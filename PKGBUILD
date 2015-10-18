# Maintainer: Arne Beer <arne@twobeer.de>

pkgname=pueue-git
pkgver=0.3.5
pkgrel=1
arch=('any')
pkgdesc='A command scheduler for shells'
license=('MIT')
depends=('python')
url='https://github.com/nukesor/pueue'
source=("https://github.com/Nukesor/Pueue/archive/${pkgver}.tar.gz")
sha256sums=('be54593b219edde13fb3d0ca31e05e36e26e376f222cb9dbff986b2ef0880d49')

package() {
  cd "${srcdir}/Pueue-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -Dm644 utils/pueue.service "/usr/lib/systemd/user/pueue.service"
}
