# Maintainer: Renaud Littolff <rlittolff@gmail.com>

pkgname=insomnia
pkgver=4.2.14
pkgrel=1
pkgdesc="A simple and beautiful REST API and HTTP client"
arch=('i686' 'x86_64')
url="http://insomnia.rest/"
options=('!strip' '!upx')

source=("https://downloads.insomnia.rest/linux/insomnia_${pkgver}_amd64.deb")
md5sums=('f572342b1a548807ae53d9c85455c2d5')

package() {
    cd "${srcdir}"

    tar -xf data.tar.xz -C "${pkgdir}"

    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/usr/share/icons
    install -d "${pkgdir}"/opt/Insomnia

    chmod -R go-w "${pkgdir}"/usr

    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/Insomnia/insomnia ${pkgdir}/usr/bin/insomnia
}
