# Maintainer: tugyan <bilaltasdelen at windowslive dot com>
# Contributor: jkdhn <aur@jkdhn.me>

pkgname=weasis-bin
pkgver=4.2.0
pkgrel=1
pkgdesc="Weasis is a free medical DICOM viewer used in healthcare by hospitals, health networks, multicenter research trials, and patients."
arch=('any')
url="https://nroduit.github.io/"
license=('EPL-2.0')
options=('!strip' '!emptydirs')
source=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
sha512sums=('5bc63ac78fa0d85be8462fd4e24fbfe805237d53d25c188b2393e3d4dbadf2c6697f6017a02922ac649de347661f31028f23ca7f6b34b2f9bc2aac159cf1d0d0')

package(){
        tar --zstd -xC "${pkgdir}" -f data.tar.zst

        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"
        ln -s "/opt/weasis/bin/Dicomizer" "$pkgdir/usr/bin/dicomizer"


        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Weasis.desktop ${pkgdir}/usr/share/applications/Weasis.desktop
        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Dicomizer.desktop ${pkgdir}/usr/share/applications/Dicomizer.desktop
}
