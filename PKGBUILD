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
sha256sums=('c4faab0a7dd92aef92b48b1c58bce7b80aefc8239b64abb4bcf60dacd9fc1fb2')

package() {
  cd "${srcdir}/Pueue-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -Dm644 utils/pueue.service "/usr/lib/systemd/user/pueue.service"
}
