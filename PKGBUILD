pkgname=weasis-bin
pkgver=3.5.3
pkgrel=2
pkgdesc="Weasis is a multipurpose DICOM viewer with a highly modular architecture"
arch=('any')
url="https://nroduit.github.io/"
license=('EPL-2.0')
groups=('')
depends=('java-runtime')
options=('!strip' '!emptydirs')
source=("https://github.com/nroduit/Weasis/releases/download/v3.5.3/weasis_3.5.3_amd64.deb"
		'weasis.desktop'
		'weasis.png')
sha512sums=('167f72c210aedf4758c700ca85d6def4320776a3d9f171665dc54201d1ea0e9d2d1289c749935d5fe484af0747f57400189b5bbd473d06a2230693b98049d655'
			'841a3ee99e73bf84078921e5c2e6d2d751522d93b8d31a76a4db97b2151d9a023f1ec5c08b71f733c39002bd4deed4a3fd7a8db9939fb0b9a865b2aff8cbfa36'
			'1636e497353fb529dcdd8ef20b353b22deccbe70e4ebc56d76f0454459e87d4e5c3ee5d2414d505da0dab27f2dda8b2c1fada32e48f90760c26552845216edb9')
		
package(){
        tar -xJC "${pkgdir}" -f data.tar.xz
        
        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/Weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"

        install -Dm 644 weasis.desktop ${pkgdir}/usr/share/applications/weasis.desktop
        install -Dm644 "${srcdir}/weasis.png" "${pkgdir}/usr/share/pixmaps/weasis.png"
}
