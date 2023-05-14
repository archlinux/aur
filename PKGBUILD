# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
_base=agena
pkgbase=lib32-${_base}-bin
pkgname=(${pkgbase} ${_base}-bin)
pkgver=2.39.2
pkgrel=1
pkgdesc="An Algol-inspired procedural programming language designed for science, scripting, and other applications"
arch=('x86_64' 'i686')
url="http://${_base}.sourceforge.net"
license=(GPL)
source=(${pkgbase}-${pkgver}.deb::https://master.dl.sourceforge.net/project/${_base}/Binaries/Agena%20${pkgver}/${_base}-${pkgver}-linux.i386.deb
  ${_base}.desktop)
sha512sums=('0db3059017acdb444d949cf1cbc714681bbca5e1321e0e6d371662fb4987f1b58eddbdf8f9e47167f695e2cfc27700db4ea58bc2dfd642511e364dbfa187f248'
  'b43884e220d979054e4f532fdb96ad373a0a5fed23ac755f44bccdf0bc12959b96cd45f40eabaf8a35b7bd3c6fa9958ccef68faa180063ab46624a2a624781b6')

prepare() {
  bsdtar xf data.tar.xz
}

package_lib32-agena-bin() {
  depends=('lib32-libxext' 'lib32-ncurses' 'lib32-readline')
  arch=('x86_64')
  provides=("${_base}" "${_base}-editor")
  conflicts=("${_base}" "${_base}-editor")

  install -Dm 755 usr/local/bin/agena{,edit} -t "${pkgdir}/usr/bin/"
  install -Dm 644 usr/local/lib/libagena.so -t "${pkgdir}/usr/lib32/"
  install -Dm 644 agena.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm 644 usr/agena/share/icons/agenasmall.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/agena.png"
  install -Dm 644 usr/agena/share/icons/agena.png -t "${pkgdir}/usr/share/icons/hicolor/32x32/apps/"
  install -Dm 644 usr/agena/share/icons/agena64x64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/agena.png"
  install -Dm 644 usr/agena/share/icons/agena128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/agena.png"

  ln -s /usr/lib32/libhistory.so.7 "${pkgdir}/usr/lib32/libhistory.so.7"
  ln -s /usr/lib32/libncursesw.so "${pkgdir}/usr/lib32/libncurses.so.5"
  ln -s /usr/lib32/libreadline.so.8 "${pkgdir}/usr/lib32/libreadline.so.6"
  ln -s /usr/lib32/libreadline.so.8 "${pkgdir}/usr/lib32/libreadline.so.7"
  ln -s /usr/lib32/libncursesw.so "${pkgdir}/usr/lib32/libtinfo.so.5"
}

package_agena-bin() {
  depends=('libxext' 'ncurses' 'readline')
  arch=('i686')
  provides=("${_base}" "${_base}-editor")
  conflicts=("${_base}" "${_base}-editor")

  install -Dm 755 usr/local/bin/agena{,edit} -t "${pkgdir}/usr/bin/"
  install -Dm 644 usr/local/lib/libagena.so -t "${pkgdir}/usr/lib/"
  install -Dm 644 agena.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm 644 usr/agena/share/icons/agenasmall.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/agena.png"
  install -Dm 644 usr/agena/share/icons/agena.png -t "${pkgdir}/usr/share/icons/hicolor/32x32/apps/"
  install -Dm 644 usr/agena/share/icons/agena64x64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/agena.png"
  install -Dm 644 usr/agena/share/icons/agena128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/agena.png"

  ln -s /usr/lib32/libhistory.so.7 "${pkgdir}/usr/lib32/libhistory.so.7"
  ln -s /usr/lib32/libncursesw.so "${pkgdir}/usr/lib32/libncurses.so.5"
  ln -s /usr/lib32/libreadline.so.8 "${pkgdir}/usr/lib32/libreadline.so.6"
  ln -s /usr/lib32/libreadline.so.8 "${pkgdir}/usr/lib32/libreadline.so.7"
  ln -s /usr/lib32/libncursesw.so "${pkgdir}/usr/lib32/libtinfo.so.5"
}
