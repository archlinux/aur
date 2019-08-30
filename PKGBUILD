pkgname=weasis-bin
pkgver=3.5.3
pkgrel=3
pkgdesc="Weasis is a multipurpose DICOM viewer with a highly modular architecture"
arch=('any')
url="https://nroduit.github.io/"
license=('EPL-2.0')
groups=('')
options=('!strip' '!emptydirs')
source=("https://github.com/nroduit/Weasis/releases/download/v3.5.3/weasis_3.5.3_amd64.deb")
sha512sums=('167f72c210aedf4758c700ca85d6def4320776a3d9f171665dc54201d1ea0e9d2d1289c749935d5fe484af0747f57400189b5bbd473d06a2230693b98049d655')
		
package(){
        tar -xJC "${pkgdir}" -f data.tar.xz
        
        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/Weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"

        install -Dm 644 /opt/Weasis/bin/Weasis.desktop ${pkgdir}/usr/share/applications/Weasis.desktop
}
