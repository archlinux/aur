# Maintainer : Beatussum <echo 'YmVhdHVzc3VtQHByb3Rvbm1haWwuY29tCg==' | base64 -d>


pkgname=ormlite-android
pkgver=5.1
pkgrel=1
pkgdesc="Provides some functionality for persisting Java objects to SQL databases"
arch=('any')
url="http://ormlite.com"
license=('custom: ISC')
depends=('java-environment')
makedepends=('java-runtime-common')
source=("http://ormlite.com/releases/${pkgver}/${pkgname}-${pkgver}-sources.jar"
        "http://ormlite.com/releases/${pkgver}/${pkgname}-${pkgver}-javadoc.jar")
noextract=("${pkgname}-${pkgver}-javadoc.jar")
sha256sums=('b27924be7845c76185684664dde867f1ee2807acc81ca08d2bccfe2bb942826c'
            'ae04552e8d552f5fd38bb0383281b234325939cc5f254ca2d0088453e6b33d57')


package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-sources.jar" "${pkgdir}/usr/share/java/${pkgname}-${pkgver}.jar"
    
    install -Dm644 "${srcdir}/com/j256/ormlite/android/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/com/j256/ormlite/android/README.txt" "${pkgdir}/usr/share/licenses/${pkgname}/README"
    
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    cd "${pkgdir}/usr/share/doc/${pkgname}"
    jar -xf "${srcdir}/${pkgname}-${pkgver}-javadoc.jar"
}
