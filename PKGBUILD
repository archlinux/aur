#Maintainer: Kirill Gagarski <kirill.gagarski [at] gmail.com>
pkgname=gi

pkgver=0.1.3
pkgrel=2
pkgdesc="Git wrapper to perform Mercurial-like short unique abbreviation searching for commands"
arch=('any')
url="https://github.com/gagarski/gi"
license=('custom')
makedepends=('python-setuptools' 'git')
depends=('python' 'python-marisa-trie' 'git')
provides=('gi')
conflicts=('gi')
install=
source=(git+https://github.com/gagarski/$pkgname.git#tag=$pkgver)
md5sums=('SKIP')

optdepends=('gi-bash-completion: for bash-completion support')

package() {
  cd "$srcdir/$pkgname"
  git checkout $pkgver
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -m0755 -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m0644 $srcdir/$pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
