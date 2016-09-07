# Maintainer: Renaud Littolff <rlittolff@gmail.com>

pkgname=insomnia
pkgver=3.3.2
pkgrel=2
pkgdesc="A simple and beautiful REST API and HTTP client"
arch=('i686' 'x86_64')
url="http://insomnia.rest/"
options=('!strip' '!upx')

source=("https://s3.amazonaws.com/builds-insomnia-rest/linux/insomnia-${pkgver}.deb")
md5sums=('f11abd126bd38a5fe7ca51932e6cce37')

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
