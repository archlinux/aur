# Maintainer: czyt <czytcn@gmail.com>
pkgname=openless-bin
pkgver=1.3.14
pkgrel=1
pkgdesc="Hold a key, speak, release — AI-polished text appears at your cursor in any app."
arch=('x86_64')
url="https://github.com/Open-Less/openless"
license=('MIT')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3' 'xdotool')
provides=('openless')
conflicts=('openless')
source_x86_64=("OpenLess_${pkgver}_amd64.deb::https://github.com/Open-Less/openless/releases/download/v${pkgver}-tauri/OpenLess_${pkgver}_amd64.deb")
md5sums_x86_64=('aa6dea6ad02976c9a0bc8bf6443e6896')

package() {
    local _debfile="OpenLess_${pkgver}_amd64.deb"

    # Extract the deb package
    ar p "${srcdir}/${_debfile}" data.tar.gz | tar xz -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
