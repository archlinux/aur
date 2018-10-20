# Maintainer: Thiago Kenji Okada <thiagokokada AT gmail DOT com>

pkgname='burgaur'
pkgver=2.3
pkgrel=1
pkgdesc='A delicious AUR helper. Made from cower.'
arch=('any')
url="https://github.com/m45t3r/burgaur"
license=('MIT')
depends=('cower' 'pacman' 'python' 'python-termcolor' 'sudo')
makedepends=('python-setuptools')
optdepends=('mc: review packages before installing')
source=("${url}/archive/${pkgver}.tar.gz")
install='burgaur.install'
sha256sums=('ee8b32f4eb5d2427d2784c2f202cb19a4ab715323384e833d377ec41f1a9fe52')
conflicts=('burgaur-git')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/"
  install -Dm644 burgaur.1.gz "${pkgdir}/usr/share/man/man1/burgaur.1.gz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 bash_completion "${pkgdir}/usr/share/bash-completion/completions/burgaur"
}

# vim: ts=8 et sw=2 sts=2
