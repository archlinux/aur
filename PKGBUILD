# Maintainer: Aditya Mishra <https://github.com/pegvin/aru/issues>
pkgname=aru-git
pkgver=f4f034a
pkgrel=1 # Update if you changed something but that is so minor change you don't want to change the version
pkgdesc="a text editor"
arch=('i686' 'x86_64')
url="https://github.com/pegvin/aru"
license=('MIT')
depends=('json-c' 'tre')
makedepends=(git make scons pkg-config python)
optdepends=()
provides=('aru-git')
conflicts=('aru-git')
source=(git+https://github.com/pegvin/aru.git)
sha512sums=(SKIP)

build() {
    cd aru
    git submodule update --init --recursive
	make gen-assets
	make release
}

package() {
    cd aru
	install -Dm755 aru "$pkgdir/usr/bin/aru"
}
