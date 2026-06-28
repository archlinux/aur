# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

pkgname='zuban-bin'
pkgdesc='Python Type Checker / Language Server (binary version)'
pkgver='0.9.0'
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
b2sums_x86_64=(7ed07fcf36c2e9a3cd0653f78e203d9bbc075f62d4ade863d68bb1614adec1c86f21e0446f0a6a160441cbe448b7d49a7b78f4e3abd1dd7ab27ad35ae47c3fe8)

package() {
  python -m installer --destdir="$pkgdir" ${pkgname%-bin}-${pkgver}-*.whl
}
