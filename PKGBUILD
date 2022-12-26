# Maintainer: Kingtous <me@kingtous.cn>
pkgname=fclash
pkgver=1.3.7
pkgrel=1
epoch=
pkgdesc="A Clash Proxy Fronted based on Clash"
arch=('x86_64')
url="https://github.com/kingtous/fclash"
license=('GPL-3.0')
groups=()
depends=('libappindicator-gtk3')
makedepends=(dpkg)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://github.com/Kingtous/Fclash.git#branch=stable" "https://github.com/Kingtous/Fclash/releases/download/v1.3.7/cn.kingtous.fclash-1.3.7-x86_64.deb")
noextract=()
sha256sums=('SKIP' 'SKIP')
validpgpkeys=()


build() {
    # Download prebuilt deb package
    dpkg -X cn.kingtous.fclash-1.3.7-x86_64.deb extract
}


package() {
    cp -r "${srcdir}/extract/opt"  "${pkgdir}/opt"
	install -Dm0755 "${srcdir}/${pkgname%-git}/debian/build-src/opt/apps/cn.kingtous.fclash/entries/applications/cn.kingtous.fclash.desktop" "${pkgdir}/usr/share/applications/cn.kingtous.fclash.desktop"
}
