# Maintainer: David Foucher <dev@tyjak.net>
pkgname=proxyman-git
pkgrel=1
pkgver=r186.1bd3dfc
pkgdesc='Configuring proxy made so simple on Linux'
arch=('any')
url='https://github.com/himanshub16/ProxyMan'
license=('unknown')
source=("${pkgname}"::"git+https://github.com/himanshub16/ProxyMan.git")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd "${srcdir}/${pkgname}"
	install -d $HOME/.proxyman
	install * -t $HOME/.proxyman
	install proxyman -t $HOME/.local/bin
}
