# Maintainer: Anders Thomsen <mail nospamat andersthomsen nospamdot dk>
pkgname=xairedit
pkgver=1.5
pkgrel=2
pkgdesc="Remote control and programm Behringer X Air Mixers"
arch=('i686' 'x86_64')
url="https://www.music-group.com/Categories/Behringer/Mixers/Digital-Mixers/XR18/p/P0BI8/downloads"
license=('custom:MUSIC Group End User License Agreement')
install=${pkgname}.install

depends=('libxext' 'alsa-lib' 'freetype2' 'mesa' 'mesa-libgl')

source=("http://www.music-group.com/eurocom/assets/EULA_2012-09-12.pdf"
         "xairedit.desktop"
         "x-air-edit.png")
source_i686=("http://downloads.music-group.com/software/behringer/XAIR/X-AIR-Edit_LINUX_V${pkgver}.tar.gz")
source_x86_64=("https://downloads.music-group.com/software/behringer/XAIR/X-AIR-Edit_LINUX_X64_V${pkgver}.tar.gz")


md5sums=('20cca5d2623f1029e30e45d64438b253'
         '2670b113f2de68c095806e3d2d3ab793'
         '51cc52ee85a7b2ac86684bfcf5080521')
md5sums_i686=('d07f4c0f8e57b12173dc9a1a54497aad')
md5sums_x86_64=('85bb2287b690a6dc0d99e8160c407cf3')
sha256sums=('3321aa0b3e208133094665281a6fc2ca001628858cd1a6388185eac93569fca8'
            'bbd4619a1f62a68bf9e68f041db5e5c08ac98432f856bce2c56a8172811a8537'
            '9f52ae75d8826890448dcac1be09dcb9f7e01d1feba46c2dfaf2e6150f2d4b58')
sha256sums_i686=('0e6be5513505c725ac38a7febaf80e4e140cce7161609dd90ca203c0827362bc')
sha256sums_x86_64=('3733b829ed07319f786add8654619e70bc9e7bbcad41b6d11bf6cd93e5ffe3c5')
sha512sums=('fe39285768937d82f31844b789d1075de8196495727653595e59f4f1b282f6dbe18a8a8bc51b837f284601dc37c52211d3d494a8636512f5398da31ff3d30284'
            'f50db18e0bc0f0537fe2e4f1001a6d36f1b757241cba81dbbc85a5d4423980aae4219f0e97433089efa239388eb81c24e65e6f3721f76ba6a48d8b2f299e606a'
            '415ee0d4df2b8a24f5eede1dc03d4c54d47fe789baba45801e363129f5eec9ec2177ca3e5cdfc0a0af7173e9daf4653eb4c286ee4f0db050f513d84eb74bcad5')
sha512sums_i686=('fd75b67efa152c1324f14a338bfe66583fcd741f8a3f8e84c65e1a7452bdaddf34177e87cda2e1100abf05f3fb6cd792696f4fc5661b5694ede5e8ee85dfd320')
sha512sums_x86_64=('9df782199a734a5fd2c8ef2da0cd02848f1b58f3c416260910213807ef731c5c771ec6009712024fe1f111d9fe3127159fb10b797234b1dee3ff90137611a074')

package()
{
    cd "${srcdir}"
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/licenses/xairedit
    install -m 755 X-AIR-Edit ${pkgdir}/usr/bin/
    install -m 644 EULA_2012-09-12.pdf ${pkgdir}/usr/share/licenses/xairedit/license.pdf
    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/usr/share/pixmaps
    install xairedit.desktop "${pkgdir}"/usr/share/applications/xairedit.desktop
    install x-air-edit.png "${pkgdir}"/usr/share/pixmaps/x-air-edit.png
}

