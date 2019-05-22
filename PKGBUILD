# Maintainer: jasch <jasch dot io at protonmail dot com>
pkgname=soundtunnel
pkgver=0.0.10
pkgrel=2
#epoch=
pkgdesc="IN DEVELOPMENT! A tun device to communicate via sounds."
arch=('x86_64')
url="https://example.com/"
license=('unknown')
groups=()
depends=('quiet' 'libconfig' 'liquid-dsp')
makedepends=('gcc' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=soundtunnel.install
changelog=
source=("$pkgname-$pkgver.tar.gz")
        #"$pkgname-$pkgver.patch")
noextract=()
sha256sums=(
    '1c9ff8b2a648f2b59c15a9805115f88dfbbbe3656f9dcc81e866ada791005683')
    #'04c0a79a2af286f8fde774b37c3d869f825005f15a39d54d2bc65a1ef2d4e3b8'
#)
#md5sums=('SKIP' 'SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
    #patch --forward --strip=1 --input="${srcdir}/$pkgname-$pkgver.patch"
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	#./configure --prefix=/usr
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr CMakeLists.txt
	make
}

#check() {
	#cd "$pkgname-$pkgver"
	#make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

