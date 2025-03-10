# Maintainer : Zihad <aur@zihad.dev>

pkgname=kunkun-bin
pkgver=0.1.33
pkgrel=1
pkgdesc='An open source, cross-platform, extensible app launcher.'
url='https://kunkun.sh/'
license=('LicenseRef-custom')
arch=('x86_64')
provides=('kunkun')
# depends=(glib2 dbus hicolor-icon-theme glibc gcc-libs libx11 gdk-pixbuf2 pango cairo gtk3 xdotool libsoup3 libxtst)
depends=(libappindicator-gtk3 webkit2gtk-4.1 gtk3 xdotool "org.freedesktop.secrets")
optdepends=()

options=('!strip')

source=("$pkgname-$pkgver.deb::https://github.com/kunkunsh/kunkun/releases/download/Kunkun-v$pkgver/kunkun_${pkgver}_amd64.deb" "LICENSE::https://github.com/kunkunsh/kunkun/raw/develop/LICENSE")
sha256sums=("a0e021f1a5b15853760029aa02ec0d257b874019e829bea769b1951b85a5a4fe" "SKIP")
install="$pkgname.install"

package() {
	tar xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
	chmod 755 "${pkgdir}/usr/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
