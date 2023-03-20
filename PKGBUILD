# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=flaresolverr-bin
_pkgname=flaresolverr
__pkgname=FlareSolverr
pkgver=3.1.0
pkgrel=1
pkgdesc='A proxy server to bypass Cloudflare protection'
arch=('x86_64')
url='https://github.com/FlareSolverr/FlareSolverr'
license=('MIT')
depends=('glibc' 'zlib')
conflicts=('flaresolverr' 'flaresolverr-git')
options=('!strip')
install='flaresolverr.install'
source=("https://github.com/${__pkgname}/${__pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_x64"
        "https://raw.githubusercontent.com/${__pkgname}/${__pkgname}/v${pkgver}/LICENSE"
        "flaresolverr.service"
        "flaresolverr.sysusers"
        "flaresolverr.tmpfiles"
        "flaresolverr.install")
sha512sums=('73afaddfaf250302542a7d47129e4abca1d9d4bb7441ffb30c1c5ed557211f9329761005ae6b5dd5b62fabca6d47deb3e969540f09aabcbd6e0c0daee1c05931'
            'ea3aa3af56f503faa7cae884748386ddd87aa7887d1dd3ec010270510c6b477a2627efde3ebddaf60f414d0a5eb34964464c212219cd5423efd0303a7055fc54'
            '69a303809fd373fed0faa2ce33529ab8cdcf155e40ba430b4a6be32f4956d1fded431db45eb245154e64bd9f1c7ff616a4d0ab0f5aef477553ef312ee7dc297e'
            '0423d10d964a187e5a153140597e7cee3a6112bf6569dfcda7848bfbce4e5660534db3bdbe4a4de9a63fbf0ecc2b874937afd94495691f76176243d2ac4b080d'
            'd4906b43f057019751869377cf953f2a406399b661d2d0217fbc56fdd29ab534ba71be1ba270e14adeedd743fbb0d7ca91a4593577615517f46e124a54de647e'
            'e12ca34e2f66524d15da36cdebea300ae061a16c8a4d7147ab0cea11cb70879d0d3061c9c852dec9593f348bc8507055f1868cfe754e2e5f92db4466ca3ec2a1')

package() {
    cd "${srcdir}"

    install -Dm755 "flaresolverr_linux_x64" "${pkgdir}/usr/bin/flaresolverr"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "flaresolverr.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

    install -Dm644 "flaresolverr.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "flaresolverr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
