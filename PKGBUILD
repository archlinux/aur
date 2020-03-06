# Maintainer: Michał Przybyś <michal@przybys.eu>
pkgname=roslynpad
pkgver=14.1
pkgrel=1
pkgdesc='A cross-platform C# editor based on Roslyn and AvalonEdit'
arch=(any)
url='https://roslynpad.net/'
license=(Apache)
depends=(dotnet-runtime-2.2
   desktop-file-utils)
source=("https://github.com/aelij/RoslynPad/releases/download/${pkgver}/RoslynPadNetCore.zip"
    https://github.com/aelij/RoslynPad/raw/master/src/RoslynPad/Resources/RoslynPad.png
    roslynpad
    roslynpad.desktop
    roslynpad.install)
md5sums=(6a9a8acc16eee0e4aeea291e6a90dd2e
    8d0506a92294de1a4d26bec0f009d015
    2bbafbadd0b5f3d088ce8a248058a06f
    d6788321c8bf62a8b5198039dbbee2d3
    a91349cbede88402f0b44728ad9b443f)

package() {
    install -dm755 "${pkgdir}"/opt/roslynpad
    cp -aR "${srcdir}"/* "${pkgdir}"/opt/roslynpad/

    install -Dm777 roslynpad "${pkgdir}"/usr/bin/roslynpad
    install -Dm644 RoslynPad.png "${pkgdir}"/usr/share/pixmaps/roslynpad.png
    install -Dm644 roslynpad.desktop "${pkgdir}"/usr/share/applications/roslynpad.desktop
}
