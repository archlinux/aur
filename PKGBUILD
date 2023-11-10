# Maintainer: Jef Roosens
# Contributor: krazykirby99999 krazykirby99999-at-gmail-dot-com
# Contributor: ajbura, hbarsaiyan

pkgname='cinny-desktop-bin'
pkgver='3.2.1'
pkgrel='1'
pkgdesc='Matrix client focusing primarily on a simple, elegant and secure interface (binary release)'
arch=('x86_64')

url='https://cinny.in/'
license=('MIT')

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
sha256sums_x86_64=('56bb5ff0558f78f77574d3e945b2ed6fd1f3735fdc77036d58b3d301204a509f')
sha512sums_x86_64=('c4f0037ba3c8dc04daee9d2d8f7d68b9683312bec024ccc039b365b947dba3eb7287835e324693dc16f9cac8ad11ccb02948e70fa61f064c3659b7a9902260ee')

install="${pkgname}.install"

package() {
	tar -xzf 'data.tar.gz' -C "${pkgdir}"
}

# vim: ft=bash
