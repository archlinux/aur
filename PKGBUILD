# Maintainer: weilinfox <caiweilin at iscas.ac.cn>

pkgname=autopkgtest
pkgver=6.0
pkgrel=1
pkgdesc="automatic as-installed testing for Debian packages"
arch=('any')
url="https://salsa.debian.org/ci-team/autopkgtest"
license=('GPL-2.0-or-later')
depends=('fakeroot' 'procps-ng' 'python' 'python-pycodestyle' 'python-pyflakes' 'python-debian' 'python-docutils' 'python-mock')
source=("https://salsa.debian.org/ci-team/autopkgtest/-/archive/debian/$pkgver/autopkgtest-debian-$pkgver.tar.gz")
sha512sums=('0a43b021300062da2e19188e5b4cfd0983cf963f8b9aa5b65aa447a91455babdf4c9289e713c78257a70f47d2fd648bdea3679e707436c1eae6324e13743b62a')

build() {
	cd "$pkgname-debian-$pkgver"
	make all
}

package() {
	cd "$pkgname-debian-$pkgver"
	make DESTDIR="$pkgdir/" install
}
