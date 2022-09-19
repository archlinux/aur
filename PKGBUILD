# Maintainer: Bruno Carlin <bruno+aur@bcarlin.net>
pkgname=graph-cli
pkgver=0.1.19
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
sha256sums=('00e7d481e560713b6e7f922e2d8cb5cc54c10a3599c6ed0e899cd45570c86927')

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
