# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=4.8.2
pkgrel=2
pkgdesc="Extensions to Ian Bicking's virtualenv tool"
arch=('any')
url="https://bitbucket.org/dhellmann/virtualenvwrapper"
license=('MIT')
depends=('python-virtualenv' 'python2-virtualenv' 'python-virtualenv-clone'
         'python-stevedore')
makedepends=('python-pbr')
conflicts=('python2-virtualenvwrapper')
replaces=('python2-virtualenvwrapper')
source=(https://pypi.org/packages/source/v/virtualenvwrapper/virtualenvwrapper-$pkgver.tar.gz)
sha256sums=('18d8e4c500c4c4ee794f704e050cf2bbb492537532a4521d1047e7dd1ee4e374')

build() {
  cd "$srcdir/virtualenvwrapper-$pkgver"

  python3 setup.py build
}

package() {
  cd "$srcdir/virtualenvwrapper-$pkgver"

  python3 setup.py install --root="$pkgdir" -O1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
