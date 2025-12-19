# Maintainer: monsoon235 <29970829+monsoon235@users.noreply.github.com>
pkgname=macsequoia-kde-theme-git
_gitname=MacSequoia-kde
pkgver=r15.9d68985
pkgrel=1
pkgdesc="MacOS Sequoia theme for KDE Plasma by https://github.com/vinceliuice (development version)"
arch=("any")
url="https://github.com/vinceliuice/${_gitname}"
license=("GPL-3.0")
groups=()
depends=()
optdepends=(
	"kvantum: Kvantum theme support"
	"sddm: SDDM theme support"
	"whitesur-icon-theme: Whitesur icon theme"
	"whitesur-cursor-theme: Whitesur cursor theme"
	"whitesur-gtk-theme: Whitesur GTK theme"
)
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=("${_gitname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_gitname"
	./install.sh -d "$pkgdir/usr"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
