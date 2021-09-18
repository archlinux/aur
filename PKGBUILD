# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=aliyunpan
pkgname=${_pkgname}-cli
pkgver=2.7.14
pkgrel=1
pkgdesc="Aliyunpan CLI"
arch=('any')
url="https://github.com/wxy1343/aliyunpan"
license=("GPL-3.0")
makedepends=('python-setuptools')
depends=('python-click-aliases'
         'python-requests'
         'python-pyexecjs'
         'python-rsa'
         'python-colorama'
         'python-flask'
         #'python-pyperclip'
         'python-pyperclip-git'
         'python-npyscreen'
		 'python-ruamel-yaml'
		 'python-ruamel-base'
		 'python-treelib'
         'aria2p')
provides=('aliyunpan')
source=(${_pkgname}-${pkgver}.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
        dlnap-master.tar::"https://github.com/cherezov/dlnap/archive/master.tar.gz")
sha256sums=('d5b86bf040781c9e6981cba07ef1daab4d8f7ff4d6e17d910018a48a4f5fa7da'
            'SKIP')

prepare() {
  cd "${_pkgname}-${pkgver}"
  mv -vTf "${srcdir}"/dlnap-master dlnap
}

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set et ts=2 sw=2:
