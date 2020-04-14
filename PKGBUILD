pkgname=foxify-cli-git
conflicts=('foxify-cli')
provides=('foxify-cli')
pkgver=998c0d2
pkgrel=1
pkgdesc='Firefox Command-Line Theme Manager'
arch=(any)
url='https://github.com/M4cs/foxify-cli'
license=(GPL3)
depends=(python python-setuptools python-requests python-ruamel-yaml python-psutil)
source=("foxify-cli-git::git+https://github.com/M4cs/foxify-cli.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"

  python setup.py install --root="$pkgdir" --optimize=1
}
