# Contributor: jmcb <joelsgp@protonmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname='snapshot'
pkgver='45.beta'
pkgrel=1
pkgdesc='Take pictures and videos on your computer, tablet, or phone'
arch=('x86_64' 'aarch64')
url='https://gitlab.gnome.org/GNOME/Incubator/snapshot'
license=('GPL3')
depends=(
    'glib2'
    'gst-plugin-pipewire'
    'gst-plugins-bad'
    'gst-plugins-base'
    'gst-plugins-good'
    'gstreamer'
    'gtk4'
    'libadwaita'
    'pipewire'
    'xdg-desktop-portal'
)
makedepends=(
    'meson'
    'cargo'
    'clang'
)
source=("$url/-/archive/$pkgver/snapshot-$pkgver.tar.gz")
b2sums=('1fc864f0dd1308a1e40d919b5121634b61bbaf2c770260ab930f1e8068b4c405374eceba4a330db854c43f1b4d1cb4427f6f36a57a30a0062a49a71348133240')

build() {
    arch-meson $pkgname-$pkgver build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
