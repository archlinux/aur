# Maintainer: Philipp Joram <mail at phijor dot me>

_name=Mopidy-Notify
pkgname=mopidy-notify
pkgver=0.2.1
pkgrel=2
pkgdesc="Mopidy extension for showing desktop notifications"
arch=('any')
url="https://github.com/phijor/mopidy-notify"
license=('APACHE')
depends=(
  'mopidy>=3.0'
  'python-pykka>=3.0'
  'python-setuptools'
  'python-pydbus'
)
makedepends=(python-build python-installer python-wheel)
source=("$_name-$pkgver::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f054f83b8934c04b1d1c0d6f25a396f546a627740bc8ee3b1f02f95dc494dcf7')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
