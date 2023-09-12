# Maintainer: Popolon <popolon@popolon.org>

_name=SearchAndRescue2
pkgname=sar2
pkgver=2.6.0
pkgrel=1
pkgdesc='Open source helicopter simulator'
url="https://searchandrescue2.github.io/sar2/"
license=('GPL2')
arch=('x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
depends=('freealut' 'openal' 'libvorbis' 'sdl2' 'libsm' 'libxmu' 'libxpm')
makedepends=('scons' 'gcc')
source=(
	"https://github.com/$_name/$pkgname/archive/v$pkgver.tar.gz"
)
sha512sums=(
	'055658c4c430bb1a150fe64fe2c2bfeb47015657cbc920c5ed7024a89d838ee3be74668626159f9bfd8209f365deca02181e8dba4e3ac66eb58be0f2637e52e8'
)

build() {
	cd "$pkgname-$pkgver"
	scons
}

package() {
	cd "$pkgname-$pkgver"
        scons install --prefix=${pkgdir}/usr
#  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}
