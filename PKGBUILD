# Maintainer: Natalia Portillo <claunia@clania.com>
pkgname=rpcemu
pkgver=0.8.15
pkgrel=2
pkgdesc="Emulator of the Acorn Archimedes and RiscPC computers."
url="http://www.marutan.net/rpcemu/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('allegro4')
source=("http://www.marutan.net/rpcemu/cgi/download.php?sFName=${pkgver}/rpcemu-${pkgver}.tar.gz")
md5sums=('bffb5bbb81391c14f210facccd0f40b6')
install=$pkgname.install
changelog=$pkgname.changelog

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  ./configure --prefix=/usr --enable-dynarec
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  install -Dm755 rpcemu "$pkgdir/usr/share/$pkgname/rpcemu"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/rpcemu" "$pkgdir/usr/bin/rpcemu"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 cmos.ram "$pkgdir/usr/share/$pkgname/cmos.ram"
  install -Dm644 readme.txt "$pkgdir/usr/share/$pkgname/readme.txt"
  install -Dm644 rpc.cfg "$pkgdir/usr/share/$pkgname/rpc.cfg"
  install -Dm644 "hostfs/Network/!System/310/Modules/Network/EtherRPCEm,ffa" "$pkgdir/usr/share/$pkgname/hostfs/Network/!System/310/Modules/Network/EtherRPCEm,ffa"
  install -Dm644 "hostfs/Network/AutoSense/EtherRPCEm,ffb" "$pkgdir/usr/share/$pkgname/hostfs/Network/AutoSense/EtherRPCEm,ffb"
  install -Dm644 "hostfs/Network/ReadMe,fff" "$pkgdir/usr/share/$pkgname/hostfs/Network/ReadMe,fff"
  install -Dm644 "poduleroms/SyncClock,ffa" "$pkgdir/usr/share/$pkgname/poduleroms/SyncClock,ffa"
  install -Dm755 "poduleroms/hostfsfiler,ffa" "$pkgdir/usr/share/$pkgname/poduleroms/hostfsfiler,ffa"
  install -Dm755 "poduleroms/hostfs,ffa" "$pkgdir/usr/share/$pkgname/poduleroms/hostfs,ffa"
  install -Dm644 "riscos-progs/EtherRPCEm/cmhg/ModHdr" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/cmhg/ModHdr"
  install -Dm644 "riscos-progs/EtherRPCEm/!System/310/Modules/Network/EtherRPCEm,ffa" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/!System/310/Modules/Network/EtherRPCEm,ffa"
  install -Dm644 "riscos-progs/EtherRPCEm/!Boot/Resources/Configure/!InetSetup/AutoSense/EtherRPCEm,ffb" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/!Boot/Resources/Configure/!InetSetup/AutoSense/EtherRPCEm,ffb"
  install -Dm644 "riscos-progs/EtherRPCEm/Structs.h" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/Structs.h"
  install -Dm644 "riscos-progs/EtherRPCEm/LICENSE" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/LICENSE"
  install -Dm644 "riscos-progs/EtherRPCEm/Defines.h" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/Defines.h"
  install -Dm644 "riscos-progs/EtherRPCEm/Equates.h" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/Equates.h"
  install -Dm644 "riscos-progs/EtherRPCEm/Makefile" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/Makefile"
  install -Dm644 "riscos-progs/EtherRPCEm/DCI.h" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/DCI.h"
  install -Dm644 "riscos-progs/EtherRPCEm/Notes" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/Notes"
  install -Dm644 "riscos-progs/EtherRPCEm/mbuf_c.h" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/mbuf_c.h"
  install -Dm644 "riscos-progs/EtherRPCEm/Module.h" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/Module.h"
  install -Dm644 "riscos-progs/EtherRPCEm/intveneer.s" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/intveneer.s"
  install -Dm644 "riscos-progs/EtherRPCEm/ReadMe,fff" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/ReadMe,fff"
  install -Dm644 "riscos-progs/EtherRPCEm/Module.c" "$pkgdir/usr/share/$pkgname/riscos-progs/EtherRPCEm/Module.c"
  install -Dm755 "riscos-progs/HostFS/hostfsfiler,ffa" "$pkgdir/usr/share/$pkgname/riscos-progs/HostFS/hostfsfiler,ffa"
  install -Dm644 "riscos-progs/HostFS/arm_binutils.txt" "$pkgdir/usr/share/$pkgname/riscos-progs/HostFS/arm_binutils.txt"
  install -Dm755 "riscos-progs/HostFS/hostfs,ffa" "$pkgdir/usr/share/$pkgname/riscos-progs/HostFS/hostfs,ffa"
  install -Dm644 "riscos-progs/HostFS/Makefile" "$pkgdir/usr/share/$pkgname/riscos-progs/HostFS/Makefile"
  install -Dm644 "riscos-progs/HostFS/hostfs.s" "$pkgdir/usr/share/$pkgname/riscos-progs/HostFS/hostfs.s"
  install -Dm644 "riscos-progs/HostFS/hostfsfiler.s" "$pkgdir/usr/share/$pkgname/riscos-progs/HostFS/hostfsfiler.s"
  install -Dm644 "riscos-progs/SyncClock/SyncClock,ffa" "$pkgdir/usr/share/$pkgname/riscos-progs/SyncClock/SyncClock,ffa"
  install -Dm644 "riscos-progs/SyncClock/SyncClockSrc,ffb" "$pkgdir/usr/share/$pkgname/riscos-progs/SyncClock/SyncClockSrc,ffb"
  install -Dm644 "roms/roms.txt" "$pkgdir/usr/share/$pkgname/roms/roms.txt"
}
 
# vim:set ts=2 sw=2 et:
