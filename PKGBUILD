# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Jef Roosens
# Contributor: krazykirby99999 krazykirby99999-at-gmail-dot-com
# Contributor: ajbura, hbarsaiyan

pkgname='cinny-desktop-bin'
pkgver='4.10.2'
pkgrel='1'
pkgdesc='Matrix client focusing primarily on a simple, elegant and secure interface (binary release)'
arch=('x86_64')

url='https://cinny.in/'
license=('AGPL-3.0')

# https://tauri.studio/v1/guides/getting-started/prerequisites#1-system-dependencies
depends=(
    'webkit2gtk'
    'openssl-1.1' # Binary release is currently still built using OpenSSL 1.1.1
    'gtk3'
    'appmenu-gtk-module'
    'libappindicator-gtk3'
    'librsvg'
    'libvips'
    'sqlite'
    'gst-plugins-good'
)
conflicts=('cinny-desktop')
provides=('cinny-desktop')

source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/cinnyapp/cinny-desktop/releases/download/v${pkgver}/Cinny_desktop-x86_64.deb")
sha256sums_x86_64=('693c0bba3c53341cc4f7a1d316d6d7862021431fd5c10207194794ffcf017fd8')

install="${pkgname}.install"

package() {
    tar -xzf 'data.tar.gz' -C "${pkgdir}"
}
