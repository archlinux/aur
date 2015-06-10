# Maintainer: Achilleas Pipinellis <axilleas archlinux info>
pkgname=python2-gelatin-git
pkgver=r73.7865dfa
pkgrel=1
pkgdesc="Transform text files to XML, JSON, or YAML"
arch=(any)
url="https://github.com/knipknap/Gelatin"
license=('GPL2')
depends=('python2' 'python2-lxml' 'python2-yaml' 'python2-simpleparse')
makedepends=('python2-distribute')
source=("${pkgname}::git+https://github.com/knipknap/Gelatin.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
