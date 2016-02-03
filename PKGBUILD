# Maintainer: Branislav Holý <branoholy@gmail.com>
pkgname=regilo-visual
pkgver=2.1.1
pkgrel=1
pkgdesc="A visualization program for the Regilo library"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/branoholy/regilo"
license=('GPL3')
depends=('boost>=1.54' 'wxgtk>=3.0' "regilo=$pkgver")
makedepends=('cmake>=2.8')
source=("https://github.com/branoholy/regilo/archive/v$pkgver/regilo-$pkgver.tar.gz"
        "https://github.com/branoholy/regilo/releases/download/v$pkgver/regilo-$pkgver.tar.gz.sig")
md5sums=('207846f917b6a5cf9fe813f8b238e24f'
         'c51f41989aeda3272ae42b987513071b')
sha1sums=('8d681ab065ebff69846566372185514b53cbbf00'
          'ff70a2502104ea0a22757ed34fa0737d61b868cc')
sha256sums=('f62f0507d16e4c07fb8f5e8625e550f15334c5820ad8df28e7705607b312994d'
            'df4facc9a1b6f85d5ca376356b41dad822300a59c6dc87526f84abcfdeb90add')
sha512sums=('6016c55ca48bdf1e3a0726b041fa89a82c6f1a8327df0431c3d8cdbb2000b7a0e28ae04886ec463c4133df72993f5c15f59c2f23b087772b8a1095c31f664f62'
            'cfd97819334ed19e8af1d340da4cba20a8b94272464aa24a8b086bfe1a6318e162d552059fe63b069f709599d820b89a6f5c5357be1fb178231ffc5f8fae1ff2')
validpgpkeys=('D25809BF3563AA56A12B0F4D545EDD46FBAC61E6')

build() {
	cd "regilo-$pkgver"
	mkdir -p build
	cd build
	cmake -Dexamples-only:bool=on -Dexample-gui:bool=on -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "regilo-$pkgver"
	cd build
	make DESTDIR="$pkgdir/" install
}
