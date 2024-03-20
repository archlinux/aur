# Maintainer: Bot-wxt1221 <3264117476@qq.com>
pkgname=warp-terminal-bin
pkgver=0.2024.03.12.08.02.stable.02
_pkgver=0.2024.03.12.08.02.stable_02
pkgrel=1
arch=('x86_64')
source=("https://releases.warp.dev/stable/v${_pkgver}/warp-terminal_${pkgver}_amd64.deb" warp-terminal-bin.desktop warp-terminal.png)
md5sums=('c4276c8d6d215454d994014c83fb09ce'
         '309a99bcbfaeb72715754008b3732a32'
         '6cd2541e1189c29ceb576300ff3356c6')


prepare() {
    mv warp-terminal_${pkgver}_amd64.deb ${pkgname}_${pkgver}.deb
    ar -x ${pkgname}_${pkgver}.deb
    mkdir ${pkgname}-${pkgver}
    tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
}


package() {
  cd "$pkgname-$pkgver"
  install -Dm644 ../warp-terminal-bin.desktop ${pkgdir}/usr/share/applications/warp-terminal-bin.desktop
  install -Dm644 ../warp-terminal.png "${pkgdir}"/usr/share/pixmaps/warp-terminal.png
  cp -r ./ ${pkgdir}/
}
