# Maintainer: Artem Klevtsov a.a.klevtsov@gmail.com

_pkgname='SmartAmp'
pkgname='smartamp'
pkgdesc=' Next-level guitar tone powered by machine learning.'
pkgver=1.3
pkgrel=1
groups=('vst-plugins' 'vst3-plugins' 'pro-audio')
depends=('freetype2' 'curl')
makedepends=()
optdepends=()
conflicts=('smartamp-git')
replaces=('smartamp-git')
arch=('x86_64')
url='https://guitarml.com/smartamp.html'
license=('APACHE')
source=("https://github.com/GuitarML/SmartGuitarAmp/releases/download/v${pkgver}/SmartAmp-Linux-x64-${pkgver}.deb")
sha512sums=('73716c254f56d53f57c0dc95a9c1cfaa914d9d6f7277a40acb0f1401c64c96e1f2513d9a96820c72f0150f62125918aa1ec3da27ba3572205d4bc856b3a22f65')

package () {
    mkdir -p "${pkgdir}/usr/lib/vst3"
    tar -xf ${srcdir}/data.tar.xz --directory ${srcdir}
    cp -ar "${srcdir}/usr/local/lib/vst3/SmartAmp.vst3" "${pkgdir}/usr/lib/vst3/"
}
