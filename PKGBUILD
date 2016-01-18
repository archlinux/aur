# Maintainer: Thiago Kenji Okada <thiago DOT mast3r AT gmail DOT com>

pkgname='burgaur'
pkgver=2.2
pkgrel=2
pkgdesc='A delicious AUR helper. Made from cower.'
arch=('any')
url="https://github.com/m45t3r/burgaur"
license=('MIT')
depends=('cower' 'pacman' 'python' 'python-termcolor' 'sudo')
makedepends=('python-setuptools')
optdepends=('mc: review packages before installing')
source=("${url}/archive/${pkgver}.tar.gz")
install='burgaur.install'
sha256sums=('0f2d2e1ca8eafa9733c3c35d96760dd034e1c8d11f906cbf896b89895cf5e6be')
conflicts=('burgaur-git')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/"
  install -Dm644 burgaur.1.gz "${pkgdir}/usr/share/man/man1/burgaur.1.gz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=8 et sw=2 sts=2
