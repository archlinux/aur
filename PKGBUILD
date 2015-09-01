# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=python2-ddg-git
epoch=1
pkgver=0.80.3bb0830
pkgrel=1
pkgdesc="Duckduckgo zero-click api for your command-line"
arch=('i686' 'x86_64')
url="https://github.com/justinls/ddg"
license=('MIT')
makedepends=('git')
depends=('python2')

source=(
  'git+git://github.com/justinls/ddg.git'
)

sha256sums=(
  'SKIP'
)
_gitname="ddg"

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
