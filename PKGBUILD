# Maintainer: Seppia <seppia@seppio.fish>
pkgname=dino-git
pkgver=r54.f277db6
pkgrel=1
pkgdesc="Simple and modern Jabber/XMPP client written in vala"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/dino/dino"
license=('GPLv3')
groups=()
depends=('vala' 'sudo')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('dino::git+https://github.com/dino/dino')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	sudo cp build/dino /usr/bin/
#	make DESTDIR="$pkgdir/" install
}
