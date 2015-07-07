# Maintainer: Carl George < arch at cgtx dot us >
# thanks to the Linux Mint project http://linuxmint.com/
# thanks to "inactive user" who created http://box-look.org/content/show.php/Mint-X+for+Openbox?content=152051

pkgname='mint-x-theme'
_name='mint-themes'
pkgver='1.4.5'
_gtk3ver='3.14+8'
pkgrel='1'
pkgdesc='A Linux Mint theme.  Includes GTK2, GTK3, Metacity, Xfce, and Openbox components.'
arch=('any')
url='http://packages.linuxmint.com'
license=('GPL3')
conflicts=('mint-themes')
source=("${url}/pool/main/m/${_name}/${_name}_${pkgver}.tar.gz"
        "${url}/pool/main/m/${_name}-gtk3/${_name}-gtk3_${_gtk3ver}.tar.gz"
	'http://box-look.org/CONTENT/content-files/152051-newmint.7z')
sha256sums=('7f6c12b8b01dbd1b30e0c7fdeda85258cd79229b20528857735be086d59dd65a'
            '71ae8c96ba5c067763f448d919d494dc6f66e451a42b98806ed20b15f97ed455'
            '7a3e19d90920331f47ca3dc55a0d072ff927bd3eca64ff6d3ad685bbfbf99af1')

prepare() {
	find ${srcdir} -name .gitkeep -type f -delete
	find ${srcdir} -type d ! -perm 755 -exec chmod 755 {} +
	find ${srcdir} -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership ${srcdir}/${_name}/usr ${pkgdir}/
	cp -dr --no-preserve=ownership ${srcdir}/${_name}-gtk3/usr ${pkgdir}/
	cp -dr --no-preserve=ownership ${srcdir}/MintX/openbox-3 ${pkgdir}/usr/share/themes/Mint-X/
}
