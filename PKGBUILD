# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

pkgbase=qemu-pinning
_pkgname=qemu
pkgname=(
  qemu-pinning-common
  qemu-pinning-audio-{alsa,dbus,jack,oss,pa,sdl,spice}
  qemu-pinning-block-{curl,dmg,gluster,iscsi,nfs,rbd,ssh}
  qemu-pinning-chardev-{baum,spice}
  qemu-pinning-docs
  qemu-pinning-guest-agent
  qemu-pinning-hw-display-{qxl,virtio-{gpu{,-{gl,pci,pci-gl}},vga{,-gl}}}
  qemu-pinning-hw-s390x-virtio-gpu-ccw
  qemu-pinning-hw-usb-{host,redirect,smartcard}
  qemu-pinning-img
  qemu-pinning-pr-helper
  qemu-pinning-system-{aarch64,alpha,arm,avr,cris,hppa,m68k,microblaze,mips,nios2,or1k,ppc,riscv,rx,s390x,sh4,sparc,tricore,x86,xtensa}
  qemu-pinning-tests
  qemu-pinning-tools
  qemu-pinning-ui-{curses,dbus,egl-headless,gtk,opengl,sdl,spice-{app,core}}
  qemu-pinning-user
  qemu-pinning-vhost-user-gpu
  qemu-pinning-virtiofsd
  qemu-pinning-{base,desktop,emulators-full,full}
)
pkgver=7.1.0
pkgrel=2
pkgdesc="A generic and open source machine emulator and virtualizer"
arch=(x86_64)
url="https://www.qemu.org/"
license=(GPL2 LGPL2.1)
# TODO: consider providing rdma-core
# TODO: consider providing lzfse
# TODO: package systemtap
# TODO: package openbios for qemu-pinning-system-{ppc,sparc}
# TODO: package /usr/share/qemu/{efi,pxe}-* for qemu (ipxe)
# TODO: package /usr/share/qemu/slof.bin for qemu-pinning-system-ppc (slof)
# TODO: package /usr/share/qemu/sgabios.bin for qemu-pinning-system-x86 (sgabios)
# TODO: package static libs of glib2 and pcre for qemu-pinning-user-static
makedepends=(
  alsa-lib
  brltty
  bzip2
  cairo
  ceph
  curl
  dtc
  fuse3
  gcc-libs
  gdk-pixbuf2
  glib2
  glusterfs
  gnutls
  gtk3
  jack
  libaio
  libbpf
  libcacard
  libcap-ng
  libepoxy
  libiscsi
  libnfs
  libpng
  libpulse
  libsasl
  libseccomp
  libslirp
  libssh
  liburing
  libusb
  libx11
  libxml2
  libxkbcommon
  lzo
  mesa
  meson
  multipath-tools
  ncurses
  ndctl
  numactl
  pam
  python
  python-sphinx
  python-sphinx_rtd_theme
  sdl2
  sdl2_image
  snappy
  spice-protocol
  spice
  systemd
  usbredir
  vde2
  virglrenderer
  vte3
  zlib
  zstd
)
# NOTE: currently the debug package for qemu >= 7.0.0 contains an invalid /build dir
options=(debug)
source=(
  https://download.qemu.org/qemu-$pkgver.tar.xz{,.sig}
  qemu-pinning-$pkgver.patch
  bridge.conf
  qemu-ga.conf
  qemu-sysusers.conf
  65-kvm.rules
  99-qemu-guest-agent.rules
)
sha512sums=('c60c5ff8ec99b7552e485768908920658fdd8035ff7a6fa370fb6881957dc8b7e5f18ff1a8f49bd6aa22909ede2a7c084986d8244f12074ccd33ebe40a0c411f'
            'SKIP'
            '5dd369f4d9b2e86fa8de811ee0fa239a69a95c6702aaba2b662efc4327d29c146c1c41a827fd0b99d1ca00e4b57a8bdb72f7f9d4bdeb9b3b8f4f3ff66cbd8cc7'
            '7b412ffa5dcda47b0a4ec9e2c5e5e1d9eaaaf0a087b7ea3ead3e706ba4c9cafb919beadd088a0299b6f7aab753b81a5eafb545b4842ee5f26646d16544dd02a7'
            '6e838773d63ae0ffdffe2b891bf611d8f5f3c67a9bc4cbbedf8363c150c2c9971c8e44d92270bc581af40eb0ece02192760bcdd6aee229fff55635f3a4825afa'
            '985c2c7a6b5217c87a15b45368089ee91b2f9027b070f9eafa448a18b27ae0d9edd964d52e134b9c1f4aeef4d6aae88afd3f454551ca898affef7f9d28b99b8f'
            'bdf05f99407491e27a03aaf845b7cc8acfa2e0e59968236f10ffc905e5e3d5e8569df496fd71c887da2b5b8d1902494520c7da2d3a8258f7fd93a881dd610c99'
            '93b905046fcea8a0a89513b9259c222494ab3b91319dde23baebcb40dc17376a56661b159b99785d6e816831974a0f3cbd7b2f7d89e5fc3c258f88f4492f3839')
