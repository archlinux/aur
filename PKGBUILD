# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7 packages were based on
pkgname=picoscope7
pkgver=7.2.3.7282
pkgrel=3
pkgdesc="PicoScope 7 Test and Measurment Stable"
arch=('x86_64')
url="https://www.picotech.com/downloads/linux"
license=('custom')
groups=()
depends=(ttf-roboto ps7_libpicoipp ps7_libpicocv desktop-file-utils which fuse2)
optdepends=('ps7_libps2000: Support for PicoScope 2000 series'
        'ps7_libps2000a: Support for PicoScope 2000a series'
        'ps7_libps3000: Support for PicoScope 3000 series'
        'ps7_libps3000a: Support for PicoScope 3000a series'
        'ps7_libps4000: Support for PicoScope 4000 series'
        'ps7_libps4000a: Support for PicoScope 4000a series'
        'ps7_libps5000: Support for PicoScope 5000 series'
        'ps7_libps5000a: Support for PicoScope 5000a series'
        'ps7_libps6000: Support for PicoScope 6000 series'
        'ps7_libps6000a: Support for PicoScope 6000a series'
        )
provides=(picoscope7)
conflicts=(picoscope7beta)
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("https://labs.picotech.com/picoscope7/debian/pool/main/p/picoscope/picoscope_${pkgver//_/-}_amd64.deb")
md5sums=('fdce55df613268a4b8eb16e561531787')

package() {
  tar -xf data.tar.* -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  # mkdir -p $pkgdir/usr/bin
  # ln -s /opt/picoscope/bin/picoscope $pkgdir/usr/bin/picoscope

  # mkdir -p $pkgdir/opt/picoscope/scripts
  # tar -xf control.tar.* -C "${pkgdir}/opt/picoscope/scripts" ./postinst
  # mv "${pkgdir}/opt/picoscope/scripts/postinst" "${pkgdir}/opt/picoscope/scripts/${pkgname}_postinst"

  tar -xf control.tar.* -C "${pkgdir}/opt/picoscope" ./copyright
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/opt/picoscope/copyright" 
}
