# Maintainer: tugyan <bilaltasdelen at windowslive dot com>
# Contributor: jkdhn <aur@jkdhn.me>

pkgname=weasis-bin
pkgver=4.6.5
pkgrel=1
pkgdesc="Weasis is a free medical DICOM viewer used in healthcare by hospitals, health networks, multicenter research trials, and patients."
arch=('x86_64' 'aarch64')
url="https://nroduit.github.io/"
license=('EPL-2.0')
options=('!strip' '!emptydirs')
# source=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
source_x86_64=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
source_aarch64=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_arm64.deb")
sha512sums_x86_64=('c30e72e612eba9c8e73e5d3cbdc94ff3803e27803dcbaf4e4259c91ac46f2695efb1ddf04a00a16483304e02581d3a62a671ba94127a2f17aee0e88e215149cc')
sha512sums_aarch64=('f7d4fcad76be041ad4ee18130620ca5fd22d9961842b168d5be899638aea324ef35caa1285723d933f7d48b8bc8742e1f32a815a16e2345b540fccec9979541b')

package(){
        tar --zstd -xC "${pkgdir}" -f data.tar.zst

        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"
        ln -s "/opt/weasis/bin/Dicomizer" "$pkgdir/usr/bin/dicomizer"


        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Weasis.desktop ${pkgdir}/usr/share/applications/Weasis.desktop
        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Dicomizer.desktop ${pkgdir}/usr/share/applications/Dicomizer.desktop
}
