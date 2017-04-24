# $Id: PKGBUILD 155857 2016-01-10 14:08:28Z jelle $
# Maintainer: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>

pkgname=hgsvn
pkgver=0.3.12
pkgrel=1
pkgdesc='A set of scripts to work locally on Subversion checkouts using Mercurial'
arch=('any')
url='http://pypi.python.org/pypi/hgsvn/'
license=('GPL')
depends=('python2' 'subversion' 'mercurial' 'python2-setuptools' 'python2-hglib')
makedepends=('python2-nose')
checkdepends=('mercurial' 'subversion')
source=("https://pypi.python.org/packages/source/h/hgsvn/hgsvn-$pkgver.zip")
md5sums=('e4c4f95020c8737e5598ccb687701b4d')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  # Makes hg commit work
  MAIL='john doe <john@doe.com>' python2 setup.py test
}
