# Maintainer: Carl George < arch at cgtx dot us >
# thanks to the Linux Mint project http://linuxmint.com/
# thanks to "inactive user" who created http://box-look.org/content/show.php/Mint-X+for+Openbox?content=152051

pkgname='mint-x-theme'
_name='mint-themes'
pkgver='1.4.6'
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
sha256sums=('49efc330923d4aef8d55ac589bca57882a9c52f69d8efa4c588863575b09e0d2'
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
