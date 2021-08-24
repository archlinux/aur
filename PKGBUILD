# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>

pkgname=cmdpxl-git
_gitname="cmdpxl"
pkgver=r53.a0dd828
pkgrel=1
pkgdesc="A totally practical command-line image editor"
license=("custom")
arch=("x86_64" "aarch64")
url="https://github.com/knosmos/cmdpxl"
source=("git+$url.git")
md5sums=("SKIP")
makedepends=("python-setuptools")
depends=("python-opencv" "python-numpy" "python-click")

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
