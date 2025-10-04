# Maintainer: tugyan <bilaltasdelen at windowslive dot com>
# Contributor: jkdhn <aur@jkdhn.me>

pkgname=weasis-bin
pkgver=4.6.4
pkgrel=1
pkgdesc="Weasis is a free medical DICOM viewer used in healthcare by hospitals, health networks, multicenter research trials, and patients."
arch=('x86_64' 'aarch64')
url="https://nroduit.github.io/"
license=('EPL-2.0')
options=('!strip' '!emptydirs')
# source=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
source_x86_64=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
source_aarch64=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_arm64.deb")
sha512sums_x86_64=('e24201e5c364bfcd080246c8abeea9644071a5cbc0049e6cd8796426ac415db0bb0af23913801463798dcc07dc80c2506fad098ad61027760ef3054660141c87')
sha512sums_aarch64=('24dfdc948873f3ae986f25cb7a6221c9f6da46fa36b285698bc8b9d4440446f9416d4805d926b31896bf53ab41fc864e2b113dec7baeee0aa7a8ca31c7e16e86')

package(){
        tar --zstd -xC "${pkgdir}" -f data.tar.zst

        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"
        ln -s "/opt/weasis/bin/Dicomizer" "$pkgdir/usr/bin/dicomizer"


        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Weasis.desktop ${pkgdir}/usr/share/applications/Weasis.desktop
        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Dicomizer.desktop ${pkgdir}/usr/share/applications/Dicomizer.desktop
}
