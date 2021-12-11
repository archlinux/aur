pkgname=weasis-bin
pkgver=3.8.0
pkgrel=1
pkgdesc="Weasis is a multipurpose DICOM viewer with a highly modular architecture"
arch=('any')
url="https://nroduit.github.io/"
license=('EPL-2.0')
groups=('')
options=('!strip' '!emptydirs')
source=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
sha512sums=('f7394890b675f9a80fc405dd017754363b64eae3bc5dbba992c22d8eddf2145b68e867340eb98f3086620d9023c0c1ea8e4850912fda4f39d3a63f76d1de9305')

package(){
        tar -xJC "${pkgdir}" -f data.tar.xz

        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"
        ln -s "/opt/weasis/bin/Dicomizer" "$pkgdir/usr/bin/dicomizer"


        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Weasis.desktop ${pkgdir}/usr/share/applications/Weasis.desktop
        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Dicomizer.desktop ${pkgdir}/usr/share/applications/Dicomizer.desktop

}
