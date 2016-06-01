# Maintainer: orumin <dev@orum.in>

_gitroot=coccigrep
pkgname=coccigrep-git
provides=('coccigrep')
conflict=('coccigrep')
pkgver=v1.16.r1.g6d70e56
pkgrel=1
pkgdesc='coccigrep is a semantic grep for the C language based on coccinelle. Git HEAD Package version'
arch=('any')
url='http://http://home.regit.org/software/coccigrep/'
license=('GPL3')
depends=('python-setuptools')
makedepends=('python-setuptools')
source=("git+https://github.com/regit/$_gitroot.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitroot"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir/coccigrep"

  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0

}
