# Maintainer: Pablo Lezaeta <prflr88 arro'a gmail puntocom>

pkgname=xfce-theme-orion-git
pkgver=1.5+0
pkgrel=1
pkgdesc="Modern light theme. It supports GNOME, Xfce and Openbox."
arch=("any")
url='https://github.com/shimmerproject/Orion'
license=("GPL3")
depends=("gtk-engine-murrine")
optdepends=("elementary-xfce-icons: matching icon theme")
makedepends=("git")
provides=("xfce-theme-orion" "gtk-theme-orion")
conflicts=("xfce-theme-orion" "gtk-theme-orion")
source=("Orion::git+https://github.com/shimmerproject/Orion.git")
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/Orion"
#	echo $(git describe --always --abbrev=0).r$(git rev-list --count master) | sed 's|-|.|g' | sed 's|v||g'
	echo "$(git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/+/' | sed 's/v//g' )"
}

package() {
	cd "${srcdir}/Orion"
	install -d -m 755 "${pkgdir}/usr/share/themes/Orion"
	rm -rf {.git,.gitignore}
	cp -r . "${pkgdir}/usr/share/themes/Orion/"
}
