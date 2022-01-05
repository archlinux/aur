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
        'e1944018119584495d480b74e745fb1ddd8d2e6c33d72b8f185bda406b680331e71549259ae7c2f3dd5c93631c2f3156df75d95376d00c07c4f40cfe6d48b81e')

prepare() {
    cd $pkgname
    patch -Np1 -i ../radiotray-gi.patch
}

package() {
    cd $pkgname
    python setup.py install --root="$pkgdir" --optimize=1
}
