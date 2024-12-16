# Maintainer: Stezkoy <stezko@gmail.com>

pkgname=python-systemd-gui-service
pkgver=0.1.0
pkgrel=1
pkgdesc="GUI application which helps to create a GNU/Linux systemd service file"
arch=($CARCH)
license=('GPL3')
url="https://github.com/nnishant776/systemd_gui_service"
depends=('git' 'glibc' 'python' 'python-wxpython' 'python-pip')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=(${pkgname}::git+https://github.com/nnishant776/systemd_gui_service.git)
sha256sums=('SKIP')


package() {
  cd "${srcdir}"/"${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 ""${srcdir}"/"${pkgname}"/data/service-creator.desktop" ""${pkgdir}"/usr/share/applications/service-creator.desktop"	
}
