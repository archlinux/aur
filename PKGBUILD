# Maintainer: riey <creeper844@gmail.com>
pkgname=kime
pkgver=0.9.0
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
conflicts=('kime')
provides=('kime')
arch=('any')
license=('GPL3')
source=("${url}/releases/download/v${pkgver}/kime-${pkgver}.7z")
md5sums=('2524484db391747725a10ce2db143b45')

package() {
    install -Dm755 kime-xim -t "${pkgdir}/usr/bin"
    install -Dm755 kime-wayland -t "${pkgdir}/usr/bin"
    install -Dm755 libkime-gtk2.so -T "${pkgdir}/usr/lib/gtk-2.0/2.10.0/immodules/im-kime.so"
    install -Dm755 libkime-gtk3.so -T "${pkgdir}/usr/lib/gtk-3.0/3.0.0/immodules/im-kime.so"
    install -Dm755 libkime-gtk4.so -t "${pkgdir}/usr/lib/gtk-3.0/4.0.0/immodules"
    install -Dm755 libkime-qt5.so -T "${pkgdir}/usr/lib/qt/plugins/platforminputcontexts/libkimeplatforminputcontextplugin.so"
    install -Dm755 libkime-qt6.so -T "${pkgdir}/usr/lib/qt6/plugins/platforminputcontexts/libkimeplatforminputcontextplugin.so"
    install -Dm755 libkime_engine.so -t "${pkgdir}/usr/lib"
    install -Dm644 kime_engine.h -t "${pkgdir}/usr/include"
    install -Dm644 config.yaml -t "${pkgdir}/etc/kime"
}

