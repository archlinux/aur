_pkgname=pixiv-multiplatform
pkgname=pixiv-multiplatform-git
pkgver=1.6.3
pkgrel=163
pkgdesc="基于Kotlin技术栈的全平台的第三方pixiv客户端"
url="https://pmf.kagg886.top"
license=(GPL3)
arch=(any)
makedepends=(jdk11-openjdk)
source=("git+https://github.com/kagg886/Pixiv-MultiPlatform.git")
sha512sums=(SKIP)

build(){
    cd Pixiv-MultiPlatform
    ./gradlew packageReleaseDistributionForCurrentOs
}

package(){
    cd Pixiv-MultiPlatform
    install -d $pkgdir/opt/Pixiv-MultiPlatform/
    cp -ar composeApp/build/compose/binaries/main-release/app/Pixiv-MultiPlatform $pkgdir/opt
    install -Dm755 Pixiv-MultiPlatform.desktop $pkgdir/usr/share/applications/Pixiv-MultiPlatform.desktop
    install -Dm644 composeApp/icons/pixiv.png $pkgdir/usr/share/icons/hicolor/256x256/apps/Pixiv-MultiPlatform.png
}
