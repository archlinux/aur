# Maintainer: Leon Francis

pkgname=aim-appimage-manager
_pyname=aim_appimage_manager
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight CLI for installing and managing AppImages on Linux"
arch=('any')
url="https://github.com/leonfrancis37/Aim-AppImage-Manager"
license=('MIT')
depends=('python' 'python-click')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/1b/f3/fa8a6d7969ef52f9a43396ca4176f32649481afa1557bb95f6beeea26ce2/aim_appimage_manager-0.1.0.tar.gz")
sha256sums=('4bdb5a153d6a8ade58b9e6b354899d91eed84ca0cf267bc92ea169ee6109d311')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
