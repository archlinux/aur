# Maintainer: Stewart Webb <stew@rtwebb.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-luigi
pkgver=2.8.13
pkgrel=1
pkgdesc="Workflow mgmgt + task scheduling + dependency resolution"
arch=('any')
depends=('python' 'python-daemon' 'python-tornado')
makedepends=('python-setuptools' 'git')
url="https://github.com/spotify/luigi"
license=('Apache')
source=("git+https://github.com/spotify/luigi.git#tag=${pkgver}")
md5sums=('SKIP')
sha256sums=('SKIP')

build() {
  cd "$srcdir/luigi"
  python setup.py build
}

package() {
  cd "$srcdir/luigi"
  python setup.py install --root="$pkgdir" --optimize=1
}
