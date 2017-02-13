# Mainer: Peter Babič <babicpet at gmail dot com>
pkgname=scriptbasic
pkgver=2.1_RC1
pkgrel=2
pkgdesc="Scriba compiler for a powerful scripting language/API"
arch=("x86_64")
url="http://www.scriptbasic.org/"
license=('unknown')
depends=('postgresql-libs')
source=("http://www.scriptbasic.org/download/SB_${pkgver}_Linux.tar.gz"
        "scriptbasic_arch.patch")
noextract=()
md5sums=('374a37fff435d26c08cfe2ed8d694a8e'
         'f026797fd8e695a797e1eee2f04e264a')
validpgpkeys=()

prepare() {
        sudo chmod -R 755 "scriptbasic"
#        cd "scriptbasic"
        patch -p0 -i "scriptbasic_arch.patch"
}

build() {
	cd "scriptbasic"
	./setup
        make clean
        ./setup
        ./setup --install
}

package() {
	cd "scriptbasic"
        sudo ./install.sh
}
