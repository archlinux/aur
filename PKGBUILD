# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=rofi-rbw
pkgver=0.5.0
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
sha256sums=('ed3a30c4bc69e3ee321a172a3106bca68fae86735b5d284d10726ce958f0abe8')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
