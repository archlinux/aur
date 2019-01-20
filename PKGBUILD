# Maintainer: Peven Phoon <iampeven@gmail.com>

pkgname=rrshareweb
pkgver=1.0.0
pkgrel=1
pkgdesc="YYeTs web remote management edition for Linux, 人人影视WEB远程管理版客户端"
arch=('x86_64')
url="http://app.rrysapp.com/"
install=$pkgname.install
license=('MIT')

source=("rrshareweb-v${pkgver}-${pkgrel}.tar.gz::https://github.com/iPeven/rrshareweb/releases/download/v${pkgver}-${pkgrel}/rrshareweb-v${pkgver}-${pkgrel}.tar.gz"
"rrshareweb"
"LICENSE")

sha256sums=('4538b82bd8cb2e79b5e91448107b089d948efb631f8271852036e39dce8631c6'
            '33b1ca11fe5d2c265a9dcb89ffb0559d143ab0d02205cab6fb4feb26840b32ee'
            'ec6068d69242cc4955e5754cfd092c0764e4b2fe27c0c386270f5ca3b94fe687')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/opt/rrshareweb/conf"
    mkdir -p "${pkgdir}/opt/rrshareweb/web"
    
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}-${pkgrel}/rrshareweb" "${pkgdir}/opt/rrshareweb/rrshareweb"
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}-${pkgrel}/p4pclient" "${pkgdir}/opt/rrshareweb/p4pclient"
    cp -r   "${srcdir}/${pkgname}-v${pkgver}-${pkgrel}/conf/" "${pkgdir}/opt/rrshareweb/"
    cp -r   "${srcdir}/${pkgname}-v${pkgver}-${pkgrel}/web/" "${pkgdir}/opt/rrshareweb/"
    chmod -R a+w ${pkgdir}/opt/rrshareweb/conf/
    install -Dm644 "${srcdir}/${pkgname}-v${pkgver}-${pkgrel}/readme.txt" "${pkgdir}/opt/rrshareweb/readme.txt"
    install -Dm755 rrshareweb "${pkgdir}/usr/bin/rrshareweb"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=4 sw=4 et:
