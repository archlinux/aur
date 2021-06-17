pkgname=weasis-bin
pkgver=3.7.1
pkgrel=1
pkgdesc="Weasis is a multipurpose DICOM viewer with a highly modular architecture"
arch=('any')
url="https://nroduit.github.io/"
license=('EPL-2.0')
groups=('')
options=('!strip' '!emptydirs')
source=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
sha512sums=('8ac0c4daed155ba6b8ca1d253376254a9b11b8c1b6018c4c24f4bbb149b66d2ebeb4f3ec3a9f43fa1f955ce4eb488ab3be79665c2c734e34e1870ab06c060e45')

package(){
        tar -xJC "${pkgdir}" -f data.tar.xz

        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"
        ln -s "/opt/weasis/bin/Dicomizer" "$pkgdir/usr/bin/dicomizer"


        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Weasis.desktop ${pkgdir}/usr/share/applications/Weasis.desktop
        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Dicomizer.desktop ${pkgdir}/usr/share/applications/Dicomizer.desktop

}
