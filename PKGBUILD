# Maintainer: weilinfox <caiweilin at iscas.ac.cn>

pkgname=autopkgtest
pkgver=6.2
pkgrel=1
pkgdesc="automatic as-installed testing for Debian packages"
arch=('any')
url="https://salsa.debian.org/ci-team/autopkgtest"
license=('GPL-2.0-or-later')
depends=('fakeroot' 'procps-ng' 'python' 'python-pycodestyle' 'python-pyflakes' 'python-debian' 'python-docutils' 'python-mock')
source=("https://salsa.debian.org/ci-team/autopkgtest/-/archive/debian/$pkgver/autopkgtest-debian-$pkgver.tar.gz")
sha512sums=('f3ebfb3a0a55d23504c29e5516953c0c0cee6b29d820750033f1a7286cd573a0ee8a38aa4a17717ad41fc659ad68edc9a47dac1e3ed8324ea2642f04f238b021')

build() {
	cd "$pkgname-debian-$pkgver"
	make all
}

package() {
	cd "$pkgname-debian-$pkgver"
	make DESTDIR="$pkgdir/" install
}
