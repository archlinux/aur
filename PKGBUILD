# Maintainer: Knight <anonymousknight96 AT gmail.com>

pkgname=digilent.adept.utilities
pkgver='2.3.2'
pkgrel=1
pkgdesc="The Adept configuration tools"
arch=('x86_64' 'i686')
url='https://reference.digilentinc.com/digilent_adept_2'
license=('custom')
depends=('digilent.adept.runtime')
options=('!strip')
source_x86_64=("https://digilent.s3.amazonaws.com/Software/AdeptUtilities/${pkgver}/${pkgname}_${pkgver}-amd64.deb")
source_i686=("https://digilent.s3.amazonaws.com/Software/AdeptUtilities/${pkgver}/${pkgname}_${pkgver}-i386.deb")
sha256sums_x86_64=('ec9eef8340619aeba7d2f10dda63f05be35346302ad1b8f03e1f324f52665b20')
sha256sums_i686=('12a3ef87ee861c259633d778cf6becba9a5a28f3d079828efe79d7b7169474d7')

package(){
    tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

    [ -d "${pkgdir}"/usr/lib64 ] && mv "${pkgdir}"/usr/{lib64,lib}
    [ -d "${pkgdir}"/usr/sbin ] && mv "${pkgdir}"/usr/{sbin,bin}

    install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
    ln -s "/usr/share/doc/${pkgname}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}

