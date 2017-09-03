# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name='git-praise'
pkgname='praise'
pkgver=1.2.0
pkgrel=1
pkgdesc='A nicer git blame'
url='https://github.com/sigvef/git-praise'
arch=('any')
license=('MIT')
depends=('python' 'python-gitpython' 'python-pygments' 'python-click'
         'python-termcolor' 'flake8')
provides=("${_name}=${pkgver}")
# https://github.com/sigvef/git-praise/archive/v1.2.0.tar.gz
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3aacd1b2795d9e84980a642ff7eac9163eed98b61f9b1d33d2d0f18f3e83366b')

# Enable for tests
check() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py check
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  # install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
