# Maintainer: tugyan <bilaltasdelen at windowslive dot com>
# Contributor: jkdhn <aur@jkdhn.me>

pkgname=weasis-bin
pkgver=4.6.3
pkgrel=1
pkgdesc="Weasis is a free medical DICOM viewer used in healthcare by hospitals, health networks, multicenter research trials, and patients."
arch=('x86_64' 'aarch64')
url="https://nroduit.github.io/"
license=('EPL-2.0')
options=('!strip' '!emptydirs')
# source=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
source_x86_64=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
source_aarch64=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_arm64.deb")
sha512sums_x86_64=('da70dc66ad37758e8e098bd4dce26333ca613e27774e3e94b5f8a104fcf0e8e604f0f47ca4f31cee277866c67bbab776d3a029c63e3b53d309c2580677efa6f0')
sha512sums_aarch64=('650d7ba6b9d468b4a19f1033242329473d0aef37b6d4b10339fc28d628685aecca5eaebce4dff78f48c745feb558b9b60170896fda0a31597bfd96d3a45f8814')

package(){
        tar --zstd -xC "${pkgdir}" -f data.tar.zst

        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"
        ln -s "/opt/weasis/bin/Dicomizer" "$pkgdir/usr/bin/dicomizer"


        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Weasis.desktop ${pkgdir}/usr/share/applications/Weasis.desktop
        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Dicomizer.desktop ${pkgdir}/usr/share/applications/Dicomizer.desktop
}
