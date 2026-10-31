# Maintainer: novica <nnovica@gmail.com>

pkgname=librepaper-bin
pkgver=0.0.61 # renovate: datasource=github-releases depName=LibrePaper/librepaper
pkgrel=1
pkgdesc="A free collaborative writing, editing, and commenting platform"
arch=('x86_64')
url="https://github.com/LibrePaper/librepaper"
license=('MIT')
depends=(
    glibc
    libgcc
    gtk3
    webkit2gtk-4.1
    libsoup3
    glib2
    cairo
    pango
    harfbuzz
    gdk-pixbuf2
    at-spi2-core
    dbus
    hicolor-icon-theme
)
provides=("librepaper=${pkgver}")
conflicts=('librepaper')
options=('!debug' '!strip')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/LibrePaper/librepaper/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/librepaper_${pkgver}_amd64.deb")

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('24e8fce6a0afd334944a8982e1f388dab3e208beb33acaecc4a490819918add0')
sha256sums_x86_64=('daec9d39cd7dce01c3a8503437f48bf2c063104ea5c68dd5e1701b6e44ad1b05')
