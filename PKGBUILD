# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=python-cvc5
_name=${pkgname#python-}
pkgver=1.0.8
pkgrel=1
pkgdesc="Python bindings for cvc5"
arch=('x86_64')
url="https://pypi.org/project/cvc5"
license=('BSD')
makedepends=(python-build python-installer python-wheel)
_py=cp$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
source=("https://raw.githubusercontent.com/cvc5/cvc5_pythonic_api/c1c83ba39e1526c87051b64f12ebffc29ffd2850/LICENSE.txt" "https://files.pythonhosted.org/packages/13/95/34dd1d171177260202dfb1f443200987dcf204431d027af402770ae27ce9/cvc5-1.0.8-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
sha256sums=('ec92cf71bf850a6ad6d068d1539d1262a28220d58d5c053e530cec0e54080d3c'
            'e9b22a3b870bf6ea4e26bfbf5531c87977ca48a70eed763f405b68b7e9de507f')

package() {
  python -m installer --destdir="$pkgdir" $srcdir/*.whl
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

