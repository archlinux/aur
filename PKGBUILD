# Maintainer: Ezequiel Aurtenechea <ezequiel.aurtenechea at gmail dot com>
pkgname=python-pytsk3
_pkgcode=pytsk3
pkgver=20190507
pkgrel=1
pkgdesc="Python bindings for the sleuthkit (http://www.sleuthkit.org/)" 
url="https://pypi.org/project/pytsk3/"
arch=('any')
license=('Apache')

depends=('sleuthkit')
makedepends=('python' 'sleuthkit' 'gcc' )

md5sum=d1320bd1e2f7fd27512a564ec40e9636
source=(https://files.pythonhosted.org/packages/dd/b7/50f00e0a6602b2465584fc12971e2f9b07544c3f6dad3042007e2b2ee6db/$_pkgcode-$pkgver.tar.gz)
md5sums=($md5sum)

build() {
  cd $srcdir/${_pkgcode}-${pkgver}

  python setup.py build
}

package() {
  cd $srcdir/${_pkgcode}-${pkgver}
  python setup.py install --root="${pkgdir}"
}
