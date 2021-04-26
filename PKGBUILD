# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-birdseye
_module=birdseye
pkgver=0.9.0
pkgrel=2
pkgdesc="Graphical Python debugger which lets you view the values of all evaluated expressions"
url="http://github.com/alexmojaki/birdseye"
depends=(python-littleutils python-flask-humanize python-humanize python-flask-humanize python-cheap_repr python-outdated python-sqlalchemy python-cached-property python-future python-asttokens)
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c24bbce229b52104554148153bf62cc63096a2cb2b19d4093bb677cd841a9335')

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${birdseye}/LICENSE"
}