b2sums=('e05f91ce4993c7591a2df08b5fb017f8b8ec2141ab7bfd55d14730ea6b793ac1091de539992058392a5522d4e58beee92a87752707be58e3619b8213ef9f35bf'
        'SKIP'
        '39f4709f455fce94f5a95926a48665134292e2ec78d144762a406d35fd801b3270b394891c42f799e494f4f9bb7fefb78c53643f7ba558630f457f37260ac2a4'
        'b1eca364aa60f130ff5e649f5d004d3fcb75356d3421a4542efdfc410d39b40d9434d15e1dd7bbdbd315cb72b5290d3ea5f77f9c41961a5601cd28ef7bbe72e8'
        '2102e4a34e11e406e9606c97e026e7b92e887e296a7f77b9cede1b37119d0df33735f3588628167b2b8e32244c196c491bfab623e2caddac9014d445aa2a6d98'
        '69177b962d2fda20cafdbc6226fd017b5ca5a0f69f866d055dc1c744b7b2955059f47c693cfb5b4c863ec159569fdabd4327ab4b8a95566a68cd8ce38e339c7a'
        '3559fe9c4f744194939770047a0a02d07ff791c845a80726d0bc7b8c4801ed5f11150e7d5adab813844b3dab1cf38c3a5a87fb6efbb8fc9dccdda9fa56409ed8'
        'a9a2bdfeeb44eb86cbe88ac7c65f72800bdb2fd5cecb02f3a258cf9470b52832180aab43c89d481f7fd4d067342a9a27dd6c8a94d625b95d6e2b912e47d274e7')
validpgpkeys=('CEACC9E15534EBABB82D3FA03353C9CEF108B584') # Michael Roth <flukshun@gmail.com>

_qemu_system_deps=(
  dtc
  fuse3
  gcc-libs
  glib2 libgio-2.0.so libglib-2.0.so libgmodule-2.0.so
  gnutls
  libaio
  libbpf libbpf.so
  libjpeg-turbo libjpeg.so
  libpng
  libsasl
  libseccomp libseccomp.so
  libslirp libslirp.so
  liburing liburing.so
  lzo
  ndctl
  numactl libnuma.so
  pam libpam.so
  pixman libpixman-1.so
  qemu-pinning-common
  snappy
  vde2
  zlib
  zstd libzstd.so
)

# TODO: qemu-pinning-user-static
#  'qemu-pinning-user-static: for static user mode emulation of QEMU targets'
_qemu_optdepends=(
  'qemu-pinning-audio-alsa: for ALSA audio driver'
  'qemu-pinning-audio-dbus: for D-Bus audio driver'
  'qemu-pinning-audio-jack: for JACK audio driver'
  'qemu-pinning-audio-oss: for OSS audio driver'
  'qemu-pinning-audio-pa: for PulseAudio audio driver'
  'qemu-pinning-audio-sdl: for SDL audio driver'
  'qemu-pinning-audio-spice: for spice audio driver'
  'qemu-pinning-block-curl: for curl block driver'
  'qemu-pinning-block-dmg: for DMG block driver'
  'qemu-pinning-block-gluster: for Gluster block driver'
  'qemu-pinning-block-iscsi: for iSCSI block driver'
  'qemu-pinning-block-nfs: for NFS block driver'
  'qemu-pinning-block-rbd: for Ceph/RBD block driver'
  'qemu-pinning-block-ssh: for SSH block driver'
  'qemu-pinning-chardev-baum: for Baum chardev driver'
  'qemu-pinning-chardev-spice: for spice chardev driver'
  'qemu-pinning-docs: for documentation'
  'qemu-pinning-hw-display-qxl: for QXL display device'
  'qemu-pinning-hw-display-virtio-gpu-gl: for virtio-gpu-gl display device'
  'qemu-pinning-hw-display-virtio-gpu: for virtio-gpu display device'
  'qemu-pinning-hw-display-virtio-gpu-pci: for virtio-gpu-pci display device'
  'qemu-pinning-hw-display-virtio-gpu-pci-gl: for virtio-gpu-pci-gl display device'
  'qemu-pinning-hw-display-virtio-vga: for virtio-gpu-vga display device'
  'qemu-pinning-hw-display-virtio-vga-gl: for virtio-gpu-vga-gl display device'
  'qemu-pinning-hw-s390x-virtio-gpu-ccw: for s390x-virtio-gpu-ccw display device'
  'qemu-pinning-hw-usb-host: for USB host device'
  'qemu-pinning-hw-usb-redirect: for usbredir device'
  'qemu-pinning-hw-usb-smartcard: for USB smartcard device'
  'qemu-pinning-img: for manipulating disk images'
  'qemu-pinning-pr-helper: for persistent reservation utility'
  'qemu-pinning-system-aarch64: for AARCH64 system emulator'
  'qemu-pinning-system-alpha: for Alpha system emulator'
  'qemu-pinning-system-arm: for ARM system emulator'
  'qemu-pinning-system-avr: for AVR system emulator'
  'qemu-pinning-system-cris: for CRIS system emulator'
  'qemu-pinning-system-hppa: for HPPA system emulator'
  'qemu-pinning-system-m68k: for ColdFire (m68k) system emulator'
  'qemu-pinning-system-microblaze: for Microblaze system emulator'
  'qemu-pinning-system-mips: for MIPS system emulator'
  'qemu-pinning-system-nios2: for nios2 system emulator'
  'qemu-pinning-system-or1k: for OpenRisc32 system emulator'
  'qemu-pinning-system-ppc: for PPC system emulator'
  'qemu-pinning-system-riscv: for RISC-V system emulator'
  'qemu-pinning-system-rx: for RX system emulator'
  'qemu-pinning-system-s390x: for S390 system emulator'
  'qemu-pinning-system-sh4: for SH4 system emulator'
  'qemu-pinning-system-sparc: for SPARC system emulator'
  'qemu-pinning-system-tricore: for tricore system emulator'
  'qemu-pinning-system-x86: for x86 system emulator'
  'qemu-pinning-system-xtensa: for Xtensa system emulator'
  'qemu-pinning-tests: for QEMU tests'
  'qemu-pinning-tools: for QEMU tools'
  'qemu-pinning-ui-curses: for curses UI driver'
  'qemu-pinning-ui-dbus: for D-Bus UI driver'
  'qemu-pinning-ui-egl-headless: for EGL headless UI driver'
  'qemu-pinning-ui-gtk: for GTK UI driver'
  'qemu-pinning-ui-opengl: for OpenGL UI driver'
  'qemu-pinning-ui-sdl: for SDL UI driver'
  'qemu-pinning-ui-spice-app: for spice app UI driver'
  'qemu-pinning-ui-spice-core: for spice core UI driver'
  'qemu-pinning-user: for user mode emulation of QEMU targets'
  'qemu-pinning-vhost-user-gpu: for vhost-user-gpu display device'
  'qemu-pinning-virtiofsd: for virtio-fs shared filesystem daemon'
  'samba: for SMB/CIFS server support'
)

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

