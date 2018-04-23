# Maintainer: Knight <anonymousknight96 AT gmail.com>

pkgname=digilent.adept.utilities
pkgver='2.2.1'
pkgrel=3
pkgdesc="The Adept configuration tools"
arch=('x86_64' 'i686')
url='https://reference.digilentinc.com/digilent_adept_2'
license=('custom')
depends=('digilent.adept.runtime')
options=('!strip')
source_x86_64=("https://files.digilent.com/Software/Adept2/${pkgname}_${pkgver}-amd64.deb")
source_i686=("https://files.digilent.com/Software/Adept2/${pkgname}_${pkgver}-i386.deb")
sha256sums_x86_64=('ef70a6715a2850af40a60a4f5f7efeaea66c401ad472a6635611f06324badc3c')
sha256sums_i686=('ea43d63f75aee4f1affcd3e4cf62a91f8dad9c584bb3c05e15cecff52d5902aa')

package(){
    tar -xzf data.tar.gz --exclude="usr/share/lintian" -C "${pkgdir}"/

    [ -d "${pkgdir}"/usr/lib64 ] && mv "${pkgdir}"/usr/{lib64,lib}
    [ -d "${pkgdir}"/usr/sbin ] && mv "${pkgdir}"/usr/{sbin,bin}

    install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
    ln -s "/usr/share/doc/${pkgname}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}

