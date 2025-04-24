# Maintainer: yum13241 <coolcrew45 at disroot dot org>
pkgname=simplewaita-git
_pkgname=Simplewaita
pkgver=r60.a00f41d
pkgrel=1
pkgdesc="Skeueomorphic GTK 2, GTK 3, GTK 4, Kvantum, qtCurve, Plasma, qt5ct, qt6ct, XFWM4, Kwin, Metacity, and Openbox theme."
arch=('any')
url='https://github.com/khongten001/Simplewaita'
license=('GPL-2.0-only')
conflicts=()
optdepends=('obsidian-icon-theme: skeueomorphic icon theme'
			'kvantum: theming qt6 apps'
			'kvantum-qt5: theming qt5 apps')
makedepends=('git')
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"
    install -dm 755 "$pkgdir"/usr/share/themes
    cp -dr --no-preserve='ownership' * "$pkgdir"/usr/share/themes/
}

# Feel free to use this PKGBUILD as a template.
