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
sha256sums=('e7efbdef9a8a825de18ff0dc592bbcee9ada9626b80ef029865a9fe1d21cd07a')

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -Dm644 "utils/${_gitname}.service" "${pkgdir}/usr/lib/systemd/user/${_gitname}.service"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
