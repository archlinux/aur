# Maintainer: Jef Roosens
# Contributor: krazykirby99999 krazykirby99999-at-gmail-dot-com
# Contributor: ajbura, hbarsaiyan

pkgname='cinny-desktop-bin'
pkgver='2.2.4'
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
sha256sums_x86_64=('89b51734681cdb79dd4ea40a0f49e9e441f54f7c62a550261136c8cbb6a4aa48')
sha512sums_x86_64=('ae38db21b99e59fbace311fde7c2c33856f061c6782ec7779e169853f6fb8fea21be69b84eab65049cb987ab2b04d57a8f57465121e0c339fac2a0c1f2722e9b')

install="${pkgname}.install"

package() {
	tar -xzf 'data.tar.gz' -C "${pkgdir}"
}

# vim: ft=bash
