# Maintainer: Amit He <scybhe@163.com>
pkgname=spring-roo
pkgver=2.0.0.RELEASE
pkgrel=1
pkgdesc="Spring Roo is an easy-to-use productivity tool for rapidly building enterprise applications in the Java programming language."
arch=("any")
url="http://projects.spring.io/spring-roo/"
license=('APACHE')
depends=("java-environment" "maven")
backup=("opt/${pkgname}/conf/config.properties")
source=("http://spring-roo-repository.springsource.org.s3.amazonaws.com/release/ROO/${pkgname}-${pkgver}.zip"
        "cache.patch")
md5sums=("54f3e0900d64f6b064c8a4ba78c262eb"
        "cd33399b3b7946dbe1b76ece8b541996")

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
