pkgname=boardmix-bin
pkgver=1.13.0
pkgrel=1
pkgdesc='Online collaborative whiteboard software.'
url='https://boardmix.cn/'
license=('custom:boardmix')
depends=(
	'gtk3'
	'libnotify'
	'nss'
	'libxss'
	'libxtst'
	'xdg-utils'
	'libsecret'
)
optdepends=(
	'libappindicator-gtk3'
)
arch=('x86_64')
source=(
	https://home-store-packages.uniontech.com/appstore/pool/appstore/c/cn.bosyun.boardmix/cn.bosyun.boardmix_${pkgver}_amd64.deb
)

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "${pkgdir}/"
	chmod 755 "${pkgdir}/opt/apps"
	chmod 755 "${pkgdir}/opt"
	echo "  -> Installing..."
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/applications"
	install -Dm755 "${pkgdir}/opt/apps/cn.bosyun.boardmix/entries/applications/cn.bosyun.boardmix.desktop" "${pkgdir}/usr/share/applications"
	install -Dm755 "${pkgdir}/opt/apps/cn.bosyun.boardmix/files/boardmix.sh" "${pkgdir}/usr/bin/boardmix"
}

sha256sums=('e318e1400e65b50cf2c4daffad39d072f730dcfb1c7cf1545cde929347c9372e')
