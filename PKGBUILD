# Maintainer: Javier Tia <javier dot tia at gmail dot com>
pkgname='python-stormssh'
_name=storm
pkgver=0.6.7
pkgrel=2
pkgdesc='Manage your SSH like a boss'
url='https://github.com/emre/storm'
arch=('any')
license=('MIT')
depends=('python' 'python-six' 'python-paramiko' 'python-termcolor' 'python-flask')
conflicts=('python2-stormssh-git')
replaces=('python2-stormssh-git')
makedepends=('python')
provides=("${_name}=${pkgver}")
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('79bf34ad688ad870fe8c5cd549028f1fed85782480303cc2cf01eb2cb8a61ecf')

# Enable for tests
# check() {
  # cd "${srcdir}/${_name}-${pkgver}"
  # python setup.py check
# }

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
