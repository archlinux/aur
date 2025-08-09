# Maintainer: Carneiro <gabriel dot chaves dot carneiro at gmail dot com>
pkgname=pulsemeeter
pkgver=2.0.0
pkgrel=2
pkgdesc="A pulseaudio and pipewire audio routing application"
url="https://github.com/theRealCarneiro/pulsemeeter"
arch=('i686' 'x86_64')
license=('MIT')
depends=('pipewire-pulse' 'gtk3' 'libayatana-appindicator' 'python' 'python-gobject' 'python-pydantic' 'python-pulsectl' 'python-pulsectl-asyncio')
provides=('pulsemeeter')
makedepends=('git' 'python-build' 'python-setuptools' 'python-installer' 'python-wheel' 'python-babel')
optdepends=('easyeffects')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=(f6691a2233c633a2fcfc1a9ef749e748)

build () {
	cd $pkgname-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
