# Maintainer: Carl George < arch at cgtx dot us >
# thanks to the Linux Mint project http://linuxmint.com/
# thanks to "inactive user" who created http://box-look.org/content/show.php/Mint-X+for+Openbox?content=152051

pkgname='mint-x-theme'
_name='mint-themes'
pkgver='1.4.6'
_gtk3ver='3.18+2'
pkgrel='3'
pkgdesc='A Linux Mint theme.  Includes GTK2, GTK3, Metacity, Xfce, and Openbox components.'
arch=('any')
url='http://packages.linuxmint.com'
license=('GPL3')
conflicts=('mint-themes')
source=("${url}/pool/main/m/${_name}/${_name}_${pkgver}.tar.gz"
        "${url}/pool/main/m/${_name}-gtk3/${_name}-gtk3_${_gtk3ver}.tar.xz"
        "http://box-look.org/CONTENT/content-files/152051-newmint.7z")
sha256sums=('49efc330923d4aef8d55ac589bca57882a9c52f69d8efa4c588863575b09e0d2'
            '371a9c37b6261f65cd9180948f5197698c802efc7bddfa6f182da0f33c4a3435'
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
