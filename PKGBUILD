# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=mine-imator
pkgname=${_pkgname}-bin
pkgver=2.0.2
pkgrel=1
arch=('x86_64')
pkgdesc="3D movie maker based on the sandbox game Minecraft (Mineimator)"
url="https://www.mineimator.com/"
license=('custom')

depends=('libtiff5')
provides=(${_pkgname})
conflicts=(${_pkgname})

source=("https://www.mineimator.com/version/${pkgver}/Mine-imator%20${pkgver}.deb")
sha256sums=('07e34811d6ab68b528f5f0ba2bfc028d2985737dd5354924e3960f443fb4cb8f')

package() {
	bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"
    # Link to the binary
	mkdir -p "$pkgdir/usr/bin"
	ln -sf '/usr/local/bin/Mine-imator' "$pkgdir/usr/bin/mine-imator"
}
