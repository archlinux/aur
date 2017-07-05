# Maintainer: Artyom Aleksyuk <artyom.h31@gmail.com>

pkgname=noxbit
pkgver=20170703
pkgrel=1
pkgdesc='Live Video Streaming technology based on BitTorrent protocol'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://noxbit.com/'
license=('custom')
options=('!strip')
depends=()
install=noxbit.install
backup=("opt/noxbit/noxbit.cfg")
source=("noxbit.sysusers"
        "noxbit.service")
source_i686=("http://download.noxbit.com/i386/noxbit-pa-x86-i386.tar.gz")
source_x86_64=("http://download.noxbit.com/noxbit-pa-x86-64.tar.gz")
source_arm=("http://download.noxbit.com/ARMel/noxbit-pa-ARMel-32.tar.gz")
source_armv6h=("http://download.noxbit.com/ARMhf/noxbit-pa-ARMhf-32.tar.gz")
source_armv7h=("http://download.noxbit.com/ARMhf/noxbit-pa-ARMhf-32.tar.gz")
source_aarch64=("http://download.noxbit.com/AArch64/noxbit-pa-ARM-64.tar.gz")
sha256sums=('fb84aa86b9bef64365e16efa7090504a03cebb3fd1eb02f3e021114eca3c9070'
            '087c3e20b5e8a1102bcadcf391171a2587653efdc59c32a3bb90e55cba56869b')
sha256sums_i686=('SKIP') # Changes too ofter
sha256sums_x86_64=('SKIP')
sha256sums_arm=('SKIP')
sha256sums_armv6h=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
  date -r "$srcdir"/STM-Hypervisor +%Y%m%d
}

package() {
  # Install
  install -dm0755 "$pkgdir"/opt/noxbit
  install -Dm0755 {STM-Agent,STM-Downloader,STM-Hypervisor} "${pkgdir}"/opt/noxbit
  install -Dm0644 noxbit.cfg "${pkgdir}"/opt/noxbit

  # Additional files
  install -Dm0644 "$srcdir"/noxbit.sysusers "$pkgdir"/usr/lib/sysusers.d/noxbit.conf
  install -Dm0644 "$srcdir"/noxbit.service "$pkgdir"/usr/lib/systemd/system/noxbit.service
}
