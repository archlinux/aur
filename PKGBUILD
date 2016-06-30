#Maintainer: Kirill Gagarski <kirill.gagarski [at] gmail.com>
pkgname=gi

pkgver=0.0.2
pkgrel=1
pkgdesc="Git wrapper to perform Mercurial-like short unique abbreviation searching for commands"
arch=('any')
url="https://bitbucket.org/gagarski/gi"
license=('custom')
makedepends=('python-setuptools' 'git')
depends=('python' 'python-marisa-trie' 'git')
provides=('gi')
conflicts=('gi')
install=
source=(git+https://gagarski@bitbucket.org/gagarski/$pkgname.git#tag=$pkgver)
md5sums=('SKIP')

optdepends=('gi-bash-completion: for bash-completion support')

package() {
  cd "$srcdir/$pkgname"
  git checkout $pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp $srcdir/$pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
