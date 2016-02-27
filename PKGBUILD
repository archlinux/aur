# Maintainer: Anders Thomsen <mail nospamat andersthomsen nospamdot dk>
pkgname=xairedit
pkgver=1.3
pkgrel=1
pkgdesc="Remote control and programm Behringer X Air Mixers"
arch=('i686' 'x86_64')
url="https://www.music-group.com/Categories/Behringer/Mixers/Digital-Mixers/XR18/p/P0BI8/downloads"
license=('custom:MUSIC Group End User License Agreement')
install=${pkgname}.install
depends_i686=('libxext' 'alsa-lib' 'freetype2' 'mesa')
depends_x86_64=('lib32-libxext' 'lib32-alsa-lib' 'lib32-freetype2' 'lib32-pcre' 'lib32-mesa')
source=("http://downloads.music-group.com/software/behringer/XAIR/X-AIR-Edit_LINUX_V${pkgver}.tar.gz"
"xairedit.desktop"
"x-air-edit.png")
md5sums=('846c0722d5b8e57d83f6f69ef1badd0c'
         '2670b113f2de68c095806e3d2d3ab793'
         '51cc52ee85a7b2ac86684bfcf5080521')
sha256sums=('7eb25b21659534e293e907e7f7c99d72950e1441d4c2ecb4697f1eda020d3e4d'
            'bbd4619a1f62a68bf9e68f041db5e5c08ac98432f856bce2c56a8172811a8537'
            '9f52ae75d8826890448dcac1be09dcb9f7e01d1feba46c2dfaf2e6150f2d4b58')
sha512sums=('7179f0cca0ef838b8e11fe3719867256fcf13d6d4c1e39f3afe9921107b97949b498531d1afc119538535a6e35ffde19cfbdb3774ee6e457b5c51bd0bb5082ff'
            'f50db18e0bc0f0537fe2e4f1001a6d36f1b757241cba81dbbc85a5d4423980aae4219f0e97433089efa239388eb81c24e65e6f3721f76ba6a48d8b2f299e606a'
            '415ee0d4df2b8a24f5eede1dc03d4c54d47fe789baba45801e363129f5eec9ec2177ca3e5cdfc0a0af7173e9daf4653eb4c286ee4f0db050f513d84eb74bcad5')

package()
{
    cd "${srcdir}"
    tar xf X-AIR-Edit_LINUX_V${pkgver}.tar.gz
	mkdir -p ${pkgdir}/usr/bin
	install -m 755 X-AIR-Edit ${pkgdir}/usr/bin/

	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/pixmaps
	install xairedit.desktop "${pkgdir}"/usr/share/applications/xairedit.desktop
	install x-air-edit.png "${pkgdir}"/usr/share/pixmaps/x-air-edit.png

}

