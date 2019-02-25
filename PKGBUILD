pkgname="python-asif"
_pkgname=asif
pkgver=0.2.2
pkgrel=1
pkgdesc="A Python 3.5, asyncio- and decorator-based IRC framework"
url="https://github.com/minus7/asif"
arch=("any")
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('db4eb4cfd45176483631172338e239c65cd60f617bf83189714cb85ff6e716e1')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	# upstream does not provide a license
	#install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
