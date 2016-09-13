# Maintainer: Renaud Littolff <rlittolff@gmail.com>

pkgname=insomnia
pkgver=3.4.1
pkgrel=2
pkgdesc="A simple and beautiful REST API and HTTP client"
arch=('i686' 'x86_64')
url="http://insomnia.rest/"
options=('!strip' '!upx')

source=("https://s3.amazonaws.com/builds-insomnia-rest/linux/insomnia-${pkgver}.deb")
md5sums=('c08d968390b35b7130d89e636ee783cf')

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
