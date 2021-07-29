# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-wujian100-open
pkgname=($pkgbase csky-cpu-wujian100-open-doc csky-cpu-wujian100-open-fpga csky-cpu-wujian100-open-sdk csky-cpu-wujian100-open-soc csky-cpu-wujian100-open-test csky-cpu-wujian100-open-simulation )
pkgver=1.0
pkgrel=1
arch=('x86_64')
url='https://github.com/T-head-Semi/wujian100_open'
license=('MIT')
provides=()
#conflicts=()
depends=("iverilog" "verilator" "gtkwave")
makedepends=("git")
optdepends=("csky-debugserver-bin: C-Sky Debugger Server"
            "csky-toolchain-900-series-bin: C-Sky toolchain 900 series (RISC-V)")
source=("${pkgbase}::git+https://hub.fastgit.org/T-head-Semi/wujian100_open.git")

sha256sums=('SKIP')

noextract=()

package_csky-cpu-wujian100-open() {
    pkgdesc="C-Sky CPU wujian100 open. IC design and development should be faster，simpler and more reliable."
    depends=(csky-cpu-wujian100-open-doc csky-cpu-wujian100-open-fpga csky-cpu-wujian100-open-sdk csky-cpu-wujian100-open-soc csky-cpu-wujian100-open-test csky-cpu-wujian100-open-simulation)
}

package_csky-cpu-wujian100-open-doc() {
    pkgdesc="C-Sky CPU wujian100 open doc."
    install -dm0755 "${pkgdir}/opt/t-head/${pkgbase}"
    cp -r "${srcdir}"/${pkgbase}/{doc,README.md} "${pkgdir}/opt/t-head/${pkgbase}"
}

package_csky-cpu-wujian100-open-fpga() {
    pkgdesc="C-Sky CPU wujian100 open FPGA."
    install -dm0755 "${pkgdir}/opt/t-head/${pkgbase}"
    cp -r "${srcdir}/${pkgbase}/fpga" "${pkgdir}/opt/t-head/${pkgbase}"
}

package_csky-cpu-wujian100-open-sdk() {
    pkgdesc="C-Sky CPU wujian100 open SDK."
    install -dm0755 "${pkgdir}/opt/t-head/${pkgbase}"
    cp -r "${srcdir}/${pkgbase}/sdk" "${pkgdir}/opt/t-head/${pkgbase}"
}

package_csky-cpu-wujian100-open-soc() {
    pkgdesc="C-Sky CPU wujian100 open SoC."
    depends=(csky-cpu-wujian100-open-sdk-test csky-cpu-wujian100-open-simulation)
    install -dm0755 "${pkgdir}/opt/t-head/${pkgbase}"
    cp -r "${srcdir}/${pkgbase}/soc" "${pkgdir}/opt/t-head/${pkgbase}"
}

package_csky-cpu-wujian100-open-test() {
    pkgdesc="C-Sky CPU wujian100 open test bench."
    install -dm0755 "${pkgdir}/opt/t-head/${pkgbase}"
    cp -r "${srcdir}"/${pkgbase}/{tb,regress} "${pkgdir}/opt/t-head/${pkgbase}"
}

package_csky-cpu-wujian100-open-simulation() {
    pkgdesc="C-Sky CPU wujian100 open simulation."
    install -dm0755 "${pkgdir}/opt/t-head/${pkgbase}"
    cp -r "${srcdir}"/${pkgbase}/{case,lib,tools,workdir} "${pkgdir}/opt/t-head/${pkgbase}"
}
# vim: ts=4 sw=4 et
