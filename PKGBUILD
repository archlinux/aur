# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname='python-hyprland-state'
_module='hyprland-state'
_src_folder='hyprland_state-0.2.0'
pkgver='0.2.0'
pkgrel=1
pkgdesc="Live state interface for Hyprland — options, animations, monitors, binds, and devices"
url="https://github.com/BlueManCZ/hyprland-state"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/b1/49/34ecbc053ef991a27dc279ca4cdac707cfe3dce4b80842fb8f0e5c919aca/hyprland_state-0.2.0.tar.gz")
sha256sums=('2442a8099f1e70226f88a8beff79f7d564368873389a756b1abf12e18358d954')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
