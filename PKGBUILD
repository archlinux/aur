# Maintainer: Cha14ka <cha14ka@yandex.ru>
pkgbase=augvk
pkgname=augvk
pkgver=1.0
pkgrel=1
pkgdesc="AugVK - VKontakte messenger written on Python/QT6 with support of responsive design and touchscreens."
arch=('any')
url="https://github.com/Augmeneco/AugBK-Messenger"
license=('GPL3')
depends=('python-pyqt6' 'python-requests' 'python-pyqt6-webengine')
source=("git+https://github.com/Augmeneco/AugBK-Messenger")
md5sums=('SKIP')

prepare() {
    cd AugBK-Messenger
    git checkout python

    mkdir -p $HOME/.local/share/augvk
    mkdir -p $HOME/.local/share/applications

    cp *.py $HOME/.local/share/augvk/
    cp augvk.desktop $HOME/.local/share/applications/
    cp -r data $HOME/.local/share/augvk/
}

package() {
    cd AugBK-Messenger

    mkdir -p $pkgdir/usr/share/pixmaps/
    cp logo.png $pkgdir/usr/share/pixmaps/augvk.png
    install -Dm0755 augvk "$pkgdir/usr/bin/augvk"
}
