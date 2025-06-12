# Maintainer:
# Contributor: vinfehring <vinfehring at gmail dot com>
# Contributor: Fhilipe Coelho <fhilipecoelho.dev@gmail.com>

pkgname=hydra-launcher-bin
pkgver=3.6.1
pkgrel=1
pkgdesc="A game launcher with its own embedded bittorrent client"
arch=('x86_64')
url="https://github.com/hydralauncher/hydra"
license=('MIT')
provides=("${pkgname%-bin}")
depends=('alsa-lib'
         'at-spi2-core'
         'bash'
         'cairo'
         'dbus'
         'expat'
         'gcc-libs'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gtk3'
         'hicolor-icon-theme'
         'libcups'
         'libdrm'
         'libx11'
         'libxcb'
         'libxcomposite'
         'libxdamage'
         'libxext'
         'libxfixes'
         'libxkbcommon'
         'libxrandr'
         'libxrender'
         'mesa'
         'nspr'
         'nss'
         'pango'
         'zlib')
options=('!strip')
source=("${url}/releases/download/v${pkgver}/hydralauncher_${pkgver}_amd64.deb"
        "${pkgname}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
sha256sums=('8ce25fc27cc16ac6221235e26756f5605140b53b1ed4567ef8a4374ae59c7256'
            '32619612c2e0223e86c4908747ec14bef64c3c423fee80910c1aa944769b66f9')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/Hydra/hydralauncher -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

