# Maintainer: riey <creeper844@gmail.com>
pkgname=kime
pkgver=1.0.0.pre2
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
conflicts=('kime')
provides=('kime')
arch=('any')
license=('GPL3')
source=("${url}/releases/download/v1.0.0-pre2/kime-v1.0.0-pre2.7z")
md5sums=('fefbb6124b4d01a964d57db238e2ddf9')

package() {
    install -Dm755 kimed -t "${pkgdir}/usr/bin"
    install -Dm755 kime-xim -t "${pkgdir}/usr/bin"
    install -Dm755 kime-wayland -t "${pkgdir}/usr/bin"
    install -Dm755 libkime-gtk2.so -T "${pkgdir}/usr/lib/gtk-2.0/2.10.0/immodules/im-kime.so"
    install -Dm755 libkime-gtk3.so -T "${pkgdir}/usr/lib/gtk-3.0/3.0.0/immodules/im-kime.so"
    install -Dm755 libkime-gtk4.so -t "${pkgdir}/usr/lib/gtk-3.0/4.0.0/immodules"
    install -Dm755 libkime-qt5.so -T "${pkgdir}/usr/lib/qt/plugins/platforminputcontexts/libkimeplatforminputcontextplugin.so"
    install -Dm755 libkime-qt6.so -T "${pkgdir}/usr/lib/qt6/plugins/platforminputcontexts/libkimeplatforminputcontextplugin.so"
    install -Dm755 libkime_engine.so -t "${pkgdir}/usr/lib"
    install -Dm644 kime_engine.h -t "${pkgdir}/usr/include"
    install -Dm644 default_config.yaml -T "${pkgdir}/etc/kime/config.yaml"
    install -Dm644 kime-eng-64x64.png -t "${pkgdir}/usr/share/kime"
    install -Dm644 kime-han-64x64.png -t "${pkgdir}/usr/share/kime"
}

