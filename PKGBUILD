# Maintainer: weilinfox <sakurakaze.fox at gmail.com>

pkgname=autopkgtest
pkgver=5.30
pkgrel=1
pkgdesc=""
arch=('any')
url="https://salsa.debian.org/ci-team/autopkgtest"
license=('GPL')
depends=('fakeroot' 'procps-ng' 'python3' 'python-pycodestyle' 'python-pyflakes' 'python-debian' 'python-docutils' 'python-mock')
provides=('autopkgtest')
conflicts=('autopkgtest')
source=("https://salsa.debian.org/ci-team/autopkgtest/-/archive/debian/5.30/autopkgtest-debian-5.30.tar.gz")
sha256sums=("8ba700c2d6eb946522b1b4138e2c3f9e07e6332e426d74a3bc46444eacafed6c")

prepare() {
	cd "$pkgname-debian-$pkgver"
}

build() {
	cd "$pkgname-debian-$pkgver"
	make all
}

package() {
	cd "$pkgname-debian-$pkgver"
	make DESTDIR="$pkgdir/" install
}
