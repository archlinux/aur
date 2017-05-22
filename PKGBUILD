pkgname=armsimsharp
pkgver=2.1
pkgrel=1
pkgdesc='A desktop application for simulating the execution of ARM assembly language programs.'
url="https://webhome.cs.uvic.ca/~nigelh/ARMSim-V${pkgver}/"
license=('GPL')
arch=('any')
depends=('arm-none-eabi-binutils' 'mono')
source=("${pkgname}" 'arm-none-eabi-as' "https://webhome.cs.uvic.ca/~nigelh/ARMSim-V${pkgver}/Linux/ARMSimLinuxFiles.zip")
sha256sums=('SKIP' 'SKIP' '4dd14e7614615e8249b2c17274d78e4eb712242e420d886c3a14d3dbe65e513e')


package() {
    install -D --mode=u=rwx,go=rx "--target-directory=${pkgdir}/usr/bin" "${srcdir}/${pkgname}"
    install -D --mode=u=rw,go=r "--target-directory=${pkgdir}/opt/${pkgname}" "${srcdir}"/*.{config,dll,exe}
    install -D --mode=u=rwx,go=rx "--target-directory=${pkgdir}/opt/${pkgname}" "${srcdir}/arm-none-eabi-as"
}
