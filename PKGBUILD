# Maintainer: David Foucher <dev@tyjak.net>
pkgname=proxyman-git
pkgrel=1
pkgver=r187.c38b13e
pkgdesc='Configuring proxy made so simple on Linux'
arch=('any')
url='https://github.com/himanshub16/ProxyMan'
license=('unknown')
source=("${pkgname}"::"git+https://github.com/himanshub16/ProxyMan.git")
sha512sums=('SKIP')
makedepends=('git')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd "${srcdir}/${pkgname}"
	install -d ~/.proxyman
	install -m644 *.sh -t ~/.proxyman
	install -Dm755 main.sh ~/.proxyman/main.sh
	install -Dm755 proxyman ~/.local/bin/proxyman
}
