# Maintainer: wDona <donanferyt@gmail.com> 
pkgname=burnt-out 
pkgver=1.3.04
pkgrel=1
pkgdesc="To-do app focused on preventing Burnout Syndrome ;)" 
arch=('x86_64') 
url="https://github.com/wDona/Burnt-out" 
license=('MIT') 
#depends=('java-runtime') 
source_x86_64=("https://github.com/wDona/Burnt-out/releases/download/v${pkgver}/${pkgname}-${pkgver}-installer.deb") 
sha256sums_x86_64=('SKIP') 
package() { 
    bsdtar -xf "${srcdir}/burnt-out-${pkgver}-installer.deb" data.tar.*
    bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}/"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/burntoutapp/bin/BurntOutApp "${pkgdir}/usr/bin/burnt-out"

    mkdir -p "${pkgdir}/usr/share/applications"
    cp "${pkgdir}/opt/burntoutapp/lib/burntoutapp-BurntOutApp.desktop" \
       "${pkgdir}/usr/share/applications/burnt-out.desktop"
}
