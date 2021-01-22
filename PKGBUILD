# Maintainer: riey <creeper844@gmail.com>
pkgname=kime
pkgver=0.8.0
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
conflicts=('kime')
provides=('kime')
depends=('gtk3' 'cairo' 'libxcb' 'pango' 'qt5-base')
arch=('any')
license=('GPL3')
source=("${url}/releases/download/v${pkgver}/kime-${pkgver}.7z")
md5sums=('c32d8cb9d10c50eb26c04ca270cad706')

package() {
    install -Dm755 kime-xim -t "${pkgdir}/usr/bin"
    install -Dm755 im-kime.so -t "${pkgdir}/usr/lib/gtk-3.0/3.0.0/immodules"
    install -Dm755 libkimeplatforminputcontextplugin.so -t "${pkgdir}/usr/lib/qt/plugins/platforminputcontexts"
    install -Dm755 libkime_engine.so -t "${pkgdir}/usr/lib"
    install -Dm644 kime_engine.h -t "${pkgdir}/usr/include"
    install -Dm644 config.yaml -t "${pkgdir}/etc/kime"
}

