# Maintainer: Knight <anonymousknight96 AT gmail.com>

pkgname=digilent.adept.utilities
pkgver='2.2.1'
pkgrel=1
pkgdesc="The Adept configuration tools"
arch=('x86_64' 'i686')
url=('http://www.digilentinc.com/Products/Detail.cfm?Prod=ADEPT2')
license=('custom')
depends=('digilent.adept.runtime')
options=('!strip')
source_x86_64=("http://www.digilentinc.com/Data/Products/ADEPT2/${pkgname}_${pkgver}-amd64.deb")
source_i686=("http://www.digilentinc.com/Data/Products/ADEPT2/${pkgname}_${pkgver}-i386.deb")
md5sums_x86_64=('cca4cfc00fa8134b7402b28d2c9db115')
md5sums_i686=('a882a81ece4e1e384dc99c970c237c6d')

package(){
    tar -xzf data.tar.gz --exclude="usr/share/lintian" -C "${pkgdir}"/

    [ -d "${pkgdir}"/usr/lib64  ] && mv "${pkgdir}"/usr/{lib64,lib}
    [ -d "${pkgdir}"/usr/sbin  ] && mv "${pkgdir}"/usr/{sbin,bin}

    install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
    ln -s "/usr/share/doc/${pkgname}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}

