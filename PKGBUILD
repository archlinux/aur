# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

pkgname='zuban-bin'
pkgdesc='Python Type Checker / Language Server (binary version)'
pkgver=0.10.1
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
b2sums_x86_64=('3fb40ef488248d2f129cd3ce66458fd10ca1594e81ba1614d564bd726ff89106bab6ae61e49477ac1d385ebffe12b90c52b746bb87b292556d129af857a43002')

package() {
  python -m installer --destdir="$pkgdir" ${pkgname%-bin}-${pkgver}-*.whl
}
