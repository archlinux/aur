# Contributor: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Enes Hecan <nshecan@gmail.com>

_pkgname=WasIstLos
pkgname=${_pkgname,,}
pkgver=1.7.0
pkgrel=1
pkgdesc="An unofficial WhatsApp desktop application for Linux."
url="https://github.com/xeco23/${_pkgname}"
arch=('i686' 'x86_64' 'x86_64_v3' 'armv7h' 'aarch64')
license=('GPL-3.0-only')
conflicts=(
  'whatsapp-for-linux'  # package currently installs as `wasistlos`
)
depends=(
    'intltool'
    'gtkmm3'
    'webkit2gtk'
    'libayatana-appindicator'
    'libcanberra'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-libav'
)
makedepends=(
    'cmake'
    'git'
)
optdepends=(
    'hunspell: spell checking'
    'webkit2gtk-imgpaste: pasting images from clipboard'
)
source=("git+$url#tag=v$pkgver")
b2sums=('1a14e9582654204dea6fe361d8f8e29f1b5b9a5266bfe292f8423df4602364a0c0989c4089ec86ced18c4e292600aa10d8f2b01fa62707c6edfa612aa224d679')

build() {
    cd $_pkgname
    cmake -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir/" install
}
