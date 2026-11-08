# Maintainer: Incognitux <incognitux at proton mail dot com>

pkgname=nvibrant-bin
pkgver=1.3.1
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
sha256sums=('d23fdfb75d78f8e94459bb6d741c6e3f1780b20deb0d0fac55b5aef3a915d6bf')

package(){
  python -m installer --destdir="$pkgdir" *.whl
}
