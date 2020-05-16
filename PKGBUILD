# Maintainer: scan

pkgname=dark-aurora-theme-git
pkgver=r242.54e702a
pkgrel=1
pkgdesc="Dark Aurora Theme GNOME 3.28"
arch=("any")
url="https://github.com/bolimage/Dark-Aurora"
license=("GPL")
conflicts=("dark-aurora-theme")
depends=("gnome-shell>3.28")
makedepends=("git")
optdepends=("gnome-tweak-tool: A tool to customize advanced GNOME 3 options.")
source=("dark-aurora-themes::git+https://github.com/bolimage/Dark-Aurora")
sha256sums=("SKIP")

pkgver() {
  cd dark-aurora-themes

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	install -d ${pkgdir}/usr/share/themes
    	cp -r dark-aurora-themes $pkgdir/usr/share/themes/Dark-Aurora
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
