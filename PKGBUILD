# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

pkgname='zuban-bin'
pkgdesc='Python Type Checker / Language Server (binary version)'
pkgver=0.11.0
pkgrel=1
url='https://zubanls.com'
arch=(x86_64)
license=(AGPL-3.0-only)
makedepends=(python-installer)
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!debug')
source_x86_64=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/${pkgname%-bin}/${pkgname%-bin}-${pkgver}-py3-none-manylinux2014_x86_64.manylinux_2_17_x86_64.whl")
noextract=("${source_x86_64[0]##*/}")
sha256sums_x86_64=('bda3d37d174f7db703d18ad0d6e7a1584349964d297a2cd3329d9556908fba98')

package() {
  python -m installer --destdir="$pkgdir" ${pkgname%-bin}-${pkgver}-*.whl
}
