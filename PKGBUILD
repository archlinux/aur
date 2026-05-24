# Maintainer: Xuelin Yang <xuelin@adamantyee.cc>
pkgname='python-whenever'
pkgdesc='Modern datetime library for Python'
pkgver=0.10.0
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
sha256sums=('70feda454af6b2c231abd428b9430cd75492a000ca1d1edc42976d6fea265eec')

package() {
	python -m installer --destdir="$pkgdir" "$srcdir/$_wheel"
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" \
		< <(bsdtar -xOf "$srcdir/$_wheel" "$_srcname-$pkgver.dist-info/licenses/LICENSE")
}
