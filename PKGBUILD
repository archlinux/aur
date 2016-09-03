# Maintainer: S.Leduc <sebastien@sleduc.fr>
pkgname=python-fancycompleter
_realpkg=fancycompleter
pkgver=0.5
pkgrel=1
pkgdesc="Colorful TAB completion for Python prompt"
arch=("any")
url="https://bitbucket.org/antocuni/fancycompleter"
license=('GPL')
depends=('python' 'python-pyrepl-hg')
install="$pkgname.install"
source=("https://pypi.python.org/packages/2d/4c/753646af3c4eafc6a4e4a0886f1becd09ddb3bb179bd3c350d8ac357b29a/${_realpkg}-${pkgver}.tar.gz"
        'fix-py3-unicode-str.patch')
md5sums=('5eacad3b56b3b6a8435af44df7899e65'
         '1a2d75376f69e08fd9cd6efc222489c8')

prepare() {
  cd "$srcdir/$_realpkg-$pkgver"
  patch -Np1 < ../fix-py3-unicode-str.patch
}

package() {
  cd "$srcdir/$_realpkg-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
