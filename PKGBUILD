# Maintainer: Otreblan <otreblain@gmail.com>

# Remember to activate multilib for proton.
# It's dependencies requiere to be build in this order:
# wine -> vkd3d-valve -> wine-valve -> proton
pkgname=legendary
pkgver=0.20.9
pkgrel=1
pkgdesc="A free and open-source replacement for the Epic Games Launcher "
arch=('any')
url="https://github.com/derrod/legendary"
license=('GPL3')
groups=()
depends=("python-requests" "python-wheel" "python-setuptools")
makedepends=()
checkdepends=()
optdepends=("proton: windows binaries support")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('16c7153376adaaed326d77e85e5875480acee88b0c6dd897b0b48c3fe0fabcb8')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
