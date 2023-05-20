# Maintainer: tugyan <bilaltasdelen at windowslive dot com>
# Contributor: jkdhn <aur@jkdhn.me>

pkgname=weasis-bin
pkgver=4.1.1
pkgrel=1
pkgdesc="Weasis is a multipurpose DICOM viewer with a highly modular architecture"
arch=('any')
url="https://nroduit.github.io/"
license=('EPL-2.0')
options=('!strip' '!emptydirs')
source=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}-SNAPSHOT/weasis_${pkgver}-1_amd64.deb")
sha512sums=('1f02880dfd194e9493bd04caab7e9f0fe53255256156538593b12dd550a6b0b8b316463c2abf2e4fb2477737dfe6704de75b00c41603a31275285083371ece69')

package(){
        tar --zstd -xC "${pkgdir}" -f data.tar.zst

        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"
        ln -s "/opt/weasis/bin/Dicomizer" "$pkgdir/usr/bin/dicomizer"


        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Weasis.desktop ${pkgdir}/usr/share/applications/Weasis.desktop
        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Dicomizer.desktop ${pkgdir}/usr/share/applications/Dicomizer.desktop
}
