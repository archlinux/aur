# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=dory-emblems-git
pkgver=6.7.0.r0
pkgrel=1
pkgdesc="Emblems extension for Dory file manager (git)"
arch=('any')
url="https://github.com/Twilight0/dory-extensions"
license=('GPL3')
depends=('dory' 'python-dory-git')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/Twilight0/dory-extensions.git")
sha256sums=('SKIP')

pkgver() {
  cd dory-extensions
  printf "6.7.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd dory-extensions/dory-emblems
  python setup.py install --root="$pkgdir" --optimize=1
}
