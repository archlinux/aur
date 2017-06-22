# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=winetricks-zh-git
pkgver=r125.3012b9a
pkgrel=1
pkgdesc="Wine Setup Wizard Winetricks Chinese Version"
arch=('any')
url="https://github.com/hillwoodroc/winetricks-zh"
license=('LGPL')
depends=('wine' 'curl' 'cabextract' 'unrar' 'unzip' 'p7zip')
makedepends=('git')
optdepends=('zenity: For the GTK3 GUI.'
            'kdebase-kdialog: For the KDE GUI (less capable).'
            'sudo: For automatically mounting ISO images.'
            'xdg-utils: For opening manual download pages.'
            'perl: For installing Steam.')
install=winetricks-zh.install
source=("$pkgname::git+https://github.com/hillwoodroc/winetricks-zh.git")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find ./ -type f -exec install -Dm755 {} "${pkgdir}/opt/winetricks-zh/{}" \;
}
