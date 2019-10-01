# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=git-revise
pkgdesc="A git subcommand to efficiently update, split, and rearrange commits"
pkgver=0.5.0
pkgrel=1
arch=('any')
url="https://mystor.github.io/git-revise.html"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/g/git-revise/git-revise-$pkgver.tar.gz")
depends=('git' 'python')
makedepends=('python-setuptools')

package() {
  cd $srcdir/$pkgname-$pkgver
  sed --in-place s!man/man1!share/man/man1! setup.py
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

sha256sums=('72c6ff5b3180220dafcecb11399a26d526893f139e07e8be91f295a567af5d9b')
