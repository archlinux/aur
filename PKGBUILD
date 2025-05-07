_pkgname=pixiv-multiplatform
pkgname=pixiv-multiplatform-git
pkgver=1.7.2
pkgrel=172
pkgdesc="基于Kotlin技术栈的全平台的第三方pixiv客户端"
url="https://pmf.kagg886.top"
license=(GPL3)
arch=(any)
makedepends=(jdk17-openjdk rust)
source=("git+https://github.com/kagg886/Pixiv-MultiPlatform.git")
sha512sums=(SKIP)

build(){
    cd Pixiv-MultiPlatform
    ./gradlew packageReleaseDistributionForCurrentOs
}

package(){
    install -d $pkgdir/opt/Pixiv-MultiPlatform/

    install -Dm755 ../Pixiv-MultiPlatform.desktop $pkgdir/usr/share/applications/Pixiv-MultiPlatform.desktop
    cd Pixiv-MultiPlatform
    cp -ar composeApp/build/compose/binaries/main-release/app/Pixiv-MultiPlatform $pkgdir/opt
    install -Dm644 composeApp/icons/pixiv.png $pkgdir/usr/share/icons/hicolor/256x256/apps/Pixiv-MultiPlatform.png
}
