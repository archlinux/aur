# Maintainer: Amit He <scybhe@163.com>
pkgname=spring-roo
pkgver=1.3.2.RELEASE
pkgrel=1
pkgdesc="Spring Roo is an easy-to-use productivity tool for rapidly building enterprise applications in the Java programming language."
arch=("any")
url="http://projects.spring.io/spring-roo/"
license=('APACHE')
depends=("java-environment" "maven")
backup=("opt/${pkgname}/conf/config.properties")
source=("http://spring-roo-repository.springsource.org.s3.amazonaws.com/release/ROO/${pkgname}-${pkgver}.zip"
        "cache.patch")
md5sums=("8d52c6de1889e8685101df7471192ed3"
        "46c00255365a44c35cb2b2947e6146fa")

prepare(){
    cd ${srcdir}/${pkgname}-${pkgver}
    patch -p1 -i ../cache.patch
}

package() {
    install -dm0755 ${pkgdir}/opt
    mv ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/opt/${pkgname}
    install -dm0755 ${pkgdir}/usr/bin
    ln -s /opt/${pkgname}/bin/roo.sh ${pkgdir}/usr/bin/roo
}
