# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=rofi-rbw
pkgver=1.1.0
pkgrel=1
license=("MIT")
pkgdesc="Rofi frontend for Bitwarden"
url="https://github.com/fdw/rofi-rbw"
makedepends=("python-pip")
depends=("python" "rbw" "python-configargparse")
optdepends=("xdotool: for autofill on X11"
			"wtype: for autofill on Wayland")
arch=('any')
source=("https://github.com/fdw/rofi-rbw/releases/download/${pkgver}/rofi_rbw-${pkgver}-py3-none-any.whl")
sha256sums=('aa37150866aa9b391941da814bad0c6d17f1475013123918e72a94f57f8de475')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
