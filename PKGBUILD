# Maintainer: Michael J. Pento <mjpento@verizon.net>

pkgname=ant-gtk-theme
pkgver=1.2.0
pkgrel=1
pkgdesc="Ant Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856

depends=('gtk3')

_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1538595116/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant.tar"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1538595153/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Bloody.tar"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1538595136/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Nebula.tar"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1538595173/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Dracula.tar"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1538595170/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Dracula-slim.tar.xz"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1538595133/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Nebula-slim.tar.xz"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1538595150/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Bloody-slim.tar.xz"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1538595113/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-slim.tar.xz")

sha256sums=('cf33f7507aeb4527e6541f519dba83610bd4df8f14de514251a661900594bdb3'
						'bc41330df5f8910f8fb59f37bcafa1ab3257d8b765d87e9ccc4c4adcf9b75cba'
						'cff53e73fc1c95591e82dbb8d5f9970beb84f837a6af5808445d2dc43a1545c9'
						'3fb8a299984327cd68ca345d4dfc0e5ae8f4aededa7808cca024f357359d4d06'
						'd239ab706ad6a36807e5e37c4cca9d9045f0cb8a36268da0657dbf3e8de74573'
						'175db0c23142210439ec91b2ae0fb70438577122492da3a790fe5e990ea4644c'
						'54cd998930a90d07d2ccd1eb18b54b5e799a7dc6e1bdcdb0e2f6d6e84bb41f44'
						'a12e49fc07b447fe406fa1652783102401199c4bd3e6e1696b30fa18cbbce76e')

package() {
	cd ${srcdir}
	find Ant{,-Bloody,-Dracula,-Nebula}/ -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/themes/{}" \;

	# break out '-Slim' and '-standard-buttons' sub-dirs
	cp -r "${srcdir}/Ant-slim/Ant-Slim" "${pkgdir}/usr/share/themes/"
	cp -r "${srcdir}/Ant-slim/Ant-Slim-Standard-Buttons" "${pkgdir}/usr/share/themes/"
	cp -r "${srcdir}/Ant-Bloody-slim/Ant-Bloody-Slim" "${pkgdir}/usr/share/themes/"
	cp -r "${srcdir}/Ant-Bloody-slim/Ant-Bloody-slim-standard-buttons" "${pkgdir}/usr/share/themes/"
	cp -r "${srcdir}/Ant-Dracula-slim/Ant-Dracula-Slim" "${pkgdir}/usr/share/themes/"
	cp -r "${srcdir}/Ant-Dracula-slim/Ant-Dracula-slim-standard-buttons" "${pkgdir}/usr/share/themes/"
	cp -r "${srcdir}/Ant-Nebula-slim/Ant-Nebula-Slim" "${pkgdir}/usr/share/themes/"
	cp -r "${srcdir}/Ant-Nebula-slim/Ant-Nebula-slim-standard-buttons" "${pkgdir}/usr/share/themes/"
}
