# Maintainer: Jonathon Fernyhough <jonathon+at m2x.dev>
# Contributor: Yarema aka Knedlyk <yupadmin@gmail.com>
# Contributor: zoe <chp321 [at] gmail [dot] com>

pkgname=radiotray
pkgver=0.7.3
pkgrel=16
pkgdesc="An online radio streaming player that runs on a Linux system tray."
arch=(any)
url="https://radiotray.wordpress.com/"
license=(GPL)
depends=('dbus-python' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good'
         'python-gobject' 'python-lxml' 'python-notify2' 'python-pyxdg')
makedepends=('git')
optdepends=('gst-plugins-bad: extra codec support'
            'gst-plugins-ugly: extra codec support'
            'gst-libav: nonfree media decoding'
            'libappindicator-gtk3: indicator applet support')
source=(git+https://github.com/lubosz/radiotray.git#commit=0303ad6017a9a81caa71d046ef270ba6ebefed39
        radiotray-gi.patch::https://github.com/lubosz/radiotray/pull/16.patch)

b2sums=('SKIP'
        'b710bcc453a41c09b74a827209b9931932d57efadfa7d4bb17cd01dcce6d41e4859b338d8a981830fcdbac0162206ee11c4866ff409e47b58234fb13e2b0294b')

prepare() {
    cd $pkgname
    patch -Np1 -i ../radiotray-gi.patch
}

package() {
    cd $pkgname
    python setup.py install --root="$pkgdir" --optimize=1
}
