#Maintainer Lukas Becker <lukasbecker2 [at] [common mail ending from the company behind the most used search engine]>

pkgbase=zenkit
pkgname=zenkit
pkgver=1.3.0
pkgrel=1
pkgdesc='A platform for collaboration and project management'
arch=('x86_64')
url='https://zenkit.com'
license=('Commercial')
depends=('gconf')
provides=('zenki')
options=('!strip')
source=('https://static.zenkit.com/downloads/zenkit-linux.tar.gz'
        'https://zenkit.com/favicon.ico'
	'zenkit.desktop')
sha256sums=('72593b57f932cf1b8f832f36f0a1b6b57db03034d1a0e4250e859d7551bace68'
            'SKIP'
            '410baee466b84185485c16f525d181efa3287152fd12115b13b9037f31599b5c')
package() {

    install -d -m 755 "${pkgdir}/opt/"
    install -d -m 755 "${pkgdir}/usr/bin/"
    install -d -m 755 "${pkgdir}/usr/share/applications/"
    
    install -D -m 644 "${srcdir}/${pkgbase}.desktop" "${pkgdir}/usr/share/applications/"

    mkdir "${pkgdir}/opt/${pkgbase}"

    tar xpf zenkit-linux.tar.gz -C "${pkgdir}/opt/${pkgbase}/" --strip-components=1
    mv favicon.ico "${pkgdir}/opt/${pkgbase}/zenkit.ico" 

    ln -s "/opt/${pkgbase}/${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}
