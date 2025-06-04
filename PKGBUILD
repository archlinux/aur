# Maintainer: Norbert <norbert@archworks.co>
pkgname=python-jpy
_pkgname=jpy
pkgver=1.1.0
pkgrel=1
pkgdesc="Bi-directional Python-Java bridge"
arch=('x86_64')
url="https://github.com/jpy-consortium/jpy"
license=('Apache')
depends=('jdk-openjdk' 'python')
noextract=('${_pkgname}-${pkgver}-cp313-cp313-manylinux_2_17_x86_64.manylinux2014_x86_64.whl')
source=(
  "${_pkgname}-${pkgver}-cp313-cp313-manylinux_2_17_x86_64.manylinux2014_x86_64.whl::https://github.com/jpy-consortium/jpy/releases/download/v${pkgver}/\
${_pkgname}-${pkgver}-cp313-cp313-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
  "LICENSE.txt::https://raw.githubusercontent.com/jpy-consortium/jpy/v${pkgver}/LICENSE.txt"
)
sha256sums=(
  '9fdb2cac7649465b25df55fa102fbc2cebdbbecd496799f882a19744e732e0fe'
  '58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd'
)

package() {
  python -m pip install --root="$pkgdir" --no-deps \
    "$srcdir/${_pkgname}-${pkgver}-cp313-cp313-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"

  install -Dm644 "$srcdir/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
