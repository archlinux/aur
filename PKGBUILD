# Maintainer: Elrondo46 directed by ERA Energie Assistance IT Departement <elrond94@hotmail.com>

pkgname=openconcerto
pkgver=1.6.2
pkgrel=1
pkgdesc="ERP ILM Openconcerto client multi and mono"
arch=('any')
license=('GPL3')
url="https://www.openconcerto.org/"
depends=('jre7-openjdk' 'jre8-openjdk' 'jre7-openjdk-headless' 'jre8-openjdk-headless')
source=("https://www.openconcerto.org/fr/telechargement/1.6/${pkgname}-${pkgver}.deb"
        "OpenConcerto-Caisse.desktop"
        "OpenConcerto-Configuration.desktop"
	"OpenConcerto.desktop")
sha256sums=('a4e0cdafd3b24ecc89fadcaacb276087cd059cdb47d265d7ed190121d16a478a'
            '904b7a2837c4d2dc4242fb43d41150f8a4e5d9d06d9ea7ede811950f680e05ff'
            '95c53e1494e7424d8a37fea79e3b9b29c3efb0da95bce72867086c067657917d'
            '8c1cbf1a4bc1ec002802e4bea84374b133c721a0faf2240b70c2701c52a7a1cb')

package() {
	bsdtar xf data.tar.gz
	chmod -R g-w usr
	mv usr "${pkgdir}"
	chmod -R g-w opt
	mv opt "${pkgdir}"
        rm "${pkgdir}"/usr/share/applications/OpenConcerto-Configuration.desktop
        rm "${pkgdir}"/usr/share/applications/OpenConcerto-Caisse.desktop
        rm "${pkgdir}"/usr/share/applications/OpenConcerto.desktop
        install -Dm644 "OpenConcerto.desktop" "${pkgdir}/usr/share/applications/OpenConcerto.desktop"
        install -Dm644 "OpenConcerto-Configuration.desktop" "${pkgdir}/usr/share/applications/OpenConcerto-Configuration.desktop"
        install -Dm644 "OpenConcerto-Caisse.desktop" "${pkgdir}/usr/share/applications/OpenConcerto-Caisse.desktop"

} 

