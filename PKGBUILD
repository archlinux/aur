# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=klar
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimalist On-Screen Display (OSD) that shows visual indicators for brightness, audio, and power events"
arch=('any')
url="https://github.com/isaksamsten/klar"
license=('MIT')
depends=(python python-pulsectl python-gobject glib2 libadwaita gtk4-layer-shell gtk4)
makedepends=(python-build python-installer python-hatchling)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c7af6dbbe4196099602a03c9017b44ccae4ef567515bbd40776f490ab96c26a9')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
