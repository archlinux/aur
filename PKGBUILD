pkgname=cndrvcups-lt
pkgver=5.10
pkgrel=1
pkgdesc='Canon UFR II /LIPSLX Printer Driver. It provides ppd files for LBP112, LBP113, LBP151, LBP6030, LBP6230, LBP7110C, and LBP8100 printers.'

arch=('x86_64')
url='https://www.canon-europe.com/support/consumer_products/products/printers/laser/i-sensys_lbp6030.aspx?type=drivers&language=EN&os=Linux%20(64-bit)'
depends=('cups' 'gtk3' 'glibc' 'libgcc' 'libstdc++' 'libxml2' 'jbigkit' 'libjpeg-turbo' 'libgcrypt')
options=('!strip' '!debug')
source=("https://gdlp01.c-wss.com/gds/0/0100005950/11/linux-UFRIILT-drv-v510-m17n.tar.gz")
sha256sums=('199ff0dd12c75d5f521c27c25d729e260d25f8fcaa98c1aa7ae11a9d989d6976')

package() {
    # Concerning the 64 bit version only right now
    cd "${srcdir}/linux-UFRIILT-drv-v510-m17n/x64/Debian"
    ar x cnrdrvcups-ufr2lt-uk_5.10-1.00_amd64.deb
    mkdir -p data
    tar -xJf data.tar.xz -C data
    cd data
    cp -a . "${pkgdir}"
}
