# Maintainer: czyt <czytcn@gmail.com>
pkgname=openless-bin
pkgver=1.3.7
pkgrel=1
pkgdesc="Hold a key, speak, release — AI-polished text appears at your cursor in any app."
arch=('x86_64')
url="https://github.com/Open-Less/openless"
license=('MIT')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3' 'xdotool')
provides=('openless')
conflicts=('openless')
source_x86_64=("OpenLess_${pkgver}_amd64.deb::https://github.com/Open-Less/openless/releases/download/v${pkgver}-tauri/OpenLess_${pkgver}_amd64.deb")
md5sums_x86_64=('3334950b89845886ffdb8240df041661')

package() {
    local _debfile="OpenLess_${pkgver}_amd64.deb"

    # Extract the deb package
    ar p "${srcdir}/${_debfile}" data.tar.gz | tar xz -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
