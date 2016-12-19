# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=barpyrus-git
pkgver=r71.42fb779
pkgrel=1
pkgdesc="A python wrapper for lemonbar/conky"
arch=(any)
url="https://github.com/t-wissmann/barpyrus"
license=('BSD')
depends=('python' 'python-setuptools' 'lemonbar' 'siji-git' 'herbstluftwm')
optdepends=('conky: To use the conky widget')
source=("git+https://github.com/t-wissmann/barpyrus.git")
sha1sums=('SKIP')

pkgver() {
  cd barpyrus
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd barpyrus
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
