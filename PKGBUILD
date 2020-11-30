# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=pcaper
pkgver=1.0.11
pkgrel=1
pkgdesc='Read pcap and assemble HTTP requests'
arch=(any)
url="https://github.com/gaainf/pcaper/$pkgname"
license=(BSD)
depends=(
	python
	'python-dpkt>=1.9.1'
	'python-six>=1.11.0'
	'python-dateutil>=2.8.0'
)
_wheel="$pkgname-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('4aa52c95ddb0a279549f07d271940c03f79a3d06089b1f5081b4c12d60d956e2')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
