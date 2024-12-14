# Maintainer Rhys Perry <rhysperry111 AT gmail.com>

pkgname=foxify-cli-git
conflicts=('foxify-cli')
provides=('foxify-cli')
pkgver=4a780aa
pkgrel=3
pkgdesc='Firefox Command-Line Theme Manager'
arch=(any)
url='https://github.com/M4cs/foxify-cli'
license=(GPL3)
makedepends=(python-setuptools git)
depends=(python python-requests python-ruamel-yaml python-psutil python-fuzzywuzzy python-tqdm python-colorama python-levenshtein python-gitpython)
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
