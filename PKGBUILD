# Maintainer: Arne Beer <arne@twobeer.de>

_gitname=pueue
pkgname=${_gitname}-git
pkgver=0.3.6
pkgrel=1
arch=('any')
pkgdesc='A command scheduler for shells'
license=('MIT')
depends=('python' 'python-setuptools')
url='https://github.com/nukesor/pueue'
source=("https://github.com/Nukesor/pueue/archive/${pkgver}.tar.gz")
sha256sums=('bd8d387e4619ea2eb4f0696da04a30f80e6f14f9142ff87035e0bb5ecdc63b1c')

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -Dm644 "utils/${_gitname}.service" "${pkgdir}/usr/lib/systemd/user/${_gitname}.service"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
