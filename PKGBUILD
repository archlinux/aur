# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

pkgname='zuban-bin'
pkgdesc='Python Type Checker / Language Server (binary version)'
pkgver=0.9.1
pkgrel=1
url='https://zubanls.com'
arch=(x86_64)
license=(AGPL-3.0-only)
makedepends=(python-installer)
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
source_x86_64=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/${pkgname%-bin}/${pkgname%-bin}-${pkgver}-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
noextract=("${source_x86_64[0]##*/}")
b2sums_x86_64=('2ccce5627130b61a15bbe679b1835844d3ed36614d9e98d8b5aaea03e481596c2e93354c12448503b15c8a2228a7e686f9b607728edfcc94bfebb2262e05de8c')

package() {
  python -m installer --destdir="$pkgdir" ${pkgname%-bin}-${pkgver}-*.whl
}
