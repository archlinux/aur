# Maintainer: Renaud Littolff <rlittolff@gmail.com>

pkgname=insomnia
pkgver=3.7.3
pkgrel=2
pkgdesc="A simple and beautiful REST API and HTTP client"
arch=('i686' 'x86_64')
url="http://insomnia.rest/"
options=('!strip' '!upx')

source=("https://downloads.insomnia.rest/linux/insomnia-${pkgver}.deb")
md5sums=('2ab5599435186a8986a0e902651b518f')

package() {
    cd "${srcdir}"

    tar -xf data.tar.xz -C "${pkgdir}"

    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/usr/share/icons
    install -d "${pkgdir}"/opt/Insomnia

    chmod -R go-w "${pkgdir}"/usr

    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/Insomnia/Insomnia ${pkgdir}/usr/bin/insomnia
}
