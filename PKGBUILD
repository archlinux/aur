# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=python2-neovim
_realname=pynvim
pkgver=0.3.2
pkgrel=1
pkgdesc='Python client for Neovim'
url='https://github.com/neovim/pynvim'
arch=('any')
license=('Apache')
depends=('python2' 'python2-msgpack' 'python2-greenlet')
makedepends=('python2-setuptools')
source=("https://github.com/neovim/python-client/archive/${pkgver}.tar.gz")
sha256sums=('0a44c540dd5790acfbc7e411b0ed4fb6c44914d866226ebebf370c24c2723dc2')

prepare() {
  sed -i "s/msgpack-python/msgpack/g" ${_realname}-${pkgver}/setup.py
}

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python2 setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}

# vim:set sw=2 sts=2 et:

