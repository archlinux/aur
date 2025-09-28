# Maintainer: Yichao Zhou <broken.zhou@gmail.com>
pkgname=freetype2-macos-browsers-binary-patcher
pkgver=3
pkgrel=1
pkgdesc="Script that patches freetype2 library in Chrome and Vivaldi to use a similar filter as the one in freetype2-macos.  It will also install a hook to run the scripts when you install or upgrade Chrome and Vivaldi."
url="https://www.freetype.org/"
arch=('any')
license=('GPL')
depends=('ripgrep')
optdepends=()
makedepends=()
replaces=()
provides=()
source=(99-binary-patch-freetype-in-broswers.hook binary-patch-freetype-in-broswers)
md5sums=('238ed0626e35d3dc036d4fa024bb7b61'
         'b51f4e236689b55f9c4779730e7053ca')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m755 -d "${pkgdir}/usr/bin"
    cp "${srcdir}"/99-binary-patch-freetype-in-broswers.hook "${pkgdir}"/usr/share/libalpm/hooks
    cp "${srcdir}"/binary-patch-freetype-in-broswers "${pkgdir}"/usr/bin
}
