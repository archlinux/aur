# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=python2-pynvim
_realname=pynvim
pkgver=0.4.1
pkgrel=1
pkgdesc='Python client for Neovim'
url='https://github.com/neovim/pynvim'
arch=('any')
license=('Apache')
depends=('python2' 'python2-msgpack' 'python2-greenlet' 'python2-trollius')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-pytest-runner')
provides=('python2-neovim')
replaces=('python2-neovim')
source=("https://github.com/neovim/python-client/archive/${pkgver}.tar.gz")
sha256sums=('132ea5c226399aed45a959f1d8efe8cdd89a769a672534722760a9a67b06dfa0')


build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python2 setup.py pytest
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python2 setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}

# vim:set sw=2 sts=2 et:

