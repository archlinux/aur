# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname='python-stormssh'
_name=storm
pkgver=0.7.0
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
sha256sums=('c2e5da1cb4a27b309ed7e470c5acebe2822f7928c5ef0e38f9dade247cf9a6c6')

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
