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
sha256sums=('31c8a66703f31b461020ff371b30a2c16519ad41359787330f2f0b3c78d7ffcf')

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -Dm644 "utils/${_gitname}.service" "${pkgdir}/usr/lib/systemd/user/${_gitname}.service"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
