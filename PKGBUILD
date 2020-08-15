#Maintainer: laravelarticle.com <harun.cox@gmail.com>

pkgname=dbseeder
pkgver=1.0.1
pkgrel=1
pkgdesc='A database seeder for MySQL'
arch=('x86_64')
url='http://laravelarticle.com'
license=('')
source=("https://github.com/haruncpi/db-seeder/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('74a7a092dd1d617c282a41ec110c6ba2bf4e73d96a1470bbb0e78b5db8b2f6c5')

build() {

  ar -x ${srcdir}/${pkgname}_${pkgver}_amd64.deb
  tar -xJf ${srcdir}/data.tar.xz

}

package() {
    install -d "${pkgdir}/opt/"
    install -d "${pkgdir}/usr/"
    cp -r "${srcdir}/opt/${pkgname}" "${pkgdir}/opt/"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"

}
post_install(){
    ln -sf '/opt/dbseeder/dbseeder' '/usr/bin/dbseeder'
}
post_remove(){
    rm -f '/usr/bin/dbseeder'
}