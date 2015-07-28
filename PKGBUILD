# Maintainer: twa022 <twa022 at gmail dot com> 

pkgname=emerald-equinox-themes
pkgver=20100324
pkgrel=1
pkgdesc="Equinox emerald themes"
url="http://liliumcruentus.deviantart.com/art/Equinox-emerald-theme-158297377"
license=()
arch=('any')
depends=('emerald')
source=("http://www.deviantart.com/download/158297377/_Equinox_emerald_theme__by_liliumcruentus.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')

package() {
	cd ${srcdir}
    for file in *emerald ; do 
		mkdir -p ${pkgdir}/usr/share/emerald/themes/"${file/.emerald/}"
		bsdtar -x -f "${file}" -C ${pkgdir}/usr/share/emerald/themes/"${file/.emerald/}"
	done
}

md5sums=('2a735f65bff70efc607142dcfca40fff')
