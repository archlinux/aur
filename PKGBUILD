# Maintainer: Nikos Toutoutzoglou <nikos.toutou@gmail.com>

pkgname=python-iptvtools
_name=iptvtools
pkgver=0.2.10
pkgrel=1
pkgdesc="Provides iptv-filter script tool to maintain IPTV lists."
arch=('any')
url="https://github.com/huxuan/iptvtools"
license=('MIT')
depends=('ffmpeg' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
provides=('python-iptvtools')
conflicts=('python-iptvtools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6cf32cc1e59b31940af14a7d79baa7ef8a65f087a6ee96e868f4587eb0420fca')

build(){
	cd $_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
