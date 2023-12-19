# Maintainer: Benedikt Rips <benedikt.rips@gmail.com>
# Contributor: Chris Winkler <quidnovum [at] [common mail ending from search engine company]>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Lukas Becker <lukasbecker2 [at] [common mail ending from the company behind the most used search engine]>

pkgname=zenkit
pkgver=20231211
pkgrel=1
pkgdesc='A platform for collaboration and project management'
arch=('x86_64')
url='https://zenkit.com'
license=('unknown')
depends=('gtk3' 'nss')
optdepends=('xdg-utils: for opening links, e.g. for logging in via 3rd party accounts')
source=('https://static.zenkit.com/downloads/desktop-apps/base/zenkit-base-linux.tar.gz'
        'https://zenkit.com/wp-content/uploads/2020/03/zenkit_base-2-1.png'
        'zenkit.desktop')
sha512sums=('fd8def2833e1427b0c2841d50d6a36cd731c54ac667b51a382479117d4acc2b29ec1a73423c4e7ffeb1864d0a7974dbac13a19e469d97da8288d7ee822e8b77d'
            'f55e818a456fbb96db1c133a7aeb9c039e40a8abfb8b64f33aada31c9a965a2818a0fb6dabcc2ff1424e6eb781befa6df738c42110f55a96e1970f6a3a27ba0a'
            '5b824efd2de3d8b213d850b5b1b2920583c7b2b9c25e77667b041aa65f97b368c6da888cc4ae700d11fa336a9668ddfe2ad062caa4ce1af83dfbf50fa4c103fb')

package() {
    install -dm755 "${pkgdir}/opt"
    cp -a zenkit-base-linux "${pkgdir}/opt/${pkgname}"
    install -Dm644 zenkit_base-2-1.png "${pkgdir}/opt/${pkgname}/${pkgname}.ico"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
