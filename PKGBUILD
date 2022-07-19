# Maintainer: S.Leduc <sebastien@sleduc.fr>
pkgname=python2-fancycompleter
_realname=fancycompleter
pkgver=0.9.1
pkgrel=1
pkgdesc="Colorful TAB completion for Python prompt"
arch=("any")
url="https://bitbucket.org/antocuni/fancycompleter"
license=('BSD')
depends=('python2' 'pyrepl')
install="$pkgname.install"
source=("https://files.pythonhosted.org/packages/source/${_realname::1}/$_realname/$_realname-$pkgver.tar.gz")

sha256sums=('09e0feb8ae242abdfd7ef2ba55069a46f011814a80fe5476be48f51b00247272')

build() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
