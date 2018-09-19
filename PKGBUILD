# Maintainer: scan

pkgname=pro-dark-gtk-theme-git
pkgver=r16.0c896ac
pkgrel=1
pkgdesc="Pro Dark GTK Theme GNOME 3.20+"
arch=("any")
url="https://github.com/paullinuxthemer/Pro-Dark-GTK"
license=("GPL")
makedepends=("git")
optdepends=("gnome-tweak-tool: A tool to customize advanced GNOME 3 options.")
source=("pro-dark-gtk-theme::git+https://github.com/paullinuxthemer/Pro-Dark-GTK")
sha256sums=("SKIP")

pkgver() {
    cd pro-dark-gtk-theme
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	install -d ${pkgdir}/usr/share/themes
    cp -r pro-dark-gtk-theme $pkgdir/usr/share/themes/Pro-Dark-GTK
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
