# Maintainer: Léopold Koprivnik Ibghy <skwal.net@gmail.com>
pkgname="skwal-dotfiles-git"
pkgver=r22.5902e45
pkgrel=1
pkgdesc="installation tool for skwal dotfiles"
arch=("any")
url="https://github.com/SkwalExe/dotfiles"
license=('MIT')
makedepends=("git")
provides=("skwal-dotfiles")
install=skwal-dotfiles.install
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd dotfiles
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd dotfiles
      
	sudo rm -rf /usr/bin/skwal-dotfiles-install
}

build() {
	cd dotfiles
}


package() {
	cd dotfiles
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	install -Dm755 ./install.sh "$pkgdir/usr/bin/skwal-dotfiles-install"
    install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
