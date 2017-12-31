# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=virshpatcher
pkgver='1.0.0a1'
pkgrel=1
pkgdesc='Simple utility to apply common changes to libvirtd domain xml files'
arch=(any)
url='https://github.com/PassthroughPOST/virsh-patcher'
license=('BSD')
depends=('python')
checkdepends=('python-pytest-runner')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('23be5545417ca00a676ee5a84e387fa53d958233ff9b1c3718588bf4da6d8d2c')

check() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py pytest
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1
}
