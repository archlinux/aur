# Maintainer: Thiago Kenji Okada <thiago DOT mast3r AT gmail DOT com>

pkgname='burgaur'
pkgver=2.0
pkgrel=1
pkgdesc='A delicious AUR helper. Made from cower.'
arch=('any')
url="https://github.com/m45t3r/burgaur"
license=('MIT')
depends=('cower' 'pacman' 'python' 'python-termcolor' 'sudo')
optdepends=('mc: review packages before installing')
source=("${url}/archive/${pkgver}.tar.gz")
install='burgaur.install'
sha256sums=('051c29ce8f27772531bfccc696d99aaf832d3c5aaa804c06f85146d60d4f2e05')
conflicts=('burgaur-git')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/"
  install -Dm644 burgaur.1.gz "${pkgdir}/usr/share/man/man1/burgaur.1.gz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=8 et sw=2 sts=2
