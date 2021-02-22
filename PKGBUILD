# Maintainer: guangsizhongbin <guangsizhongbin@gmail.com>
pkgname=ting_en
pkgver=9.4.6
pkgrel=2
pkgdesc="A proprietary software to practice listening english for archlinux"
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/ting"
license=('unknown')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libappindicator-gtk3' 'libsecret' 'at-spi2-core' 'util-linux-libs')
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/ting_en/${pkgname}.deb")


package() {
	tar xJvf data.tar.xz -C "${pkgdir}"
	mkdir -p "${pkgdir}"/opt/ting_en
	mv "${pkgdir}/opt/每日英语听力"/* "${pkgdir}/opt/ting_en"
	rmdir "${pkgdir}/opt/每日英语听力"

	sed -ine 's/^Exec=.*/Exec=\/opt\/ting_en\/ting_en/' "${pkgdir}"/usr/share/applications/ting_en.desktop


}

md5sums=('414f9e4e93e07c3647864763f4ea526a')
