# Maintainer: Thiago Kenji Okada <thiago DOT mast3r AT gmail DOT com>

pkgname='burgaur'
pkgver=2.1
pkgrel=1
pkgdesc='A delicious AUR helper. Made from cower.'
arch=('any')
url="https://github.com/m45t3r/burgaur"
license=('MIT')
depends=('cower' 'pacman' 'python' 'python-termcolor' 'sudo')
optdepends=('mc: review packages before installing')
source=("${url}/archive/${pkgver}.tar.gz")
install='burgaur.install'
sha256sums=('486a0769eec6e2b57787f75cc7a91b9bff744b6755eeacd4ee66c1ee1b4f38f6')
conflicts=('burgaur-git')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/"
  install -Dm644 burgaur.1.gz "${pkgdir}/usr/share/man/man1/burgaur.1.gz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=8 et sw=2 sts=2
