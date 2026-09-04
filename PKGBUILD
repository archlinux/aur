# Maintainer:
# Contributor: vinfehring <vinfehring at gmail dot com>
# Contributor: Fhilipe Coelho <fhilipecoelho.dev@gmail.com>

pkgname=hydra-launcher-bin
pkgver=4.1.3
pkgrel=1
pkgdesc="Hydra Launcher is an open-source gaming platform created to be the single tool that you need in order to manage your gaming library."
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
sha256sums=('2c69e437143c680f124c967259eedcb3314f2681e7f6d69f03a30799582d80ae'
            '32619612c2e0223e86c4908747ec14bef64c3c423fee80910c1aa944769b66f9')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/Hydra/hydralauncher -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

