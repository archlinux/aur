# Maintainer: Michael J. Pento <mjpento@verizon.net>

pkgname=ant-gtk-theme
pkgver=1.1.0
pkgrel=7
pkgdesc="Ant Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856

depends=('gtk3')

_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1533245814/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant.tar"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1533875341/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Bloody.tar"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1533245870/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Nebula.tar"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1533245854/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Dracula.tar"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1533277541/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Dracula-slim.tar.xz"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1533277561/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Nebula-slim.tar.xz"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1533875433/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Bloody-slim.tar.xz"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1533277517/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-slim.tar.xz")

sha256sums=('26cf6832bb1b0bc595896dee045c252dca65f12d32f0ba8e641ac152913abed8'
						'aefdfd5cbde815b369b16f474b6bf13c4839904d9c2b2b2a5df0828226cfcbf0'
						'bd86338e75f697c360b64c9a766d059ca79787e5364d8cd75a42f67fbf90ec46'
						'8977b0b528b2306cdc92419f9caf34818cd2ac64eff18991eab7e16e422eeb5e'
						'145713bd96146ac61262bf38ee87554adc4e170fc524d3718f3d22508b07b061'
						'fabdc3003dc5003ffbfd0b74148e32318d22e53411c5278bf4f3f93f3cdb00df'
						'21717394faafe7ab177b67f158b0ef291c6ef6bb78272c87d40e560c469dbafe'
						'514f26401bbd4db1ccec413e88035c1bb9a0f4547c10e97874d52a98ed7f171c')
package() {
	cd ${srcdir}
	find Ant{,-Bloody,-Dracula,-Nebula}/ -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/themes/{}" \;

	# break out '-Slim' and '-standard-buttons' sub-dirs
	cp -r "${srcdir}/Ant-slim/Ant-slim" "${pkgdir}/usr/share/themes/"
	cp -r "${srcdir}/Ant-slim/Ant-slim-standard-buttons" "${pkgdir}/usr/share/themes/"
	cp -r "${srcdir}/Ant-Bloody-slim/Ant-Bloody-Slim" "${pkgdir}/usr/share/themes/"
	cp -r "${srcdir}/Ant-Bloody-slim/Ant-Bloody-slim-standard-buttons" "${pkgdir}/usr/share/themes/"
	cp -r "${srcdir}/Ant-Dracula-slim/Ant-Dracula-slim" "${pkgdir}/usr/share/themes/"
	cp -r "${srcdir}/Ant-Dracula-slim/Ant-Dracula-slim-standard-buttons" "${pkgdir}/usr/share/themes/"
	cp -r "${srcdir}/Ant-Nebula-slim/Ant-Nebula-slim" "${pkgdir}/usr/share/themes/"
	cp -r "${srcdir}/Ant-Nebula-slim/Ant-Nebula-slim-standard-buttons" "${pkgdir}/usr/share/themes/"
}
