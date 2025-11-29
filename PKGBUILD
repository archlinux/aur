# Maintainer: Rooki <aur at rooki dot xyz>
# Contributor: Kainoa Kanter <kainoa@t1c.dev>
# Based on:
# - https://aur.archlinux.org/packages/anytype-electron-bin
# - https://aur.archlinux.org/packages/element-desktop-nightly-bin

pkgname=anytype-alpha-bin
_pkgname=anytype
_truetag="-alpha" # Usually -alpha, but sometimes they do the next version as -beta ( blank is stable, this package only updates for alpha/beta versions ) which is weird
pkgver=0.51.13
pkgrel=1
pkgdesc="Operating environment for the new internet. Anytype is a next generation software that breaks down barriers between applications, gives back privacy and data ownership to users."
arch=('x86_64')
url="https://github.com/anyproto/anytype-ts"
license=('custom')
depends=(bash glibc gcc-libs libsecret glib2 hicolor-icon-theme)
optdepends=('org.freedesktop.secrets: for not having to sign in each time')
provides=('anytype')
conflicts=('anytype'
           'anytype-legacy'
           'anytype-electron-bin'
           'anytype-bin')
source=(
	"https://github.com/anyproto/anytype-ts/releases/download/v${pkgver}${_truetag}/anytype_${pkgver}${_truetag}_amd64.deb"
	"https://raw.githubusercontent.com/anyproto/anytype-ts/refs/tags/v${pkgver}${_truetag}/LICENSE.md"
)
sha256sums=('387bc13073a8233bb2312f4301677b7f704770cc6ec272589f53a57c681a5208'
            'daad9eb95adc6262b07115ba2cf87cd4c64acaca4b45d48e0fd3b15a72a31dc1')

package() {
    cd "${pkgdir}"
    tar -xf "${srcdir}/data.tar.xz"
    install -Dm644 "${srcdir}"/LICENSE.md -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
