# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname='python-hyprland-schema'
_module='hyprland-schema'
_src_folder='hyprland_schema-0.4.0'
pkgver='0.4.0'
pkgrel=1
pkgdesc="Typed Python schema for every Hyprland configuration option"
url="https://github.com/BlueManCZ/hyprland-schema"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/86/34/c2a2738268c5fc3e56743493b85f05fc8afe6a9cc3503554af9284e70379/hyprland_schema-0.4.0.tar.gz")
sha256sums=('e40e2dd2b1e7c568e6eed7fb5993ec4fe88b51a68846c4a6702b47e26e31522e')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
