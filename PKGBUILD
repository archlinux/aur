# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>
# Contributor: Bruce Zhang <zttt183525594@gmail.com>

pkgname=winetricks-zh-git
pkgver=r235.77e5348
pkgrel=1
pkgdesc="Wine Setup Wizard Winetricks Chinese Version"
arch=('any')
url="https://github.com/hillwoodroc/winetricks-zh"
license=('LGPL')
depends=('cabextract' 'wine')
makedepends=('git')
optdepends=('zenity: For the GTK3 GUI.'
            'kdialog: For the KDE GUI (less capable).'
            'aria2: For downloading. At least one download command should be available.'
            'wget: For downloading. At least one download command should be available.'
            'curl: For downloading. At least one download command should be available.'
            'binutils: For unpacking. If not available, will fall back to wine 7zip.'
            'unrar: For unpacking. If not available, will fall back to wine 7zip.'
            'unzip: For unpacking. If not available, will fall back to wine 7zip.'
            'p7zip: For unpacking. If not available, will fall back to wine 7zip.'
            'xdg-utils: For opening manual download pages.'
            'perl: For installing Steam.'
            'hicolor-icon-theme: For hicolor theme hierarchy')
provides=('winetricks-zh')
conflicts=('winetricks-zh')
#install=winetricks-zh.install
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
	install -Dm755 winetricks-zh ${pkgdir}/usr/bin/winetricks-zh
    install -Dm644 icon/winetricks-zh.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/winetricks-zh.svg
    install -Dm644 winetricks-zh.desktop ${pkgdir}/usr/share/applications/winetricks-zh.desktop
}
