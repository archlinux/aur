# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=3.6.1
pkgrel=1
pkgdesc="Extensions to Ian Bicking's virtualenv tool"
arch=('any')
url="http://www.doughellmann.com/projects/virtualenvwrapper/"
license=('BSD')
depends=('python-virtualenv' 'python2-virtualenv' 'python-virtualenv-clone'
         'python-stevedore')
conflicts=('python2-virtualenvwrapper')
replaces=('python2-virtualenvwrapper')
source=(http://pypi.python.org/packages/source/v/virtualenvwrapper/virtualenvwrapper-$pkgver.tar.gz)
sha256sums=('755fbf14e86a9c61252a9f2d5788460cf2523bb08402282151978a33d5a09a7d')

package() {
  cd "$srcdir/virtualenvwrapper-$pkgver"

  python3 setup.py install --root="$pkgdir" -O1

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  # Extract the license from README.txt
  sed -n '/Copyright/,$ p' README.txt \
    >"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
