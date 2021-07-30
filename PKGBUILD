# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Sergey Mastykov <smastykov at gmail dot com>

pkgname=python-pyramid
pkgver=2.0
pkgrel=2
pkgdesc='A very general open source Python web framework.'
arch=('any')
url='https://github.com/Pylons/pyramid'
license=('custom:RPL')
depends=('python-hupper>=1.5'
         'python-plaster'
         'python-plaster-pastedeploy'
         'python-translationstring>=0.4'
         'python-venusian>=1.0'
         'python-webob>=1.8.3'
         'python-zope-deprecation>=3.5.0'
         'python-zope-interface>=3.8.0')
makedepends=('python-webtest'
             'python-zope-component'
             'python-nose'
             'python-virtualenv'
             'python-repoze.lru'
             'python-setuptools')
optdepends=('python-pyramid-debugtoolbar: development mode'
            'python-pastedeploy: pserve/pcreate'
            'python-chameleon: pserve/pcreate'
            'python-waitress: pserve/pcreate')

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pyramid/pyramid-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/p/pyramid/pyramid-$pkgver.tar.gz.asc")
sha256sums=('45431b387587ed0fac6213b54d6e9f0936f0cc85238a8f5af7852fc9484c5c77'
            'SKIP')
validpgpkeys=('CC1A48C957AC6ABEF05B2C596BC977B056B829E5')

build() {
  cd pyramid-$pkgver
  python setup.py build
}

# check() {
#   cd pyramid-$pkgver
#   # this fails because testing can be done only once pyramid is installed...
#   # nosetests
# }

package() {
  cd pyramid-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
