# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=python-cvc5
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
pkgdesc="Python bindings for cvc5"
arch=('x86_64')
url="https://pypi.org/project/cvc5"
license=('BSD')
makedepends=(python-build python-installer python-wheel python)
#_py=cp$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
_py=cp313
source=("https://raw.githubusercontent.com/cvc5/cvc5_pythonic_api/c1c83ba39e1526c87051b64f12ebffc29ffd2850/LICENSE.txt")
sha256sums=('ec92cf71bf850a6ad6d068d1539d1262a28220d58d5c053e530cec0e54080d3c')
sha256sums_x86_64=('934aafde6e7060ae7960afa234014186274fd8e8ddb0dbe88652216e05739fa4')
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

package() {
  python -m installer --destdir="$pkgdir" "$srcdir/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

