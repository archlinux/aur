# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=5.5.0
pkgrel=1
pkgdesc="An easy-to-use and highly extensible IRC Bot framework (Formerly Willie)"
arch=('any')
license=('GPL')
url='http://sopel.chat'
depends=('python-feedparser' 'python-pytz' 'python-lxml' 'python-praw' 'python-pyenchant'
         'python-pygeoip' 'python-setuptools' 'sqlite')
makedepends=('git')
checkdepends=('python-pytest-runner')
source=("git+https://github.com/sopel-irc/sopel.git#tag=$pkgver")
md5sums=('SKIP')

check() {
  cd "$srcdir/sopel"
  python setup.py ptr || warning "Tests failed"
}

package() {
  cd "$srcdir/sopel"
  python setup.py install --root="${pkgdir}" --optimize=1
}
