# Maintainer: Alexander Daum <alexander.daum at mailbox dot org>

pkgname='intel-soc-eds'
pkgdesc='Intel SoC FPGA Embedded Design Suite (Standard Edition)'
pkgver='20.1.0.711'
pkgrel=2
url="https://www.intel.com/content/www/us/en/software/programmable/soc-eds/overview.html"
license=('custom')
run_name="SoCEDSSetup-${pkgver}-linux.run"
source=("https://downloads.intel.com/akdlm/software/acdsinst/20.1std/711/ib_installers/${run_name}")
sha1sums=('c9e1235c7f979a37d79eb57eee37596b030d209e')
arch=(
 'x86_64'
 'i686'
)
options=(!strip)

package() {
    installdir=$pkgdir/opt/intelFPGA/20.1
    mkdir -p $installdir
    chmod +x $run_name
    ./$run_name --mode unattended --unattendedmodeui none --installdir "$installdir" --accept_eula 1 --disable-components qprogrammer
    install -Dm644 $installdir/licenses/soceds_lic.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

