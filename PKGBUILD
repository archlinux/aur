# Maintainer : Zihad <aur@zihad.dev>

pkgname=kunkun-bin
pkgver=0.1.34
pkgrel=1
pkgdesc='An open source, cross-platform, extensible app launcher.'
url='https://kunkun.sh/'
license=('LicenseRef-custom')
arch=('x86_64')
provides=('kunkun')
depends=(libappindicator-gtk3 webkit2gtk-4.1 gtk3 xdotool "org.freedesktop.secrets")
optdepends=()

options=('!strip')

source=("$pkgname-$pkgver.deb::https://github.com/kunkunsh/kunkun/releases/download/Kunkun-v$pkgver/kunkun_${pkgver}_amd64.deb" "LICENSE::https://github.com/kunkunsh/kunkun/raw/develop/LICENSE")
sha256sums=("85cb829686a8c799d667122ad7bf402c091c6ad824d2176bd1c322094c676a89" "SKIP")
install="$pkgname.install"

package() {
	tar xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
	chmod 755 "${pkgdir}/usr/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
