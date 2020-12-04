# Maintainer: Chris Winkler <quidnovum [at] [common mail ending from search engine company]>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Lukas Becker <lukasbecker2 [at] [common mail ending from the company behind the most used search engine]>

pkgbase=zenkit
pkgname=zenkit
pkgver=20201204
pkgrel=1
pkgdesc='A platform for collaboration and project management'
arch=('x86_64')
url='https://zenkit.com'
license=('Commercial')
depends=('gconf')
provides=('zenki')
options=('!strip')
source=('https://static.zenkit.com/downloads/desktop-apps/base/zenkit-base-linux.tar.gz'
        'https://zenkit.com/favicon.ico'
	'zenkit.desktop')
sha512sums=('af50d4d0bc2710aba929389d5b0186ec2fa8669d8cdb2fa2d2ebedc426988ddceeaaf0054b039d74c2ab9d6f7519e666911a77f578c12db093f2b89eb09e3ff4'
            '58137e4f6f50baae693a48ec2f6f0112abf62d28287e3fec86289d20aac77a023373fe23514e32cab463e298679995f68a545d8f1c8f260ce57020b6873d7811'
            '5b824efd2de3d8b213d850b5b1b2920583c7b2b9c25e77667b041aa65f97b368c6da888cc4ae700d11fa336a9668ddfe2ad062caa4ce1af83dfbf50fa4c103fb')
package() {

    install -dm755 "${pkgdir}/opt/"
    install -dm755 "${pkgdir}/usr/bin/"
    install -dm755 "${pkgdir}/usr/share/applications/"
    
    install -Dm644 "${srcdir}/${pkgbase}.desktop" "${pkgdir}/usr/share/applications/"

    mkdir "${pkgdir}/opt/${pkgbase}"

    tar xpf zenkit-base-linux.tar.gz -C "${pkgdir}/opt/${pkgbase}/" --strip-components=1
    mv favicon.ico "${pkgdir}/opt/${pkgbase}/zenkit.ico" 

    ln -s "/opt/${pkgbase}/${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}
