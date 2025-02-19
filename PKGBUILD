# Maintainer: Dawid Ciechomski <dawid[at]omgit.pl>
# Maintainer: Benedikt Rips <benedikt.rips@gmail.com>
# Contributor: Chris Winkler <quidnovum [at] [common mail ending from search engine company]>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Lukas Becker <lukasbecker2 [at] [common mail ending from the company behind the most used search engine]>

pkgname="zenkit"
pkgfile="${pkgname}-linux.tar.gz"
pkgicon="${pkgname}.ico"
pkgdesk="${pkgname}.desktop"
pkgfoldername="${pkgname}-linux"
pkgver=3.1.1
pkgrel=3
pkgdesc='A platform for collaboration and project management'
arch=('x86_64')
url='https://zenkit.com'
license=('Unknown')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
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
    'mesa'
    'nspr'
    'nss'
    'pango'
)
optdepends=("xdg-utils: for opening links, e.g. for logging in via 3rd party accounts")
source=("https://static.zenkit.com/downloads/desktop-apps/base/${pkgfile}"
        "${pkgicon}::https://zenkit.com/wp-content/uploads/2020/03/zenkit_base-2-1.png"
        "zenkit.desktop")
sha512sums=('f9b6f2d46969c249b648a11a53063f47623432045f183c79a6e9b65f21245c06a2546262302f19aea75251b1ad94c81633082081380244004151d761202a20f2'
            'f55e818a456fbb96db1c133a7aeb9c039e40a8abfb8b64f33aada31c9a965a2818a0fb6dabcc2ff1424e6eb781befa6df738c42110f55a96e1970f6a3a27ba0a'
            '5b824efd2de3d8b213d850b5b1b2920583c7b2b9c25e77667b041aa65f97b368c6da888cc4ae700d11fa336a9668ddfe2ad062caa4ce1af83dfbf50fa4c103fb'
            )
package() {
    install -dm755 "${pkgdir}/opt"
    cp -a "${pkgfoldername}/." "${pkgdir}/opt/${pkgname}/"
    install -Dm644 "${pkgicon}" "${pkgdir}/opt/${pkgname}/${pkgicon}"
    install -Dm644 "${pkgdesk}" "${pkgdir}/usr/share/applications/${pkgdesk}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}