prepare() {
  # extract licenses for TCG
  sed -n '1,23p' ${_pkgname}-$pkgver/tcg/tcg-internal.h > tcg.LICENSE.MIT
  sed -n '1,23p' ${_pkgname}-$pkgver/tcg/arm/tcg-target.c.inc > tcg-arm.LICENSE.MIT
  sed -n '1,23p' ${_pkgname}-$pkgver/tcg/tci/tcg-target.h > tci.LICENSE.MIT

  # install qemu-pinning-pr-helper.socket to sockets.target
  sed -e 's/multi-user.target/sockets.target/g' -i ${_pkgname}-$pkgver/contrib/systemd/qemu-pr-helper.socket

  # create build dir
  mkdir -vp build
  mkdir -vp build-static

  cd ${_pkgname}-${pkgver}
  patch -p1 < ../qemu-pinning-$pkgver.patch
}

build() {
  # Build only minimal debug info to reduce size
  CFLAGS+=' -g1'
  CXXFLAGS+=' -g1'
  (
    cd build
    ../${_pkgname}-$pkgver/configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --libexecdir=/usr/lib/qemu \
      --localstatedir=/var \
      --docdir=/usr/share/doc/qemu \
      --enable-modules \
      --enable-sdl \
      --enable-slirp=system \
      --enable-tpm \
      --smbd=/usr/bin/smbd \
      --tls-priority=@QEMU,SYSTEM \
      --with-coroutine=ucontext
    ninja
  )

# TODO: qemu-pinning-user-static
#  (
#    cd build-static
#    ../${_pkgname}-$pkgver/configure \
#      --enable-attr \
#      --enable-linux-user \
#      --enable-tcg \
#      --disable-install-blobs \
#      --static
#    ninja
#  )
}

