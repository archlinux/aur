# Maintainer: robertfoster

pkgname=gyp-git
pkgver=2174.1615ec32
pkgrel=1
pkgdesc="GYP can Generate Your Projects."
url="https://code.google.com/p/gyp/"
arch=('x86_64')
makedepends=('git')
depends=('python' 'python-setuptools')
license=('custom')
source=("gyp::git+https://chromium.googlesource.com/external/gyp")
conflicts=('gyp-svn' "${pkgname%-git}")
replaces=('gyp-svn')
provides=("${pkgname%-git}")

pkgver() {
  cd gyp
  echo "$(git rev-list --count master).$(git rev-parse --short master)"
}

package() {
  cd gyp
  python3 setup.py install --root="$pkgdir"
}

sha256sums=('SKIP')
