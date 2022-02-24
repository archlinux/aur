# Contributor: Lucas Puntillo <laniku@envs.net>

pkgname=chipeight-git
pkgver=0.1.git
pkgrel=1
pkgdesc="Work in progress Chip8 emulator."
arch=(x86_64)
url="https://git.envs.net/laniku/chip8"
license=('MIT')
depends=("freeglut")
makedepends=("devtools")
source=("https://git.envs.net/laniku/chip8/archive/master.tar.gz")

prepare() {
	ldconfig
}

build() {
	cd master
        g++ *.hxx *.cxx -o c8 -lglut -lgl -I /usr/local/include
}

package() {
	cd master
        chmod +x ./c8
        cp ./c8 /usr/local/bin
}
