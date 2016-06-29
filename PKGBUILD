# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname='python-stormssh'
_name=storm
pkgver=0.6.9
pkgrel=1
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
sha256sums=('29c20e4ed27604a7cdf2f77fe97d861100d87c0dbaa9ecf6628cf9da917e98ce')

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
