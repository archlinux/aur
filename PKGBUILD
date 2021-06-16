# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=rofi-rbw
pkgver=0.4.0
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
sha256sums=('49c9cbf5a506c5cf0477600fdcef54dbd3a2a7067e1a6d23ed2339702555a0f4')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
