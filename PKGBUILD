# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=python2-expyriment
pkgver=0.7.0
pkgrel=1
pkgdesc="Library for behavioural and neuroimaging experiments"
arch=(any)
url="http://www.expyriment.org/"
license=(GPL)
# I think this is the minimal set of dependencies
depends=('python2' 'python2-pygame' 'python2-opengl')
optdepends=('python2-pyserial: Serial port communication'
            'python2-pyparallel: Parallel port communication'
	    'python2-numpy: Data export tools etc')

options=(!emptydirs)
source=(https://github.com/expyriment/expyriment/releases/download/v${pkgver}/expyriment-${pkgver}.zip
	python2.patch)
md5sums=('db9d08cbd45f82815abd00cf663b10c4'
         '9669f786af1775474369f578a59a73fc')

build() {
  cd "${srcdir}/expyriment"-${pkgver}
  patch -Np1 -i ../python2.patch
}

package() {
  cd "${srcdir}/expyriment"-${pkgver}
  python2 setup.py install --root="$pkgdir/"
}
