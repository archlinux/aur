# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

pkgname='zuban-bin'
pkgdesc='Python Type Checker / Language Server (binary version)'
pkgver=0.10.0
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
b2sums_x86_64=('82c9a131b3e5699ddde67fad7f9c6f6b44a5554674c1aa9d40e54ba1c8b2607dd3f3db290c1042ca89ba3684d92c337ff7164e4e3f11a3c2ca6d8a7586288639')

package() {
  python -m installer --destdir="$pkgdir" ${pkgname%-bin}-${pkgver}-*.whl
}
