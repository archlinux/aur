# Maintainer: piernov <piernov@piernov.org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=AlbumentationsX
pkgname=python-albumentationsx
pkgver=2.0.12
pkgrel=1
pkgdesc='Fast image augmentation library and easy to use wrapper around other libraries'
arch=('any')
url='https://github.com/albumentations-team/albumentationsx'
license=('AGPL-3.0')
conflicts=('python-albumentations')
provides=('python-albumentations')
depends=(
  python-albucore
  python-numpy
  python-opencv
  python-pydantic
  python-scipy
  python-typing_extensions
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  "python-pytorch: for transforms from pytorch"
  "python-torchvision: for transforms from torchvision"
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/albumentations-team/albumentationsx/archive/${pkgver}.tar.gz")
sha512sums=('f06175077ece4b5d4a3a7e5656923989449938e77a7a4e7dd17a1620c080117323f7c5e95be75c1ae260484504d21ca99613e15a391aa516b10b677b220cf09e')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
