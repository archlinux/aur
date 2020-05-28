pkgname=weasis-bin
pkgver=3.6.0
pkgrel=4
pkgdesc="Weasis is a multipurpose DICOM viewer with a highly modular architecture"
arch=('any')
url="https://nroduit.github.io/"
license=('EPL-2.0')
groups=('')
options=('!strip' '!emptydirs')
source=("https://github.com/nroduit/Weasis/releases/download/v3.6.0/weasis_3.6.0-1_amd64.deb")
sha512sums=('9d7b4bfc54a38fe67198194104cb502fbb8060a1d825ebaa20fa34bc09d63d204d09703e59321ee95388888c99287652a5c2723e71025d4b0cea058e2909a3c4')
		
package(){
        tar -xJC "${pkgdir}" -f data.tar.xz
        
        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"

        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Weasis.desktop ${pkgdir}/usr/share/applications/Weasis.desktop
}
