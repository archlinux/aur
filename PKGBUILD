# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=qtile-plasma-git
pkgver=v1.5.3.r0.g3c3106d
pkgrel=1
pkgdesc="A flexible, tree-based layout for Qtile"
arch=('any')
license=('MIT')
url='https://github.com/numirias/qtile-plasma'
depends=('python' 'python-setuptools' 'qtile')
makedepends=('python-setuptools' 'git')
source=("${pkgname}::git://github.com/numirias/qtile-plasma.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}"
  echo "qtile-plasma installed successfully, however it still needs to be enabled in your config"
  echo "See configuration introduction here: https://github.com/numirias/qtile-plasma/blob/master/README.md#installation"
}