package_qemu-pinning-common() {
  license+=(BSD MIT)
  depends=(gcc-libs glib2 libglib-2.0.so libgmodule-2.0.so hicolor-icon-theme libcap-ng libcap-ng.so)
  install=$pkgname.install
  options=(!strip)

  meson install -C build --destdir "$pkgdir"

  install -vdm 755 "$pkgdir/usr/lib/binfmt.d/"
  ${_pkgname}-$pkgver/scripts/qemu-binfmt-conf.sh --systemd ALL --exportdir "$pkgdir/usr/lib/binfmt.d/" --qemu-path "/usr/bin"

# TODO: qemu-user-static
#  for _conf in "$pkgdir/usr/lib/binfmt.d/"*; do
#    cat "$_conf" | tr -d '\n' | sed "s/:$/-static:F/" > "${_conf//.conf/-static.conf}"
#  done
#
#  meson install -C build-static --destdir "$pkgdir"
#  for _src in "$pkgdir/usr/bin/qemu-"*; do
#    mv -v "$_src" "$pkgdir/usr/bin/$(basename  "$_src")-static"
#  done

  install -vDm 644 bridge.conf -t "$pkgdir/etc/${_pkgname}/"
  install -vDm 644 ${_pkgname}-$pkgver/${_pkgname}.sasl "$pkgdir/etc/sasl2/${_pkgname}.conf"
  install -vDm 644 ${_pkgname}-$pkgver/LICENSE *LICENSE* -t "$pkgdir/usr/share/licenses/${_pkgname}/"
  install -vDm 644 ${_pkgname}-sysusers.conf "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"

  # bridge_helper needs suid: https://bugs.archlinux.org/task/32565
  chmod u+s "$pkgdir/usr/lib/qemu/qemu-bridge-helper"

  # remoe invalid directory
  rm -frv "$pkgdir/var"

  # remove unneeded files
  find "$pkgdir" -name .buildinfo -delete

  # remove files provided by seabios
  rm -fv "$pkgdir/usr/share/${_pkgname}/"{bios,vgabios}*

  # remove files provided by edk2-{armvirt,ovmf}
  rm -fv "$pkgdir/usr/share/${_pkgname}/"edk2-*
  rm -frv "$pkgdir/usr/share/${_pkgname}/firmware"

  (
    # create man page symlinks for all system emulators
    cd "$pkgdir/usr/share/man/man1"
    for _name in qemu-system-{aarch64,alpha,arm,avr,cris,hppa,i386,m68k,microblaze{,el},mips{,64,64el,el},nios2,or1k,ppc{,64},riscv{32,64},rx,s390x,sh4{,eb},sparc{,64},tricore,x86_64,xtensa{,eb}}; do
      ln -sv ${_pkgname}.1.gz "$pkgdir/usr/share/man/man1/$_name.1.gz"
    done
  )

  (
    # pick files for all split packages
    cd "$pkgdir"

    _pick qemu-guest-agent usr/bin/qemu-ga
    _pick qemu-guest-agent usr/share/man/man8/qemu-ga.8*

    _pick qemu-audio-alsa usr/lib/qemu/audio-alsa.so
    _pick qemu-audio-dbus usr/lib/qemu/audio-dbus.so
    _pick qemu-audio-jack usr/lib/qemu/audio-jack.so
    _pick qemu-audio-oss usr/lib/qemu/audio-oss.so
    _pick qemu-audio-pa usr/lib/qemu/audio-pa.so
    _pick qemu-audio-sdl usr/lib/qemu/audio-sdl.so
    _pick qemu-audio-spice usr/lib/qemu/audio-spice.so

    _pick qemu-block-curl usr/lib/qemu/block-curl.so
    _pick qemu-block-dmg usr/lib/qemu/block-dmg*.so
    _pick qemu-block-gluster usr/lib/qemu/block-gluster.so
    _pick qemu-block-iscsi usr/lib/qemu/block-iscsi.so
    _pick qemu-block-nfs usr/lib/qemu/block-nfs.so
    _pick qemu-block-rbd usr/lib/qemu/block-rbd.so
    _pick qemu-block-ssh usr/lib/qemu/block-ssh.so

    _pick qemu-chardev-baum usr/lib/qemu/chardev-baum.so
    _pick qemu-chardev-spice usr/lib/qemu/chardev-spice.so

    _pick qemu-docs usr/share/doc/qemu

    _pick qemu-hw-display-qxl usr/lib/qemu/hw-display-qxl.so
    _pick qemu-hw-display-virtio-gpu usr/lib/qemu/hw-display-virtio-gpu.so
    _pick qemu-hw-display-virtio-gpu-gl usr/lib/qemu/hw-display-virtio-gpu-gl.so
    _pick qemu-hw-display-virtio-gpu-pci usr/lib/qemu/hw-display-virtio-gpu-pci.so
    _pick qemu-hw-display-virtio-gpu-pci-gl usr/lib/qemu/hw-display-virtio-gpu-pci-gl.so
    _pick qemu-hw-display-virtio-vga usr/lib/qemu/hw-display-virtio-vga.so
    _pick qemu-hw-display-virtio-vga-gl usr/lib/qemu/hw-display-virtio-vga-gl.so

    _pick qemu-hw-usb-host usr/lib/qemu/hw-usb-host.so
    _pick qemu-hw-usb-redirect usr/lib/qemu/hw-usb-redirect.so
    _pick qemu-hw-usb-smartcard usr/lib/qemu/hw-usb-smartcard.so

    _pick qemu-img usr/bin/qemu-{img,io,nbd,storage-daemon}
    _pick qemu-img usr/share/man/man1/qemu-{img,storage-daemon}.1*
    _pick qemu-img usr/share/man/man7/qemu-storage-daemon-qmp-ref.7*
    _pick qemu-img usr/share/man/man8/qemu-nbd.8*

    _pick qemu-pr-helper usr/bin/qemu-pr-helper
    _pick qemu-pr-helper usr/share/man/man8/qemu-pr-helper.8*

    _pick qemu-hw-s390x-virtio-gpu-ccw usr/lib/qemu/hw-s390x-virtio-gpu-ccw.so

    _pick qemu-system-aarch64 usr/bin/qemu-system-aarch64
    _pick qemu-system-aarch64 usr/share/man/man1/qemu-system-aarch64.1*

    _pick qemu-system-alpha usr/bin/qemu-system-alpha
    _pick qemu-system-alpha usr/share/qemu/palcode-clipper
    _pick qemu-system-alpha usr/share/man/man1/qemu-system-alpha.1*

    _pick qemu-system-arm usr/bin/qemu-system-arm
    _pick qemu-system-arm usr/share/qemu/npcm7xx_bootrom.bin
    _pick qemu-system-arm usr/share/man/man1/qemu-system-arm.1*

    _pick qemu-system-avr usr/bin/qemu-system-avr
    _pick qemu-system-avr usr/share/man/man1/qemu-system-avr.1*

    _pick qemu-system-cris usr/bin/qemu-system-cris
    _pick qemu-system-cris usr/share/man/man1/qemu-system-cris.1*

    _pick qemu-system-hppa usr/bin/qemu-system-hppa
    _pick qemu-system-hppa usr/share/qemu/hppa-firmware.img
    _pick qemu-system-hppa usr/share/man/man1/qemu-system-hppa.1*

    _pick qemu-system-m68k usr/bin/qemu-system-m68k
    _pick qemu-system-m68k usr/share/man/man1/qemu-system-m68k.1*

    _pick qemu-system-microblaze usr/bin/qemu-system-microblaze{,el}
    _pick qemu-system-microblaze usr/share/qemu/petalogix-*.dtb
    _pick qemu-system-microblaze usr/share/man/man1/qemu-system-microblaze{,el}.1*

    _pick qemu-system-mips usr/bin/qemu-system-mips{,64,64el,el}
    _pick qemu-system-mips usr/share/man/man1/qemu-system-mips{,64,64el,el}.1*

    _pick qemu-system-nios2 usr/bin/qemu-system-nios2
    _pick qemu-system-nios2 usr/share/man/man1/qemu-system-nios2.1*

    _pick qemu-system-or1k usr/bin/qemu-system-or1k
    _pick qemu-system-or1k usr/share/man/man1/qemu-system-or1k.1*

    _pick qemu-system-ppc usr/bin/qemu-system-ppc{,64}
    _pick qemu-system-ppc usr/share/qemu/{bamboo,canyonlands}.dtb
    # NOTE: needs to be replaced by openbios
    _pick qemu-system-ppc usr/share/qemu/openbios-ppc
    _pick qemu-system-ppc usr/share/qemu/qemu_vga.ndrv
    _pick qemu-system-ppc usr/share/qemu/skiboot.lid
    # NOTE: needs to be replaced by slof
    _pick qemu-system-ppc usr/share/qemu/slof.bin
    _pick qemu-system-ppc usr/share/qemu/u-boot.e500
    _pick qemu-system-ppc usr/share/qemu/u-boot-sam460-20100605.bin
    _pick qemu-system-ppc usr/share/man/man1/qemu-system-ppc{,64}.1*

    _pick qemu-system-riscv usr/bin/qemu-system-riscv{32,64}
    _pick qemu-system-riscv usr/share/qemu/opensbi-riscv{32,64}*.bin
    _pick qemu-system-riscv usr/share/man/man1/qemu-system-riscv{32,64}.1*

    _pick qemu-system-rx usr/bin/qemu-system-rx
    _pick qemu-system-rx usr/share/man/man1/qemu-system-rx.1*

    _pick qemu-system-s390x usr/bin/qemu-system-s390x
    _pick qemu-system-s390x usr/share/qemu/s390-{ccw,netboot}.img
    _pick qemu-system-s390x usr/share/man/man1/qemu-system-s390x.1*

    _pick qemu-system-sh4 usr/bin/qemu-system-sh4{,eb}
    _pick qemu-system-sh4 usr/share/man/man1/qemu-system-sh4{,eb}.1*

    _pick qemu-system-sparc usr/bin/qemu-system-sparc{,64}
    # NOTE: needs to be replaced by openbios
    _pick qemu-system-sparc usr/share/qemu/openbios-sparc{32,64}
    _pick qemu-system-sparc usr/share/qemu/QEMU,{cgthree,tcx}.bin
    _pick qemu-system-sparc usr/share/man/man1/qemu-system-sparc{,64}.1*

    _pick qemu-system-tricore usr/bin/qemu-system-tricore
    _pick qemu-system-tricore usr/share/man/man1/qemu-system-tricore.1*

    _pick qemu-system-x86 usr/bin/qemu-system-{i386,x86_64}
    _pick qemu-system-x86 usr/lib/qemu/accel-tcg-{i386,x86_64}.so
    _pick qemu-system-x86 usr/share/qemu/{kvmvapic,linuxboot,multiboot{,_dma},pvh}.bin
    _pick qemu-system-x86 usr/share/qemu/qboot.rom
    # NOTE: needs to be replaced by sgabios
    _pick qemu-system-x86 usr/share/qemu/sgabios.bin
    _pick qemu-system-x86 usr/share/man/man1/qemu-system-{i386,x86_64}.1*

    _pick qemu-system-xtensa usr/bin/qemu-system-xtensa{,eb}
    _pick qemu-system-xtensa usr/share/man/man1/qemu-system-xtensa{,eb}.1*

    _pick qemu-tests usr/lib/qemu/accel-qtest-*.so

    _pick qemu-tools usr/bin/{elf2dmp,qemu-{edid,keymap}}
    _pick qemu-tools usr/share/qemu/trace-events-all

    _pick qemu-ui-curses usr/lib/qemu/ui-curses.so
    _pick qemu-ui-dbus usr/lib/qemu/ui-dbus.so
    _pick qemu-ui-egl-headless usr/lib/qemu/ui-egl-headless.so
    _pick qemu-ui-gtk usr/lib/qemu/ui-gtk.so
    _pick qemu-ui-opengl usr/lib/qemu/ui-opengl.so
    _pick qemu-ui-sdl usr/lib/qemu/ui-sdl.so
    _pick qemu-ui-spice-app usr/lib/qemu/ui-spice-app.so
    _pick qemu-ui-spice-core usr/lib/qemu/ui-spice-core.so

#    _pick qemu-user-static usr/bin/qemu-*-static
#    _pick qemu-user-static usr/lib/binfmt.d/*-static.conf

    _pick qemu-user usr/bin/qemu-{aarch64{,_be},alpha,arm{,eb},cris,hexagon,hppa,i386,m68k,microblaze{,el},mips{,64,64el,el,n32,n32el},nios2,or1k,ppc{,64,64le},riscv{32,64},s390x,sh4{,eb},sparc{,32plus,64},x86_64,xtensa{,eb}}
    _pick qemu-user usr/lib/binfmt.d/*.conf

    _pick qemu-vhost-user-gpu usr/lib/qemu/vhost-user-gpu
    _pick qemu-vhost-user-gpu usr/share/qemu/vhost-user/50-qemu-gpu.json

    _pick qemu-virtiofsd usr/lib/qemu/virtiofsd
    _pick qemu-virtiofsd usr/share/man/man1/virtiofsd.1*
    _pick qemu-virtiofsd usr/share/qemu/vhost-user/50-qemu-virtiofsd.json
  )
}

package_qemu-pinning-audio-alsa() {
  pkgdesc="QEMU ALSA audio driver"
  depends=(alsa-lib libasound.so glibc qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-audio-dbus() {
  pkgdesc="QEMU D-Bus audio driver"
  depends=(gcc-libs glib2 libgio-2.0.so libgobject-2.0.so libglib-2.0.so glibc qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-audio-jack() {
  pkgdesc="QEMU JACK audio driver"
  depends=(jack libjack.so glibc qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-audio-oss() {
  pkgdesc="QEMU OSS audio driver"
  depends=(glibc qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-audio-pa() {
  pkgdesc="QEMU PulseAudio audio driver"
  depends=(glibc libpulse libpulse.so qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-audio-sdl() {
  pkgdesc="QEMU SDL audio driver"
  depends=(glibc qemu-pinning-common sdl2)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-audio-spice() {
  pkgdesc="QEMU spice audio driver"
  depends=(glibc qemu-pinning-common qemu-pinning-ui-spice-core spice libspice-server.so)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-block-curl() {
  pkgdesc="QEMU curl block driver"
  depends=(curl libcurl.so gcc-libs glibc qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-block-dmg() {
  pkgdesc="QEMU DMG block driver"
  depends=(bzip2 libbz2.so glibc qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-block-gluster() {
  pkgdesc="QEMU Gluster block driver"
  depends=(glibc glusterfs qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-block-iscsi() {
  pkgdesc="QEMU iSCSI block driver"
  depends=(gcc-libs glibc libiscsi qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-block-nfs() {
  pkgdesc="QEMU NFS block driver"
  depends=(gcc-libs glibc libnfs qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-block-rbd() {
  pkgdesc="QEMU Ceph/RBD block driver"
  depends=(ceph-libs glibc qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-block-ssh() {
  pkgdesc="QEMU SSH block driver"
  depends=(gcc-libs glibc libssh libssh.so qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-chardev-baum() {
  pkgdesc="QEMU Baum chardev driver"
  depends=(brltty libbrlapi.so glibc qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-chardev-spice() {
  pkgdesc="QEMU spice chardev driver"
  depends=(libspice-server.so glibc qemu-pinning-common qemu-pinning-ui-spice-core)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-docs() {
  pkgdesc+=" - documentation"
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-guest-agent() {
  pkgdesc="QEMU Guest Agent"
  depends=(gcc-libs glib2 libglib-2.0.so libgmodule-2.0.so glibc liburing liburing.so systemd-libs libudev.so)
  backup=(
    etc/${_pkgname}/${_pkgname}-ga.conf
    etc/${_pkgname}/fsfreeze-hook
  )
  install=$pkgname.install
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
  install -vDm 644 ${_pkgname}-$pkgver/contrib/systemd/${pkgname/-pinning/}.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 99-${pkgname/-pinning/}.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -vDm 644 ${_pkgname}-ga.conf -t "$pkgdir/etc/${_pkgname}/"
  install -vDm 644 ${_pkgname}-$pkgver/scripts/${pkgname/-pinning/}/fsfreeze-hook -t "$pkgdir/etc/${_pkgname}/"
  install -vdm 755 "$pkgdir/etc/${_pkgname}/fsfreeze-hook.d"
}

package_qemu-pinning-hw-display-qxl() {
  pkgdesc="QEMU QXL display device"
  depends=(gcc-libs glibc pixman libpixman-1.so qemu-pinning-common qemu-pinning-ui-spice-core spice libspice-server.so)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-hw-display-virtio-gpu() {
  pkgdesc="QEMU virtio-gpu display device"
  depends=(glibc pixman libpixman-1.so qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-hw-display-virtio-gpu-gl() {
  pkgdesc="QEMU virtio-gpu-gl display device"
  depends=(glibc qemu-pinning-common virglrenderer)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-hw-display-virtio-gpu-pci() {
  pkgdesc="QEMU virtio-gpu-pci display device"
  depends=(qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-hw-display-virtio-gpu-pci-gl() {
  pkgdesc="QEMU virtio-gpu-pci-gl display device"
  depends=(qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-hw-display-virtio-vga() {
  pkgdesc="QEMU virtio-vga display device"
  depends=(qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-hw-display-virtio-vga-gl() {
  pkgdesc="QEMU virtio-vga-gl display device"
  depends=(qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-hw-s390x-virtio-gpu-ccw() {
  pkgdesc="QEMU s390x-virtio-gpu-ccw display device"
  depends=(qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-aarch64() {
  pkgdesc="QEMU system emulator for AARCH64"
  depends=("${_qemu_system_deps[@]}" edk2-armvirt systemd-libs libudev.so)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-alpha() {
  pkgdesc="QEMU system emulator for Alpha"
  depends=("${_qemu_system_deps[@]}" systemd-libs libudev.so)
  options=(!strip)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-arm() {
  pkgdesc="QEMU system emulator for ARM"
  depends=("${_qemu_system_deps[@]}" systemd-libs libudev.so)
  options=(!strip)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-avr() {
  pkgdesc="QEMU system emulator for AVR"
  depends=("${_qemu_system_deps[@]}")
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-cris() {
  pkgdesc="QEMU system emulator for CRIS"
  depends=("${_qemu_system_deps[@]}")
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-hppa() {
  pkgdesc="QEMU system emulator for HPPA"
  depends=("${_qemu_system_deps[@]}" systemd-libs libudev.so)
  options=(!strip)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-m68k() {
  pkgdesc="QEMU system emulator for ColdFire (m68k)"
  depends=("${_qemu_system_deps[@]}")
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-microblaze() {
  pkgdesc="QEMU system emulator for Microblaze"
  depends=("${_qemu_system_deps[@]}")
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-mips() {
  pkgdesc="QEMU system emulator for MIPS"
  depends=("${_qemu_system_deps[@]}" systemd-libs libudev.so)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-nios2() {
  pkgdesc="QEMU system emulator for nios2"
  depends=("${_qemu_system_deps[@]}")
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-or1k() {
  pkgdesc="QEMU system emulator for OpenRisc32"
  depends=("${_qemu_system_deps[@]}")
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-ppc() {
  pkgdesc="QEMU system emulator for PPC"
  # NOTE: will require openbios
  depends=("${_qemu_system_deps[@]}" systemd-libs libudev.so)
  options=(!strip)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-riscv() {
  pkgdesc="QEMU system emulator for RISC-V"
  depends=("${_qemu_system_deps[@]}" systemd-libs libudev.so)
  options=(!strip)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-rx() {
  pkgdesc="QEMU system emulator for RX"
  depends=("${_qemu_system_deps[@]}")
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-s390x() {
  pkgdesc="QEMU system emulator for S390"
  depends=("${_qemu_system_deps[@]}")
  options=(!strip)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-sh4() {
  pkgdesc="QEMU system emulator for SH4"
  depends=("${_qemu_system_deps[@]}" systemd-libs libudev.so)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-sparc() {
  pkgdesc="QEMU system emulator for SPARC"
  # NOTE: will require openbios
  depends=("${_qemu_system_deps[@]}" systemd-libs libudev.so)
  options=(!strip)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-tricore() {
  pkgdesc="QEMU system emulator for tricore"
  depends=("${_qemu_system_deps[@]}")
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-x86() {
  pkgdesc="QEMU system emulator for x86"
  depends=("${_qemu_system_deps[@]}" edk2-ovmf seabios systemd-libs libudev.so)
  options=(!strip)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-system-xtensa() {
  pkgdesc="QEMU system emulator for Xtensa"
  depends=("${_qemu_system_deps[@]}" systemd-libs libudev.so)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-hw-usb-host() {
  pkgdesc="QEMU USB host device"
  depends=(glibc libusb libusb-1.0.so qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-hw-usb-redirect() {
  pkgdesc="QEMU usbredir device"
  depends=(gcc-libs glibc qemu-pinning-common usbredir)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-hw-usb-smartcard() {
  pkgdesc="QEMU USB smartcard device"
  depends=(gcc-libs libcacard glib2 libglib-2.0.so glibc qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-img() {
  pkgdesc="QEMU tooling for manipulating disk images"
  depends=(fuse3 gcc-libs glib2 libglib-2.0.so libgmodule-2.0.so glibc gnutls libaio liburing liburing.so pam libpam.so zlib zstd libzstd.so)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-pr-helper() {
  pkgdesc="QEMU persistent reservation utility"
  depends=(gcc-libs glib2 libglib-2.0.so libgmodule-2.0.so glibc gnutls libcap-ng libcap-ng.so liburing liburing.so multipath-tools pam libpam.so qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
  install -vDm 644 ${_pkgname}-$pkgver/contrib/systemd/${pkgname/-pinning/}.{service,socket} -t "$pkgdir/usr/lib/systemd/system/"
}

package_qemu-pinning-tests() {
  pkgdesc="QEMU tests"
  depends=(qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-tools() {
  pkgdesc="QEMU tools"
  depends=(curl libcurl.so gcc-libs glib2 libglib-2.0.so libgmodule-2.0.so glibc libxkbcommon libxkbcommon.so python qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
  install -vDm 644 ${_pkgname}-$pkgver/scripts/dump-guest-memory.py -t "$pkgdir/usr/share/${_pkgname}/"
  install -vDm 755 ${_pkgname}-$pkgver/scripts/simpletrace.py -t "$pkgdir/usr/share/${_pkgname}/"
  install -vDm 644 ${_pkgname}-$pkgver/scripts/tracetool/*.py -t "$pkgdir/usr/share/${_pkgname}/tracetool/"
  install -vDm 644 ${_pkgname}-$pkgver/scripts/tracetool/backend/*.py -t "$pkgdir/usr/share/${_pkgname}/tracetool/backend/"
  install -vDm 644 ${_pkgname}-$pkgver/scripts/tracetool/format/*.py -t "$pkgdir/usr/share/${_pkgname}/tracetool/format/"
}

package_qemu-pinning-ui-curses() {
  pkgdesc="QEMU curses UI driver"
  depends=(gcc-libs glib2 libglib-2.0.so glibc ncurses libncursesw.so qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-ui-dbus() {
  pkgdesc="QEMU D-Bus UI driver"
  depends=(gcc-libs glib2 libgio-2.0.so libgobject-2.0.so libglib-2.0.so glibc libepoxy pixman libpixman-1.so qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-ui-egl-headless() {
  pkgdesc="QEMU EGL headless UI driver"
  depends=(glibc libepoxy qemu-pinning-common qemu-pinning-ui-opengl)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-ui-gtk() {
  pkgdesc="QEMU GTK UI driver"
  depends=(
    cairo
    gcc-libs
    gdk-pixbuf2 libgdk_pixbuf-2.0.so
    glib2 libgobject-2.0.so libglib-2.0.so
    glibc
    gtk3 libgdk-3.so libgtk-3.so
    libepoxy
    libx11
    pixman libpixman-1.so
    qemu-pinning-common
    qemu-pinning-ui-opengl
    vte3 libvte-2.91.so
  )
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-ui-opengl() {
  pkgdesc="QEMU OpenGL UI driver"
  depends=(glibc libepoxy mesa pixman libpixman-1.so qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-ui-sdl() {
  pkgdesc="QEMU SDL UI driver"
  depends=(glib2 libglib-2.0.so glibc libx11 pixman libpixman-1.so qemu-pinning-common sdl2_image sdl2)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-ui-spice-app() {
  pkgdesc="QEMU spice app UI driver"
  depends=(glib2 libgio-2.0.so libglib-2.0.so glibc qemu-pinning-common qemu-pinning-chardev-spice qemu-pinning-ui-spice-core)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-ui-spice-core() {
  pkgdesc="QEMU spice core UI driver"
  depends=(gcc-libs glibc pixman libpixman-1.so qemu-pinning-common qemu-pinning-ui-opengl spice libspice-server.so)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-user() {
  pkgdesc="QEMU user mode emulation"
  depends=(gcc-libs glib2 libglib-2.0.so libgmodule-2.0.so glibc gnutls liburing liburing.so qemu-pinning-common zlib)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

# package_qemu-pinning-user-static() {
#   pkgdesc="QEMU static user mode emulation"
#   depends=(glibc)
#   mv -v ${pkgname/-pinning/}/* "$pkgdir"
# }

package_qemu-pinning-vhost-user-gpu() {
  pkgdesc="QEMU vhost-user-gpu display device"
  depends=(gcc-libs glib2 libglib-2.0.so libgmodule-2.0.so glibc pixman libpixman-1.so mesa qemu-pinning-common virglrenderer)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-virtiofsd() {
  pkgdesc="QEMU virtio-fs shared filesystem daemon"
  depends=(gcc-libs glib2 libglib-2.0.so libgmodule-2.0.so glibc libcap-ng libcap-ng.so libseccomp libseccomp.so qemu-pinning-common)
  mv -v ${pkgname/-pinning/}/* "$pkgdir"
}

package_qemu-pinning-base() {
  pkgdesc="A basic QEMU setup for headless environments"
  depends=(
    qemu-pinning-common
    qemu-pinning-audio-spice
    qemu-pinning-block-{curl,dmg,nfs,ssh}
    qemu-pinning-chardev-spice
    qemu-pinning-hw-display-{qxl,virtio-gpu{,-{gl,pci,pci-gl}}}
    qemu-pinning-hw-display-virtio-vga{,-gl}
    qemu-pinning-hw-s390x-virtio-gpu-ccw
    qemu-pinning-hw-usb-{host,redirect,smartcard}
    qemu-pinning-img
    qemu-pinning-pr-helper
    qemu-pinning-system-x86
    qemu-pinning-tools
    qemu-pinning-ui-{curses,spice-{app,core}}
    qemu-pinning-virtiofsd
  )
  optdepends=("${_qemu_optdepends[@]}")
  # TODO: remove conflicts/provides/replaces for qemu-pinning-headless after 2022-10-01
  conflicts=(qemu qemu-headless)
  provides=(qemu=$pkgver qemu-headless)
  replaces=(qemu-pinning-headless)
}

package_qemu-pinning-desktop() {
  pkgdesc="A QEMU setup for desktop environments"
  depends=(
    qemu-pinning-common
    qemu-pinning-audio-{alsa,dbus,jack,oss,pa,sdl,spice}
    qemu-pinning-block-{curl,dmg,nfs,ssh}
    qemu-pinning-chardev-spice
    qemu-pinning-hw-display-{qxl,virtio-gpu{,-{gl,pci,pci-gl}}}
    qemu-pinning-hw-display-virtio-vga{,-gl}
    qemu-pinning-hw-s390x-virtio-gpu-ccw
    qemu-pinning-hw-usb-{host,redirect,smartcard}
    qemu-pinning-img
    qemu-pinning-pr-helper
    qemu-pinning-system-x86
    qemu-pinning-tools
    qemu-pinning-ui-{curses,dbus,egl-headless,gtk,opengl,sdl,spice-{app,core}}
    qemu-pinning-vhost-user-gpu
    qemu-pinning-virtiofsd
  )
  optdepends=("${_qemu_optdepends[@]}")
  conflicts=(qemu)
  provides=(qemu=$pkgver)
  replaces=('qemu-pinning<7')
}

package_qemu-pinning-emulators-full() {
  pkgdesc="All QEMU user mode and system emulators"
  depends=(
    qemu-pinning-system-{aarch64,alpha,arm,avr,cris,hppa,m68k,microblaze,mips,nios2,or1k,ppc,riscv,rx,s390x,sh4,sparc,tricore,x86,xtensa}
    qemu-pinning-user
  )
  # TODO: remove conflicts/provides/replaces after 2022-10-01
  conflicts=(qemu-pinning-arch-extra qemu-pinning-headless-arch-extra)
  provides=(qemu-pinning-arch-extra qemu-pinning-headless-arch-extra)
  replaces=(qemu-pinning-arch-extra qemu-pinning-headless-arch-extra)
}

package_qemu-pinning-full() {
  pkgdesc="A full QEMU setup"
  depends=(
    qemu-pinning-common
    qemu-pinning-audio-{alsa,dbus,jack,oss,pa,sdl,spice}
    qemu-pinning-block-{curl,dmg,gluster,iscsi,nfs,rbd,ssh}
    qemu-pinning-chardev-{baum,spice}
    qemu-pinning-docs
    qemu-pinning-hw-display-{qxl,virtio-{gpu{,-{gl,pci,pci-gl}},vga{,-gl}}}
    qemu-pinning-hw-s390x-virtio-gpu-ccw
    qemu-pinning-hw-usb-{host,redirect,smartcard}
    qemu-pinning-img
    qemu-pinning-pr-helper
    qemu-pinning-system-{aarch64,alpha,arm,avr,cris,hppa,m68k,microblaze,mips,nios2,or1k,ppc,riscv,rx,s390x,sh4,sparc,tricore,x86,xtensa}
    qemu-pinning-tests
    qemu-pinning-tools
    qemu-pinning-ui-{curses,dbus,egl-headless,gtk,opengl,sdl,spice-{app,core}}
    qemu-pinning-user
    qemu-pinning-vhost-user-gpu
    qemu-pinning-virtiofsd
  )
  optdepends=("${_qemu_optdepends[@]}")
  conflicts=(qemu)
  provides=(qemu=$pkgver)
}

# vim:set ts=2 sw=2 et:
