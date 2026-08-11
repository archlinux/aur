# Maintainer: tugyan <bilaltasdelen at windowslive dot com>
# Contributor: jkdhn <aur@jkdhn.me>

pkgname=weasis-bin
pkgver=4.7.2
pkgrel=1
pkgdesc="Weasis is a free medical DICOM viewer used in healthcare by hospitals, health networks, multicenter research trials, and patients."
arch=('x86_64' 'aarch64')
url="https://nroduit.github.io/"
license=('EPL-2.0')
options=('!strip' '!emptydirs')
# source=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
source_x86_64=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
source_aarch64=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_arm64.deb")
sha512sums_x86_64=('5709935dbcab156c15a8b861c7dd0f9978ce70cfe7066ca990d2cea0140f45405640ce8c2f1f0b5475a0a1560e5d9d768e37befe846c2b4d774d96e3b5f5260f')
sha512sums_aarch64=('94b4323908601af68ba160833d0798906e19626f0ed89e4e1b0072526aaddbafe9da684d8cfe2b8da34a05b1e8719566f77a3c5a50ffef17673b9e159ffec082')

package(){
        tar --zstd -xC "${pkgdir}" -f data.tar.zst

        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"
        ln -s "/opt/weasis/bin/Dicomizer" "$pkgdir/usr/bin/dicomizer"


        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Weasis.desktop ${pkgdir}/usr/share/applications/Weasis.desktop
        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Dicomizer.desktop ${pkgdir}/usr/share/applications/Dicomizer.desktop
}
