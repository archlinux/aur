# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-rosbags
pkgver=0.9.19
pkgrel=1
pkgdesc='Pure Python library to read, modify, convert, and write rosbag files.'
arch=(any)
url='https://gitlab.com/ternaris/rosbags'
license=('Apache-2.0')
depends=('python' 'python-lz4' 'python-numpy' 'python-ruamel-yaml' 'python-zstandard')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("git+https://gitlab.com/ternaris/rosbags.git#tag=v${pkgver}")
sha256sums=('e79c012eb9a365e438baa319944f54375202e683bb3ac3e9cc1a4f0b4fe6c013')

_pkgname=rosbags

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
