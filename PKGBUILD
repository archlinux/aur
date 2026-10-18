# Maintainer: Bingusfan360 <bingusfan360@proton.me>
#
# MOSS language (compiler + runtime + adaptation system) for Arch.
# Companion package to the `moss` application package: this one installs the
# `moss-lang` console script and the `compiler`/`runtime` import packages
# plus runnable `.moss` examples under /usr/share/moss-language/examples.
# The bare `moss` command belongs to the application (BIN-949/BIN-950).
#
# BIN-1711: AUR publication was approved by the board (approval
# 5f810f99-4954-4611-bc68-cfcbd55c0a54). sha256sums is the real hash of the
# public v0.3.1 archive. license=unknown until the maintainer declares one
# (the repo currently has no LICENSE file / SPDX in pyproject).
pkgname=moss-language
pkgver=0.3.1
pkgrel=1
pkgdesc="The MOSS language: compiler, runtime, and adaptation system (standard-library-only). Companion to the moss application."
arch=('any')
url="https://gitlab.com/Bingusfan360/mahoraga-language"
license=('unknown')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$url/-/archive/v0.3.1/mahoraga-language-v0.3.1.tar.gz")
sha256sums=('5a8f15202c262b6ba1d2829b355d11db08fd5b9a566de5a2909d9cc6d5ea96d1')

build() {
  cd "mahoraga-language-v0.3.1"
  python -m build --wheel
}

package() {
  cd "mahoraga-language-v0.3.1"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
