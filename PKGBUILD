# Maintainer: weilinfox <caiweilin at iscas.ac.cn>

pkgname=autopkgtest
pkgver=6.5
pkgrel=1
pkgdesc="automatic as-installed testing for Debian packages"
arch=('any')
url="https://salsa.debian.org/ci-team/autopkgtest"
license=('GPL-2.0-or-later')
depends=('fakeroot' 'procps-ng' 'python' 'python-pycodestyle' 'python-pyflakes' 'python-debian' 'python-docutils' 'python-mock')
source=("https://salsa.debian.org/ci-team/autopkgtest/-/archive/debian/$pkgver/autopkgtest-debian-$pkgver.tar.gz")
sha512sums=('1f1ea4d4f0714ab59614594441ff783a68f3d4691bfa7ab78f379c3d2db9daf003315f767391bbd0d69a561501b0e1741614e169fb5efe79d0be50e0982eaacd')

build() {
	cd "$pkgname-debian-$pkgver"
	make all
}

package() {
	cd "$pkgname-debian-$pkgver"
	make DESTDIR="$pkgdir/" install
}
