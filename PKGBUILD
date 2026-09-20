# Maintainer: Philipp Joram <mail at phijor dot me>

_name=mopidy_notify
pkgname=mopidy-notify
pkgver=0.2.2
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
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('897b8d432c828d221b86ed2fe5cb4822f7904caff36ab87d701bac043951ce92')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
