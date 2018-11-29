# Maintainer: Michał Sałaban <michal@salaban.info>
_modulename="crossplane"
pkgname="python2-${_modulename}"
pkgver=0.4.12
pkgrel=1
pkgdesc='Quick and reliable way to convert NGINX configurations into JSON and back.'
license=('Apache')
arch=('any')
url='https://github.com/nginxinc/${_modulename}.git'
makedepends=('python2' 'python2-distribute')
depends=('python2' 'python2-requests' 'python2-dateutil')
source=("https://github.com/nginxinc/${_modulename}/archive/v${pkgver}.tar.gz")
md5sums=('a85ec248042c618027a5c57b5cd67f14')

build() {
  cd "${srcdir}/${_modulename}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_modulename}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
