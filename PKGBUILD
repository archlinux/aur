# Maintainer: Nissar Chababy <funilrys at outlook dot com>

pkgname=encryptic
upstreamName=Encryptic
pkgver=0.0.1
pkgrel=0
pkgdesc="An encryption-focused open source note taking application."
arch=("x86_64" "i686")

url="https://github.com/encryptic-team/encryptic"
license=('MPL2')
source=("${pkgname}.desktop" "https://raw.githubusercontent.com/encryptic-team/encryptic/master/LICENSE")
source_x86_64=("https://github.com/encryptic-team/encryptic/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-x64.zip")
source_i686=("https://github.com/encryptic-team/encryptic/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-ia32.zip")
sha512sums=('595cf6f848f3457e56b67c595f9baa311fa47ccd1fa89c860ab54c4030a829543767c85114c5f050444b4e95e34dd3d8fc57c40ef9759f8b83a0b9c031cfb228' 'c1e3a0c8f5267fb5c0b65733bda037c62d914ed989bee0f510d8196b1029eec00d40f415ce1514a4996d420ba02d856d04db0915b64573ef4a36033cc5efb94e')
sha512sums_x86_64=('b33c001c1184aaebae36fa76736479a196f51456080743eea92962434aacdd1735c621e44574a303c96942ec24d23ea4170cbe1b30dced65b23c06025fcc3439')
sha512sums_i686=('b6938728fef47526a3bb18d9533886782a2a6ebaf59ea46cd72c47e01d706e1ea0f05565fa5546e7e23431016f9c289bf195d5653708e5f097c3cc5991fbe989')


package() {
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/{${pkgname},applications,licenses/${pkgname}}
    
    cp -R ${srcdir}/linux-x64/* ${pkgdir}/usr/share/${pkgname}
    
    install -Dm644 ../${pkgname}.desktop ${pkgdir}/usr/share/${pkgname}
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    
    ln -s /usr/share/${pkgname}/${upstreamName} ${pkgdir}/usr/bin/${pkgname}
}
