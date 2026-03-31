# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname='python-hyprland-socket'
_module='hyprland-socket'
_src_folder='hyprland_socket-0.9.0'
pkgver='0.9.0'
pkgrel=1
pkgdesc="Typed Python library for Hyprland IPC via Unix sockets"
url="https://github.com/BlueManCZ/hyprland-socket"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/ab/a9/32c19dfe164157003cf3d91bbcfdfd8e9dcdad4ee2a58c6353c42e64cc2c/hyprland_socket-0.9.0.tar.gz")
sha256sums=('c33bdd1632f208c167ca5f1c22378bde82b5f7f229f39da6ea9b0053bbbb1a2f')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
