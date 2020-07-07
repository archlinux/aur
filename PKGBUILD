# Maintainer: Bruno Carlin <bruno+aur@bcarlin.net>
pkgname=graph-cli
pkgver=0.1.7
pkgrel=1
epoch=1
pkgdesc="A CLI utility to create graphs from CSV files."
arch=( any )
url="https://github.com/mcastorina/graph-cli"
license=('GPL3')
depends=( 'python-numpy' 'python-pandas' 'python-matplotlib' )
#makedepends=()
#checkdepends=()
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname/-/_}-$pkgver.tar.gz"
)
#noextract=()
sha256sums=( feff423a0023bae9c9d3a1c7979e49d26a15d69e2e3be37ec3643013cb6079b4 )

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}
#
build() {
	cd "${pkgname/-/_}-$pkgver"
  python setup.py build
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "${pkgname/-/_}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
