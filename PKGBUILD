pkgname=weasis-bin
pkgver=3.0.4
pkgrel=2
pkgdesc="Weasis is a multipurpose DICOM viewer with a highly modular architecture"
arch=('any')
url="https://nroduit.github.io/"
license=('EPL-2.0')
groups=('')
depends=('java-runtime')
options=('!strip' '!emptydirs')
source=('https://netcologne.dl.sourceforge.net/project/dcm4che/Weasis/${pkgver}/weasis-portable.zip'
		'weasis.desktop'
		'weasis.png')
sha512sums=('ddfc88594fa8ae481d1ccc9df8f7db5e8e937ea1744804f80dda1de8037cd7904777fd99503f15da1de2eb772d14420f7691c97d3b1173b7707338e23c5696b7'
			'841a3ee99e73bf84078921e5c2e6d2d751522d93b8d31a76a4db97b2151d9a023f1ec5c08b71f733c39002bd4deed4a3fd7a8db9939fb0b9a865b2aff8cbfa36'
			'1636e497353fb529dcdd8ef20b353b22deccbe70e4ebc56d76f0454459e87d4e5c3ee5d2414d505da0dab27f2dda8b2c1fada32e48f90760c26552845216edb9')

package(){
        mkdir -p $pkgdir/opt
        
        cp -a "${srcdir}" "${pkgdir}/opt/${pkgname}"
        
        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/$pkgname/viewer-linux.sh" "$pkgdir/usr/bin/weasis"

        install -Dm 644 weasis.desktop ${pkgdir}/usr/share/applications/weasis.desktop
        install -Dm644 "${srcdir}/weasis.png" "${pkgdir}/usr/share/pixmaps/weasis.png"
}
