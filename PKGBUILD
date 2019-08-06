# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=git-revise
pkgdesc="A git subcommand to efficiently update, split, and rearrange commits"
pkgver=0.4.2
pkgrel=2
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

sha256sums=('7aa3c572afb88d08ac6c307fa480c011a233e87d2c04d44401b44b53117401d7')
