# Maintainer: XDwanj <xdwanj@qq.com>

pkgname=cheat-engine-zh
pkgver=7.5
pkgrel=1
pkgdesc="Cheat Engine is a development environment focused on modding games and applications for personal use."
arch=('x86_64')
url="https://cheatengine.org"
license=('custom:commercial')
options=(!strip)

source=('https://github.com/XDwanj/cheat-engine-zh/releases/download/v7.5/Cheat_Engine_v7.5.tar.gz'
        'cheat-engine-zh.install')

md5sums=('9575239e495be6ce0504cf796f7c77f5'
         'e3e3f39ae2015a611660138d93fd3972')

install=cheat-engine-zh.install
package() {
  depends=('wine')
  optdepends=(
    "proton-ge-custom: Compatibility tool for Steam Play based on Wine and additional components, GloriousEggroll\'s custom build"
  )

  cd "$srcdir"

  install -d "$pkgdir"/opt/$pkgname
  cp -r Cheat_Engine_v${pkgver}/* "$pkgdir"/opt/$pkgname

  chmod 755 -R "$pkgdir"/opt/$pkgname
}
