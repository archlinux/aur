# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=rofi-rbw
pkgver=0.4.1
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
sha256sums=('532153ea97b3d5ebebc030a28bdef41bbbbcd83a8fb656ea1f276ae8d2f5bd2e')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
