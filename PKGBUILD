# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=python2-expyriment
pkgver=0.8.0
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
source=("$pkgname-$pkgver"::'git://github.com/expyriment/expyriment.git#tag=v0.8.0'
	python2.patch)
md5sums=('SKIP'
         '4682c22a943df56a7e5654cc2bc0c0a9')

build() {
  cd "${srcdir}/python2-expyriment"-${pkgver}
  patch -Np1 -i ../python2.patch
}

package() {
  cd "${srcdir}/python2-expyriment"-${pkgver}
  python2 setup.py install --root="$pkgdir/"
}
