# Maintainer: Jef Roosens
# Contributor: krazykirby99999 krazykirby99999-at-gmail-dot-com
# Contributor: ajbura, hbarsaiyan

pkgname='cinny-desktop-bin'
pkgver='4.2.1'
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
sha256sums_x86_64=('a24d1008aa6ed8186c8a20b95e184632ed4a9b2f26504132e016caab99e0c160')
sha512sums_x86_64=('97c5d46bc96ebd8cdd630d952a6fdafde55d77562b67e28adfe3826b508d62bf353e69e00273422ff1661480cba62e1e885b88d47d0aba3bf71e2284874c2e5a')

install="${pkgname}.install"

package() {
	tar -xzf 'data.tar.gz' -C "${pkgdir}"
}

# vim: ft=bash
