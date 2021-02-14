pkgname=cndrvcups-lt
pkgver=5.00.18
pkgrel=0
pkgdesc='Canon UFR II /LIPSLX Printer Driver. It provides ppd files for LBP112, LBP113, LBP151, LBP6030, LBP6230, LBP7110C, and LBP8100 printers.'

arch=('x86_64')
url='https://www.canon-europe.com/support/consumer_products/products/printers/laser/i-sensys_lbp6030.aspx?type=drivers&language=EN&os=Linux%20(64-bit)'
depends=('libglade' 'gcc-libs' 'libxml2' 'libjpeg-turbo' 'libgcrypt')
source=("http://gdlp01.c-wss.com/gds/0/0100005950/10/linux-UFRIILT-drv-v500-uken-18.tar.gz")
md5sums=('8bc3a4e3c372bb4d1b9af2cc012c720b')

package() {
    # Concerning the 64 bit version only right now
    cd "${srcdir}/linux-UFRIILT-drv-v500-uken/64-bit_Driver/Debian"
    ar x cnrdrvcups-ufr2lt-uk_5.00-1_amd64.deb
    mkdir data
    tar -xzf data.tar.gz -C data
    cd data
    cp -r . "${pkgdir}"
}
