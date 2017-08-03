# Maintainer: Alex Zappa <reatlat@gmail.com>

pkgname=koala-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Koala is a GUI application for LESS, Sass and CoffeeScript compilation, to help web developers use these tools more efficiently for development."
arch=('x86_64' 'i686')
url="http://koala-app.com/"
_repourl="https://github.com/oklai/koala"
license=('Apache License, Version 2.0')
provides=('koala')
depends=()
optdepends=()

source=('koala.png'
        'koala.desktop')
source_x86_64=("${_repourl}/releases/download/v${pkgver}/koala_${pkgver}_x86_64.tar.gz")
source_i686=("${_repourl}/releases/download/v${pkgver}/koala_${pkgver}_i386.tar.gz")

sha512sums=('00c273bb8b987f8909162885bf5eca48013fcc81abef0e1d6565a5bd9ce5e8071306fb8186eab790fb025ef2aa960d9770a4b6e656424d6ed92fdf769681167b'
            'e0862ffe8fa9431c0d1147e7f3d7f6d7d13bce789f970a0d2fa2b51891eda8161965f05068f7348d7ec12cdc8840bb555532520b839833893cbbda4715e87131')
sha512sums_x86_64=('c282bfaa1af9127a005211ed67a19ac09b2c8f4cf16ae98abc959951b9ea55fb41c8bf7d9a43c9711bf6fa8dbf609c27605654b834c752a43880ab8d98fb9dd3')
sha512sums_i686=('d7084462eabee6e270986391d190889f6c555df5fad3a730e622a847dc431160de673238f936185cb26a02ca1efbdeac78d68e20981e0e67079b1ea385e3a039')

package() {
  cd ${srcdir}/usr/share/koala

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/koala"
  mkdir -p "${pkgdir}/usr/share/applications"

  cp --preserve=mode -R ./* "${pkgdir}/usr/share/koala"
  install -D -m644 "${srcdir}/koala.png" "${pkgdir}/usr/share/koala/koala.png"
  chmod +x "${srcdir}/koala.desktop"
  install -D -m644 "${srcdir}/koala.desktop" "${pkgdir}/usr/share/applications/koala.desktop"
  ln -s "${pkgdir}/usr/share/koala/Koala" "${pkgdir}/usr/bin/koala"

}
