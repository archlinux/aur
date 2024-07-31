# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='retro-crisis-gdv-ntsc'
pkgver=20240717
pkgrel=2
arch=('x86_64')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<< "$pkgver").zip")
sha512sums=('995194c83a8f16660a459c17a3ad24473a5e4a92e86f81be1699422486abfc4788c7b8e28a97c8c9902773f1504b01646a4bb8e15361d41b76650c4831e31e46')
options=('!debug' '!strip')

package() {
	_shaders_dir="${srcdir}/shaders"
	_install_dir="${pkgdir}/usr/share/libretro"
	install -dm 755 -- "$_install_dir"
	mv -- "$_shaders_dir" "$_install_dir"
}
