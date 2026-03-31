# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname='python-hyprland-monitors'
_module='hyprland-monitors'
_src_folder='hyprland_monitors-0.4.0'
pkgver='0.4.0'
pkgrel=1
pkgdesc="Monitor management utilities for Hyprland"
url="https://github.com/BlueManCZ/hyprland-monitors"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/73/86/0312dac13a2d8c44d1385f3b596e867a63c03a522370f41b6d2fa7ba7c43/hyprland_monitors-0.4.0.tar.gz")
sha256sums=('e8d5112f79687125c3c5c0b0ebcf5aa2539b13b323e63f917ba6b5f5e1585c3d')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
