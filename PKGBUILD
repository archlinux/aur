# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pylibyaml
_name="${pkgname#python-}"
pkgver=0.1.0
pkgrel=1
pkgdesc='Python module that patches the PyYAML library to enable libyaml parser/emitter'
arch=(any)
url='https://github.com/philsphicas/pylibyaml'
license=(MIT)
depends=(
  python
  python-pyyaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha512sums=('1fdab10678688ae85091b0a0aa6e52db9f4236c458eaab46234c5696a09128a582bc51d7c796e7562eda484864591700ca3b7f885b6f5ba19a65504cabce8c3f')
b2sums=('4d8acfbbf01a37cbf607867b05d4947e8140965ea99bf0acdb59e097f64b83efb8d9bad4a98e418636a8f9001b120081c1a0028abd05d43b509a763a9f404265')

build() {
  cd "$_name-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
