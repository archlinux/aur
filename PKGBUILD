pkgname=list-package-sizes.bash
_gitname=5694729
pkgver=d16cb6f
pkgrel=1
pkgdesc="Generate a list of all installed packages with their (theoretical) disk-usage as estimated by pacman."
arch=('any')
url="https://gist.github.com/zvyn/5694729"
license=('MIT')
depends=('pacman' 'bash' 'grep' 'awk')
makedepends=('git')
source=('git://gist.github.com/5694729.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

package() {
  install -Dm755 "$srcdir/$_gitname/list-package-sizes.bash"\
    "$pkgdir/usr/bin/list-package-sizes.bash"
}
