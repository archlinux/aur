# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=python-cvc5
_name=${pkgname#python-}
pkgver=1.1.2
pkgrel=1
pkgdesc="Python bindings for cvc5"
arch=('x86_64')
url="https://pypi.org/project/cvc5"
license=('BSD')
makedepends=(python-build python-installer python-wheel)
_py=cp$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
source=("https://raw.githubusercontent.com/cvc5/cvc5_pythonic_api/c1c83ba39e1526c87051b64f12ebffc29ffd2850/LICENSE.txt" "https://files.pythonhosted.org/packages/29/d3/7b96b419dacb0714aea18c6eaada4d188d1cb827cfb776665b695d9387ce/cvc5-1.1.2-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
sha256sums=('ec92cf71bf850a6ad6d068d1539d1262a28220d58d5c053e530cec0e54080d3c'
            '13430b08dd96b06818a1696e824ba045077265e1b34378bf86c6ced83ab3a302')

package() {
  python -m installer --destdir="$pkgdir" $srcdir/*.whl
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

