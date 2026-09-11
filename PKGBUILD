# Maintainer: Incognitux <incognitux at proton mail dot com>

pkgname=nvibrant-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Nvidia Digital Vibrance on Wayland (binary release)"
arch=(x86_64)
url="https://github.com/Tremeschin/nVibrant"
license=('GPL-3.0')
provides=("nvibrant")
conflicts=("nvibrant")
depends=("python>=3.9" "python-packaging")
makedepends=("python-installer")
_pkgname=${pkgname%-bin}

# source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
source=("https://github.com/Tremeschin/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-py3-none-manylinux_2_17_x86_64.whl")
sha256sums=('d60a080b52e4a16e16d16a7d4b6405a32a3fe1b8ee0df65dc3685213ef0393e8')

package(){
  python -m installer --destdir="$pkgdir" *.whl
}
