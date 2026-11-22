# Maintainer: tugyan <bilaltasdelen at windowslive dot com>
# Contributor: jkdhn <aur@jkdhn.me>

pkgname=weasis-bin
pkgver=4.8.1
pkgrel=1
pkgdesc="Weasis is a free medical DICOM viewer used in healthcare by hospitals, health networks, multicenter research trials, and patients."
arch=('x86_64' 'aarch64')
url="https://nroduit.github.io/"
license=('EPL-2.0')
options=('!strip' '!emptydirs')
# source=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
source_x86_64=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
source_aarch64=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_arm64.deb")
sha512sums_x86_64=('e4a5570c35b4387aa335b9f54bed595d02cac3f8f1300d75e3124619424580df599e09cd6d73d61794615530239c774f38128e9c87feaf59060f498a7486837e')
sha512sums_aarch64=('aa32334c591fcff13e111d577cca161dbbe4241a4afadf9dc6bdad2ce0dbc05c72ded55da103bb1475f0fbe50c5fbdbcc183e0b0d46ef7d34e101f5a912bbbdb')

package(){
        tar --zstd -xC "${pkgdir}" -f data.tar.zst

        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"
        ln -s "/opt/weasis/bin/Dicomizer" "$pkgdir/usr/bin/dicomizer"


        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Weasis.desktop ${pkgdir}/usr/share/applications/Weasis.desktop
        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Dicomizer.desktop ${pkgdir}/usr/share/applications/Dicomizer.desktop
}
