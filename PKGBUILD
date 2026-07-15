# Maintainer: czyt <czytcn@gmail.com>
pkgname=read-aware-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="A local-first, AI-native reader that turns books, highlights, notes, and conversations into durable context"
arch=('x86_64')
url="https://github.com/ahpxex/read-aware"
license=('MIT')
options=('!debug')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'libgcc'
    'libsoup3'
    'webkit2gtk-4.1'
)
provides=('read-aware')
conflicts=('read-aware')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/ahpxex/read-aware/v${pkgver}/LICENSE")
source_x86_64=("ReadAware_${pkgver}_amd64.deb::https://github.com/ahpxex/read-aware/releases/download/v${pkgver}/ReadAware_${pkgver}_amd64.deb")
sha256sums=('40e7f8c7b6b6731ce608e9650911192c297e3d29ef44b873b80c4565ba60f8ed')
sha256sums_x86_64=('1378ebd4a8ede3a0474165ce65eac78b7fab0b20d197797f19417f2fb8cad475')

package() {
    ar p "${srcdir}/ReadAware_${pkgver}_amd64.deb" data.tar.gz | tar xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    chmod -R u=rwX,go=rX "${pkgdir}"
}
