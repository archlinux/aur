# Maintainer: Bruce Zhang
pkgname=sddm-theme-sugar-candy-git
pkgver=r30.9cbdbc2
pkgrel=1
pkgdesc="Sugar Candy is the sweetest login theme available for the SDDM display manager"
arch=('any')
url="https://www.opencode.net/marianarlt/sddm-sugar-candy"
license=('GPL3')
depends=('sddm>=0.18' 'qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg')
makedepends=('git')
provides=("sddm-theme-sugar-candy")
conflicts=("sddm-theme-sugar-candy")
backup=('usr/share/sddm/themes/Sugar-Candy/theme.conf')
source=('sugar-candy::git+https://www.opencode.net/marianarlt/sddm-sugar-candy.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/sugar-candy"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/sugar-candy"
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/sddm/themes/Sugar-Candy/{}" \;
}
