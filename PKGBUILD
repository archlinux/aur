# Contributor: James Thomas <codeactor at protonmail dot com>
pkgname=piptube
pkgver=1.0.2
pkgrel=1
pkgdesc="Picture-in-picture wrapper for mpv and YouTube"
arch=('any')
url="https://github.com/jgthomas/piptube"
license=('GPL3')
depends=('mpv' 'youtube-dl')
source=("piptube" "ytubejb" "https://github.com/jgthomas/piptube/archive/v1.0.2.tar.gz")    
sha512sums=('facaf51e7c8de9df1c87430fc5dc85ea8ff63258c64ae297918261b6dcbe2861a9891621aaffdf6bb64dd890647d18c60243fcac6e93e120e36f85d79b91bde6'
            '1b0e06a51741db6a5f4f0cb06ca27669de8f63785db9d1d49cbf122d2b03dbcee0173a13d351deeae410f22a53a10ce947b695ab40aef96273d6a1fc35a1f875'
            'f1cc19026bfffd619a79b2089b75ce179743e0c6fae08aafc19cc1adbac0f9eff62fd98105dd7b22f439840eacfaab1d960f513c33064d84184a938af0ad4b28')


package() {

        install -dm755 "${pkgdir}/usr/bin"
        install -dm755 "${pkgdir}/usr/lib/${pkgname}"
        
        install -m644 "${srcdir}/${pkgname}-${pkgver}/piptube.py" "${pkgdir}/usr/lib/${pkgname}/piptube.py"
        install -m644 "${srcdir}/${pkgname}-${pkgver}/ytubejb.py" "${pkgdir}/usr/lib/${pkgname}/ytubejb.py"
        install -m644 "${srcdir}/${pkgname}-${pkgver}/config.py" "${pkgdir}/usr/lib/${pkgname}/config.py"

        install -m644 "${srcdir}/piptube" "${pkgdir}/usr/bin/piptube"
        chmod +x "${pkgdir}/usr/bin/piptube"

        install -m644 "${srcdir}/ytubejb" "${pkgdir}/usr/bin/ytubejb"
        chmod +x "${pkgdir}/usr/bin/ytubejb"

        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
}
