# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=versioneer
pkgname=python-$_pyname
pkgver=0.18
pkgrel=1
pkgdesc='Easy VCS-based management of project version strings'
url="https://github.com/warner/$pkgname"
depends=(python-setuptools)
optdepends=('python-cx_freeze: Executable generation support')
makedepends=(python-pip)
license=('custom:Public Domain')
arch=(any)
_wheel="$_pyname-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_pyname::1}/$_pyname/$_wheel")
sha256sums=('08e395c0acc544f78645b9c0ebfccaf47950ae61e0c85bd1aaea98ff59609aeb')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
