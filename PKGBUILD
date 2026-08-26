# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

pkgname='zuban-bin'
pkgdesc='Python Type Checker / Language Server (binary version)'
pkgver=0.9.2
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
b2sums_x86_64=('da77cea7024733d95f94eb35054fe777d4e5ab5aede1ae8d228143df16a54aa8bdef273cf5e0ce8ced8ce913778080d8c50926c0cbb3b64935fd2814221cd45d')

package() {
  python -m installer --destdir="$pkgdir" ${pkgname%-bin}-${pkgver}-*.whl
}
