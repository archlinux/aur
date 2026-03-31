# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname='python-hyprland-config'
_module='hyprland-config'
_src_folder='hyprland_config-0.3.0'
pkgver='0.3.0'
pkgrel=1
pkgdesc="Round-trip parser and editor for Hyprland configuration files"
url="https://github.com/BlueManCZ/hyprland-config"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/d5/aa/f9e93927c6c7c77b3878e9180835322c800200e87ee0fd5979d47c815145/hyprland_config-0.3.0.tar.gz")
sha256sums=('47bde208c6246db934b3812f74a1a13dadb3e6b52e27e3950f2fddeef0e098d8')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
