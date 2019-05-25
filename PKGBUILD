# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-pyvcf
_pkgname=PyVCF
pkgver=0.6.8
_commit_hash=bfcedb9bad1a14074ac4526ffdb610611e073810
pkgrel=1
pkgdesc="Variant Call Format (VCF) parser for Python"
arch=('any')
url=https://pyvcf.readthedocs.io/en/latest/index.html
license=('custom')
depends=('python')
makedepends=('python-setuptools')
#source=("https://github.com/jamescasbon/${_pkgname}/archive/${pkgver}.tar.gz")
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/jamescasbon/PyVCF/archive/${_commit_hash}.tar.gz")
sha256sums=('be575aa7d21b8ef6029b513c5d0d4e3abde57d16cf5ca55ccb2122f54209c511')

build() {
  #cd "$srcdir/$_pkgname-$pkgver"
  cd "$srcdir/$_pkgname-$_commit_hash"
  python setup.py build
}


package(){
  #cd "$srcdir/$_pkgname-$pkgver"
  cd "$srcdir/$_pkgname-$_commit_hash"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
