pkgname=nemo-qml-plugin-dbus
pkgver=2.1.32
pkgrel=1
pkgdesc="Provides types to access D-Bus from QML"
arch=(x86_64 aarch64)
url="https://github.com/sailfishos/$pkgname"
license=(LGPL2.1)
depends=(qt5-declarative)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('86d581de452d2abf749e7e81de2ec154c2fc4f0a130954915acdb75fd4cf45403ef1c70928d68ad0e567b5cdca97c78333d29d1f8220ae32e8d378ee580a7b36')

build() {
	cd $pkgname-$pkgver
	qmake src
	make
}

package() {
	make -C $pkgname-$pkgver INSTALL_ROOT="$pkgdir" install
}
