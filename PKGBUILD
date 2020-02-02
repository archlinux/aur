#Maintainer Lukas Becker <lukasbecker2 [at] [common mail ending from the company behind the most used search engine]>

pkgbase=zenkit
pkgname=zenkit
pkgver=20191122
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
sha512sums=('e810c05294ef4f66412437f85ebf7be87d811323f0c03fc471723993e6745bb98682df8014e58e34d681564e1b65fa47f109827e00e6480fb34fa6035d63515a'
            'a3f959cae3d586070b6ba1d018278251f4fae3cabd5f65a988bf98c8f5c0aee654e6f8c06b52df460bb0c1d60a98e3760914dcdf39d6a69541877eb8d9b45412'
            '5b824efd2de3d8b213d850b5b1b2920583c7b2b9c25e77667b041aa65f97b368c6da888cc4ae700d11fa336a9668ddfe2ad062caa4ce1af83dfbf50fa4c103fb')
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
