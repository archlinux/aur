# Maintainer: Arne Beer <arne@twobeer.de>

gitname=pueue
pkgname=${gitname}-git
pkgver=0.3.5
pkgrel=1
arch=('any')
pkgdesc='A command scheduler for shells'
license=('MIT')
depends=('python')
url='https://github.com/nukesor/pueue'
source=("https://github.com/Nukesor/pueue/archive/${pkgver}.tar.gz")
sha256sums=('bd8d387e4619ea2eb4f0696da04a30f80e6f14f9142ff87035e0bb5ecdc63b1c')

package() {
  cd "${srcdir}/${gitname}-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -Dm644 "utils/${gitname}.service" "${pkgdir}/usr/lib/systemd/user/${gitname}.service"
}
