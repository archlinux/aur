# Contributor: jmcb <joelsgp@protonmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname='snapshot'
pkgver='44.2'
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
b2sums=('7c260ea2b32d48c3e48d5017cd2a142b0516b7c3d49dfa6586f36b495d2f393b31658e8f38e3b9d540690a2eae17517bef15a4482abc7e1bc13ab7cf97cff90e')

build() {
    arch-meson $pkgname-$pkgver build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
