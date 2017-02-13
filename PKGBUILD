# Maintainer: Elrondo46 directed by ERA Energie Assistance IT Departement <elrond94@hotmail.com>

pkgname=openconcerto-beta
pkgver=1.5b2
pkgrel=1
pkgdesc="ERP ILM Openconcerto beta channel client multi and mono"
arch=('any')
license=('GPL3')
url="https://www.openconcerto.org/"
conflicts=('openconcerto')
depends=('jre7-openjdk' 'jre8-openjdk' 'jre7-openjdk-headless' 'jre8-openjdk-headless')

source=("http://www.openconcerto.org/fr/telechargement/betas/${pkgver}/openconcerto-${pkgver}.deb"
        "OpenConcerto-Caisse.desktop"
        "OpenConcerto-Configuration.desktop"
        "OpenConcerto.desktop")

sha256sums=('0532b12fe25d11bcb118dc79387d89a2490ec888a7fb2e7d9b03fa5845d4a3b3'
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

