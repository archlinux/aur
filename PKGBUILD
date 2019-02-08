#Maintainer Lukas Becker <lukasbecker2 [at] [common mail ending from the company behind the most used search engine]>

pkgbase=zenkit
pkgname=zenkit
pkgver=1.1.0
pkgrel=1
pkgdesc='A platform for collaboration and project management'
arch=('x86_64')
url='https://zenkit.com'
license=('Commercial')
provides=('zenkit')
options=('!strip')
source=("https://static.zenkit.com/downloads/zenkit-linux.tar.gz"
        'zenkit.desktop')
sha256sums=('539f6237418491ca70954bbea3b2bb272c11c69f1c2fcead2b51e7520e52b85c'
            'fcb457439946044f52d03ffe2b8b2cc214f836fb8a53beb0d92c58596517960f')
package() {

    install -d -m 755 "${pkgdir}/opt/"
    install -d -m 755 "${pkgdir}/usr/bin/"
    install -d -m 755 "${pkgdir}/usr/share/applications/"
    
    install -D -m 644 "${srcdir}/${pkgbase}.desktop" "${pkgdir}/usr/share/applications/"
    
    mkdir "${pkgdir}/opt/${pkgbase}"
    tar xpf zenkit-linux.tar.gz -C "${pkgdir}/opt/${pkgbase}/" --strip-components=1
    
    ln -s "/opt/${pkgbase}/${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}
