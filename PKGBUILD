# Maintainer: Arian Hosseini <arianhosseini999@gmail.com>
pkgname=plank-theme-arian-git
pkgver=1.1.r1.g6152e63
pkgrel=1
pkgdesc="Arian Theme for Plank | My favorite plank theme which I think it's pretty cool, Isn't it?!"
arch=('any')
url="https://github.com/ryanhosseini/arian-plank-theme"
license=('GPL3')
depends=('plank')
makedepends=('git')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	true
}

package() {
	cd "$pkgname"
	mkdir -p $HOME/.local/share/plank/themes/"Arian Theme"
	mkdir -p $HOME/.local/share/plank/themes/"Arian Theme Light"
	install -m 755 ./"Arian Theme"/dock.theme $HOME/.local/share/plank/themes/"Arian Theme"
	install -m 755 ./"Arian Theme Light"/dock.theme $HOME/.local/share/plank/themes/"Arian Theme Light"

}
