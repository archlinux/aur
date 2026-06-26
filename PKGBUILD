# Maintainer: Twilight <>

pkgname=dory-git-tags-git
pkgver=r1
pkgrel=1
pkgdesc="Git integration extension for Dory file manager"
arch=('any')
url="https://github.com/Twilight0/dory-extensions"
license=('GPL3')
depends=('dory-python-git' 'git')
makedepends=('python-setuptools')
provides=('dory-git-tags')
conflicts=('dory-git-tags')
source=("$pkgname::git+https://github.com/Twilight0/dory-extensions.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname/dory-git-tags"
  python3 setup.py install --root="$pkgdir" --optimize=1
}
