pkgname=weasis-bin
pkgver=3.6.1
pkgrel=1
pkgdesc="Weasis is a multipurpose DICOM viewer with a highly modular architecture"
arch=('any')
url="https://nroduit.github.io/"
license=('EPL-2.0')
groups=('')
options=('!strip' '!emptydirs')
source=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
sha512sums=('2fd4a8ae1cdafb6643fbeded1c97491f2f8cb6273540af03e223ff17686f5cf1f5712448afbe3e6a997250b0e8bfd24945622ceb384955cb6053b54b4789d532')
		
package(){
        tar -xJC "${pkgdir}" -f data.tar.xz
        
        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"

        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Weasis.desktop ${pkgdir}/usr/share/applications/Weasis.desktop
}
