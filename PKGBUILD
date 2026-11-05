# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-rosbags
pkgver=0.11.9
pkgrel=2
pkgdesc='Pure Python library to read, modify, convert, and write rosbag files'
arch=(any)
url='https://gitlab.com/ternaris/rosbags'
license=('Apache-2.0')
depends=('python' 'python-apsw' 'python-lz4' 'python-numpy' 'python-ruamel-yaml' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
source=("git+https://gitlab.com/ternaris/rosbags.git#tag=v${pkgver}")
sha256sums=('7baa6106887b6f610076316987294860c9df675d8665393ff425c736e98139a2')

_pkgname=rosbags

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
