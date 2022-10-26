# Maintainer: Vito Ferri <support[at]vitoferri[dot]com>

_theme="dr460nized-sweet"
_pkgname="plymouth-theme-$_theme"
pkgname="$_pkgname-git"
_gitname=$_pkgname
url="https://gitlab.com/VitoF/$_gitname"
_gitroot="git+$url.git"
pkgver=1
pkgrel=3
pkgdesc="Plymouth theme for Garuda dr460nized inspired by Sweet by EliverLara."
arch=("any")
license=("GPL")
install="info.install"
depends=("plymouth")
makedepends=("git")
source=($_gitroot)
sha256sums=("SKIP")


package() {
	cd "$_gitname/$_theme"
	install -m755 -d "${pkgdir}/usr/share/plymouth/themes/$_theme"
	install -m755 -d "${pkgdir}/usr/share/plymouth/themes/$_theme/img"
	cp -a ./. "${pkgdir}/usr/share/plymouth/themes/$_theme"
}
