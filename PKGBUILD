# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=rmview
pkgver=3.1.1
pkgrel=1
pkgdesc="a fast live viewer for reMarkable 1 and 2"
arch=('any')
url="https://github.com/bordaigorl/rmview"
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-paramiko' 'python-twisted' 'python-pyjwt' 'python-service-identity' 'python-pyopenssl')
makedepends=('git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b3efaefe24aebe7d98898dd0a23460dfd50fe9731d3843aaa552eaa0d3da7f59')
conflicts=('rmview-git')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python3 setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

