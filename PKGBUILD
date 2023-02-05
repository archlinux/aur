# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgbase='python-aimrocks'
pkgname=('python-aimrocks')
_module='aimrocks'
pkgver='0.3.1'
pkgrel=2
pkgdesc="RocksDB wrapper implemented in Cython."
url="https://github.com/aimhubio/aimrocks"
depends=(
  'python'
  'cython'
  # 'python-setuptools'
  'rocksdb'
  'bzip2'
  'lz4'
  'snappy'
  'zlib'
  'zstd'
)
makedepends=('python-setuptools' 'python-pip')
checkdepends=('python-pytest')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/03/4b/0bc82fc85aa10db0c8eea94558d5031c3541bb84cd1658600f5dcfc352d3/aimrocks-${pkgver}-cp310-cp310-manylinux_2_24_x86_64.whl")
sha256sums=('36660f269e407b035df9fbe8451defb016faf8db646c785aaace6e45434f289c')
# source=("${_module}-${pkgver}::git+https://github.com/aimhubio/aimrocks.git")
# sha256sums=('SKIP')

package() {
    cd "$srcdir"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}

# prepare() {
#     cd "${srcdir}/${_module}-${pkgver}" || exit 1
#     sed -i "s:/usr/local:/usr:g" setup.py
# }
#
# build() {
#     cd "${srcdir}/${_module}-${pkgver}" || exit 1
#     python setup.py build
# }
#
# package() {
#     cd "${srcdir}/${_module}-${pkgver}" || exit 1
#     python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
# }
