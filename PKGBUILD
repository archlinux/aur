# Maintainer: Chris Winkler <quidnovum [at] [common mail ending from search engine company]>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Lukas Becker <lukasbecker2 [at] [common mail ending from the company behind the most used search engine]>
# Contributor: Benedikt Rips <benedikt.rips@gmail.com>

pkgname=zenkit
pkgver=20211006
pkgrel=1
pkgdesc='A platform for collaboration and project management'
arch=('x86_64')
url='https://zenkit.com'
license=('unknown')
depends=('gtk3' 'nss')
optdepends=('xdg-utils: for opening links, e.g. for logging in via 3rd party accounts')
source=('https://static.zenkit.com/downloads/desktop-apps/base/zenkit-base-linux.tar.gz'
        'https://zenkit.com/favicon.ico'
        'zenkit.desktop')
sha512sums=('add216e5ac5161c702e801fe035f0cb4a36f27f3420544c728b20b87c193324a236606590478029ab22fe82115abf298ee9703bb5b8a8efea8846d4c09995c7a'
            '58137e4f6f50baae693a48ec2f6f0112abf62d28287e3fec86289d20aac77a023373fe23514e32cab463e298679995f68a545d8f1c8f260ce57020b6873d7811'
            '5b824efd2de3d8b213d850b5b1b2920583c7b2b9c25e77667b041aa65f97b368c6da888cc4ae700d11fa336a9668ddfe2ad062caa4ce1af83dfbf50fa4c103fb')

package() {
    install -dm755 "${pkgdir}/opt"
    cp -a zenkit-base-linux "${pkgdir}/opt/${pkgname}"
    install -Dm644 favicon.ico "${pkgdir}/opt/${pkgname}/${pkgname}.ico"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
