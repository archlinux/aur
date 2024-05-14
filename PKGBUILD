# Maintainer: tugyan <bilaltasdelen at windowslive dot com>
# Contributor: jkdhn <aur@jkdhn.me>

pkgname=weasis-bin
pkgver=4.4.0
pkgrel=2
pkgdesc="Weasis is a free medical DICOM viewer used in healthcare by hospitals, health networks, multicenter research trials, and patients."
arch=('any')
url="https://nroduit.github.io/"
license=('EPL-2.0')
options=('!strip' '!emptydirs')
source=("https://github.com/nroduit/Weasis/releases/download/v${pkgver}/weasis_${pkgver}-1_amd64.deb")
sha512sums=('22a91e319b614d82ebdadb4d4239975f1edc8de3a54c0e9e4f4a0e6e5082121fff1f49a3f0bc5219e481e7eb127f8e9958161c9db7c0f95397d1bb03177ebd29')

package(){
        tar --zstd -xC "${pkgdir}" -f data.tar.zst

        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"
        ln -s "/opt/weasis/bin/Dicomizer" "$pkgdir/usr/bin/dicomizer"


        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Weasis.desktop ${pkgdir}/usr/share/applications/Weasis.desktop
        install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Dicomizer.desktop ${pkgdir}/usr/share/applications/Dicomizer.desktop
}
