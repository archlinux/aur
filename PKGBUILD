# Maintainer: Emilio Reggi <nag@mailbox.org>

pkgname=freezetag-git
_pkgname=freezetag
_source=https://github.com/x1ppy/freezetag
pkgver=r24.89ac8a8
pkgrel=1
pkgdesc='A tool that saves, strips, and restores file paths and music metadata.'
url='https://github.com/x1ppy/freezetag'
license=('unknown')
arch=('any')
depends=('python' 'fuse' 'python-fuse' 'python-construct' 'python-watchdog' 'python-setuptools')
makedepends=('git')
provides=('freezetag')
conflicts=('freezetag')
source=("${_pkgname}"::"git+${_source}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
