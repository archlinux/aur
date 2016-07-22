# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgbase=python-e4u
pkgname=('python-e4u' 'python2-e4u')
pkgver=0.1rc4
pkgrel=2
epoch=1
pkgdesc="Bundle Library of emoji4unicode at Google"
arch=('any')
url="https://github.com/lambdalisue/e4u"
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools' 'python-beautifulsoup4' 'python2-beautifulsoup3')
options=('!strip' '!emptydirs')

source=("$pkgbase-$pkgver.tar.gz"::"https://github.com/lambdalisue/e4u/archive/${pkgver}.tar.gz")
sha512sums=(SKIP)

build(){
  cd $srcdir
  cp -r e4u-${pkgver} python2-e4u-${pkgver}
}

package_python-e4u() {
  depends=('python' 'python-beautifulsoup4')

  cd "${srcdir}/e4u-${pkgver}"
  python3 setup.py install --root=$pkgdir --optimize=1
}

package_python2-e4u() {
  depends=('python2' 'python2-beautifulsoup3')

  cd "${srcdir}/python2-e4u-${pkgver}"
  python2 setup.py install --root=$pkgdir --optimize=1
}

check(){
  cd ${srcdir}/e4u-${pkgver}
  #python3 setup.py test

  cd ${srcdir}/python2-e4u-${pkgver}
  python2 setup.py test
}