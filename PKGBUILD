# Maintainer: Xuelin Yang <xuelin@adamantyee.cc>
pkgname='python-whenever'
pkgdesc='Modern datetime library for Python'
pkgver=0.10.5
pkgrel=1
_srcname="${pkgname/python-/}"
_wheel="$_srcname-$pkgver-py3-none-any.whl"
url="https://github.com/ariebovenberg/$_srcname"
arch=('any')
license=('MIT')
makedepends=(
	'python-installer'
)
depends=(
	'python'
)
source=("$_wheel::https://files.pythonhosted.org/packages/py3/w/$_srcname/$_wheel")
noextract=("$_wheel")
sha256sums=('193091633fc1dece4c86e7303cbd4039320b4f45c69dc5ae69b8f711bca82603')

package() {
	python -m installer --destdir="$pkgdir" "$srcdir/$_wheel"
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" \
		< <(bsdtar -xOf "$srcdir/$_wheel" "$_srcname-$pkgver.dist-info/licenses/LICENSE")
}
