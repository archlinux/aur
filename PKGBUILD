# Maintainer: ArchFeh <guyu2876@gmail.com>
# Contributor: Julian Thonhauser <julthon@gmail.com>
pkgname=mojave-ct-icon-theme-git
_pkgname=Mojave-CT
pkgver=r249.ee209a6
pkgrel=1
pkgdesc="MacOS Mojave icon pack by zayronxio git version"
url="https://github.com/zayronxio/Mojave-CT"
license=("GPL3")
arch=(any)
makedepends=('git')
source=("git+https://github.com/zayronxio/Mojave-CT")
sha512sums=("SKIP")

pkgver(){
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	_instdir="$pkgdir/usr/share/icons"
	mkdir -p "$_instdir"
	cp -dpr --no-preserve=ownership "$srcdir/Mojave-CT" "$_instdir/$_pkgname"
}
