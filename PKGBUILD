# Maintainer: OSO <osospeed@hotmail.com>

pkgname=hopper
pkgUrl=$(wget -O- --header='User-Agent: Mozilla' 'https://www.hopperapp.com/include/files-api.php?request=releases' | sed 's|.*\(https:.*pkg.tar.xz\)".*|\1|gi' |  tr -d '\')
IFS=- read x pkgver pkgrel x <<< ${pkgUrl};
pkgdesc="Hopper disassembler"
arch=('x86_64' 'i686')

package() {
	wget ${pkgUrl}
	tar xvf *.xz -C ${pkgdir}
}
