# Maintainer: Ravyar <ravyar.tahir@ravarage.xyz>
# Contributor: Daniel Poellmann <aur@<lastname><firstname>.de>
# Contributor: Dusan Saiko <dusan at saiko dot cz>

_pkgname='kreya'
pkgname="${_pkgname}-bin"
pkgver=1.20.1
pkgrel=1
pkgdesc='GUI client for gRPC and REST APIs'
arch=('x86_64')
url='https://kreya.app/'
license=('custom')

depends=(
  'hicolor-icon-theme'
  'gtk3'
  'webkit2gtk-4.1'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxi'
  'libxrandr'
  'libxrender'
  'libxtst'
  'alsa-lib'
  'at-spi2-core'
  'dbus'
  'glib2'
  'libcups'
  'nss'
  'pango'
)

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://stable-downloads.kreya.app/${pkgver}/Kreya-app-linux-x64.tar.gz")
sha256sums=('fa22ac7e973a310915bf6d0faef6fd2fa60717827a09a470f81eade0276209fd')

options=("!strip")

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/lib"
    mkdir -p "${pkgdir}/usr/share"

    cp -r "${srcdir}/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/lib/." "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/share/." "${pkgdir}/usr/share/"

    install -Dm0644 "${srcdir}/share/licenses/app.kreya.Kreya/kreya.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
