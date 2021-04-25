# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=versioneer
pkgname=python-$_pyname
pkgver=0.19
pkgrel=1
pkgdesc='Easy VCS-based management of project version strings'
url="https://github.com/$pkgname/$pkgname"
depends=(python-setuptools)
optdepends=('python-cx_freeze: Executable generation support')
makedepends=(python-pip)
license=('custom:Public Domain')
arch=(any)
_wheel="$_pyname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_pyname::1}/$_pyname/$_wheel")
sha256sums=('691e0ded8da37494f27197ccc1fb8a0bba370632dba820c09c240bc410161435')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
