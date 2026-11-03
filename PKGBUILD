# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=backslash-app
_basename=backslash
pkgname=${_basename}-bin
pkgver=0.7.0
pkgrel=2
pkgdesc="A fast, extensible launcher for Linux"

license=('MIT')
arch=('x86_64' 'aarch64')
url="https://github.com/backslash-app/backslash"

conflicts=("${_basename}")
provides=("${_basename}")

makedepends=('tar')
depends=('glibc' 'libgcc' 'gtk4' 'glib2' 'git' 'python' 'gdk-pixbuf2' 'pango' 'graphene' 'hicolor-icon-theme')
optdepends=('bubblewrap: Sandbox for non-TypeScript extensions'
            'gtk4-layer-shell: Overlay on wlroots compositors'
            'wl-clipboard: Clipboard history on Wayland'
            'libsecret: Keyring for extension secrets'
            'wmctrl: Window switcher on X11'
            'fd: Faster file search')

options=('!strip' '!debug')

source_x86_64=("https://github.com/${_author}/${_basename}/releases/download/v${pkgver}/${_basename}_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/${_author}/${_basename}/releases/download/v${pkgver}/${_basename}_${pkgver}_arm64.deb")
sha256sums_x86_64=('3a788beda7ac896cfffeed250b2d807ef972502d7b998ee5833e0482bd20b13d')
sha256sums_aarch64=('761c5ce161cb3287273a7e8ef23b11c3fc5e12c9d9ebe12db19097ec48c2efe4')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"

    # licence
    mv "${pkgdir}/usr/share/licenses/${_basename}" "${pkgdir}/usr/share/licenses/${pkgname}"
} 
