# Maintainer: bodhi.zazen <bodhi.zazen@proton.me>
pkgname=fortune-mod-dhammapada-1.0
pkgver=1.0
pkgrel=1
pkgdesc="fortune cookies dhammapada"
arch=('any')
license=('GPLv3')
url="https://gitlab.com/bodhi.zazen/display-dhammapada/-/archive/main/display-dhammapada-main.tar.gz"
depends=('fortune-mod')
source=("dhammapada" "dhammapada.m" "dhammapada.de" "dhammapada.pl" "fortune-mod-dhammapada.1.gz")

package() {
    # Create the destination directory
    install -d "${pkgdir}/usr/share/fortune/"

    # Copy the source file to the destination
    install -m 644 "${srcdir}/dhammapada" "${pkgdir}/usr/share/fortune/dhammapada"
    install -m 644 "${srcdir}/dhammapada.m" "${pkgdir}/usr/share/fortune/dhammapada.m"
    install -m 644 "${srcdir}/dhammapada.de" "${pkgdir}/usr/share/fortune/dhammapada.de"
    install -m 644 "${srcdir}/dhammapada.pl" "${pkgdir}/usr/share/fortune/dhammapada.pl"
    install -Dm644 "${srcdir}/fortune-mod-dhammapada.1.gz" "${pkgdir}/usr/share/man/man1/fortune-mod-dhammapada.1.gz"

    # Generate the .dat file using strfile within the package environment
    /usr/bin/strfile "${pkgdir}/usr/share/fortune/dhammapada"
    /usr/bin/strfile "${pkgdir}/usr/share/fortune/dhammapada.m"
    /usr/bin/strfile "${pkgdir}/usr/share/fortune/dhammapada.de"
    /usr/bin/strfile "${pkgdir}/usr/share/fortune/dhammapada.pl"
}

sha256sums=('6654a8fc860c4753d42281cdc1577dd20c2bdefeec072fc1d9eca04313a46794'
            '240a52ec229217e30b522b7eab2328741a70f796ac4bcbfb3d9743783bda77fa'
            '13a3710bb9f0b6a0daaa75b4e2eff4b103de8b441e98939be6ad98cfb92587f8'
            '759f1d827c4735cd7872207ad6d362e3e0f200d5979c78788977d16fcac0054f'
            '23b0e1445ab05eae38b0180234796093459bcdaf0ef27995c0809191ad633c7f')
