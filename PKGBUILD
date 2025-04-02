# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

pkgbase=qemu-rutabaga
pkgname=(
  qemu-full-rutabaga
  qemu-system-firmware-rutabaga
)
pkgver=9.2.3
pkgrel=1
pkgdesc="A full QEMU setup with Rutabaga Virtual Graphics Interface support"
arch=(x86_64)
url="https://www.qemu.org/"
license=(
  BSD-2-Clause
  BSD-2-Clause-Patent
  BSD-3-Clause
  CC0-1.0
  FSFAP
  GPL-1.0-or-later
  GPL-2.0-only
  'GPL-2.0-only WITH Linux-syscall-note'
  'GPL-2.0-only WITH Linux-syscall-note OR BSD-2-Clause'
  'GPL-2.0-only WITH Linux-syscall-note OR BSD-3-Clause'
  GPL-2.0-or-later
  'GPL-2.0-or-later OR BSD-3-Clause'
  'GPL-2.0-or-later WITH Linux-syscall-note'
  ISC
  'LGPL-2.1-only OR BSD-3-Clause'
  LGPL-2.0-or-later
  LGPL-2.1-or-later
  LicenseRef-Public-Domain
  MIT
)
depends=(
  rutabaga-ffi
  alsa-lib libasound.so
  brltty libbrlapi.so
  bzip2 libbz2.so
  cairo
  capstone
  curl libcurl.so
  dtc
  edk2-aarch64 edk2-arm edk2-ovmf
  fuse3
  gcc-libs
  gdk-pixbuf2 libgdk_pixbuf-2.0.so
  glib2 libglib-2.0.so libgio-2.0.so libgmodule-2.0.so libgobject-2.0.so
  glibc
  glusterfs
  gnutls
  gtk3 libgdk-3.so libgtk-3.so
  hicolor-icon-theme
  jack libjack.so
  keyutils
  libaio
  libbpf libbpf.so
  libcacard
  libcap-ng libcap-ng.so
  libcbor libcbor.so
  libelf
  libepoxy
  libiscsi
  libjpeg-turbo libjpeg.so
  libnfs
  libpipewire libpipewire-0.3.so
  libpng
  libpulse libpulse.so
  libsasl
  libseccomp libseccomp.so
  libslirp libslirp.so
  libssh libssh.so
  liburing liburing.so
  libusb libusb-1.0.so
  libx11
  libxdp libxdp.so
  libxkbcommon libxkbcommon.so
  lzo
  mesa
  multipath-tools
  ncurses libncursesw.so
  ndctl
  numactl libnuma.so
  pam libpam.so
  pixman libpixman-1.so
  python
  sdl2 sdl2_image
  seabios
  snappy
  spice libspice-server.so
  systemd-libs libudev.so
  usbredir
  vde2
  virglrenderer
  virtiofsd
  vte3 libvte-2.91.so
  zlib
  zstd libzstd.so
)
makedepends=(
  alsa-lib
  brltty
  bzip2
  cairo
  capstone
  curl
  dtc
  fuse3
  gcc-libs
  gdk-pixbuf2
  glib2
  glib2-devel
  glusterfs
  gnutls
  gtk3
  jack
  keyutils
  libaio
  libbpf
  libcacard
  libcap-ng
  libcbor
  libepoxy
  libiscsi
  libnfs
  libpipewire
  libpng
  libpulse
  libsasl
  libseccomp
  libslirp
  libssh
  liburing
  libusb
  libx11
  libxdp
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
  pcre2
  python
  python-distlib
  python-setuptools
  python-pip
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
conflicts=(
  qemu-{base,desktop,emulators-full,full}
  qemu-audio-{alsa,dbus,jack,oss,pa,pipewire,sdl,spice}
  qemu-block-{curl,dmg,gluster,iscsi,nfs,ssh}
  qemu-chardev-{baum,spice}
  qemu-common
  qemu-docs
  qemu-hw-display-{qxl,virtio-{gpu{,-{gl,pci,pci-gl}},vga{,-gl}}}
  qemu-hw-s390x-virtio-gpu-ccw
  qemu-hw-usb-{host,redirect,smartcard}
  qemu-img
  qemu-pr-helper
  qemu-system-{aarch64,alpha,arm,avr,hppa,loongarch64,m68k,microblaze,mips,or1k,ppc,riscv,rx,s390x,sh4,sparc,tricore,x86,xtensa}
  qemu-system-cris
  qemu-system-nios2
  qemu-system-x86
  qemu-tests
  qemu-tools
  qemu-ui-{curses,dbus,egl-headless,gtk,opengl,sdl,spice-{app,core}}
  qemu-user
  qemu-vhost-user-gpu
  qemu-vmsr-helper
)
provides=(qemu=$pkgver "${conflicts[@]}")
source=(
  https://download.qemu.org/qemu-$pkgver.tar.xz{,.sig}
  bridge.conf
  qemu-ga.conf
  qemu-sysusers.conf
  65-kvm.rules
  99-qemu-guest-agent.rules
  qemu-8.1.1-static_regression.patch
  qemu-9.2.2-libnfs6.patch
)
sha512sums=('941a4337a115c65de2fca042932efb31886114f4300226fcf55f04c2c5471bd2b5ce220c4b17e01c3679bd55ba08a1aa7ce399de15e3e5f28c17da52030b139e'
            'SKIP'
            '7b412ffa5dcda47b0a4ec9e2c5e5e1d9eaaaf0a087b7ea3ead3e706ba4c9cafb919beadd088a0299b6f7aab753b81a5eafb545b4842ee5f26646d16544dd02a7'
            '6e838773d63ae0ffdffe2b891bf611d8f5f3c67a9bc4cbbedf8363c150c2c9971c8e44d92270bc581af40eb0ece02192760bcdd6aee229fff55635f3a4825afa'
            '985c2c7a6b5217c87a15b45368089ee91b2f9027b070f9eafa448a18b27ae0d9edd964d52e134b9c1f4aeef4d6aae88afd3f454551ca898affef7f9d28b99b8f'
            'bdf05f99407491e27a03aaf845b7cc8acfa2e0e59968236f10ffc905e5e3d5e8569df496fd71c887da2b5b8d1902494520c7da2d3a8258f7fd93a881dd610c99'
            '93b905046fcea8a0a89513b9259c222494ab3b91319dde23baebcb40dc17376a56661b159b99785d6e816831974a0f3cbd7b2f7d89e5fc3c258f88f4492f3839'
            'c7d086a951e9a378434ea95a843a4b01f0eb2ae430135a81365147cf6806a7ba1b49014a3aa66904970853ba84a4a28dbaded7bccb99a0bc3730572c80fb8b12'
            '7949b1435ed979836c59149b4b06b80fe14fa89ef12d1e027860df392e2ffdaf4a0f881021f80b4ee56e8657068bf7f2c6415c9891f34c32228b9d35e9359c8f')
b2sums=('cdc7300288d2efc50262c605707caab64638fbf1d7528576a0bce71efc1403ccd6aa647a984c84a5ab8ebca28ea9ee7cd8682b4098ca2e63a2f76d2de577c181'
        'SKIP'
        'b1eca364aa60f130ff5e649f5d004d3fcb75356d3421a4542efdfc410d39b40d9434d15e1dd7bbdbd315cb72b5290d3ea5f77f9c41961a5601cd28ef7bbe72e8'
        '2102e4a34e11e406e9606c97e026e7b92e887e296a7f77b9cede1b37119d0df33735f3588628167b2b8e32244c196c491bfab623e2caddac9014d445aa2a6d98'
        '69177b962d2fda20cafdbc6226fd017b5ca5a0f69f866d055dc1c744b7b2955059f47c693cfb5b4c863ec159569fdabd4327ab4b8a95566a68cd8ce38e339c7a'
        '3559fe9c4f744194939770047a0a02d07ff791c845a80726d0bc7b8c4801ed5f11150e7d5adab813844b3dab1cf38c3a5a87fb6efbb8fc9dccdda9fa56409ed8'
        'a9a2bdfeeb44eb86cbe88ac7c65f72800bdb2fd5cecb02f3a258cf9470b52832180aab43c89d481f7fd4d067342a9a27dd6c8a94d625b95d6e2b912e47d274e7'
        '209ec05e161d157aaa08a9fcbea45cf87aa22fe9360f9b3c477a78a274e4ecee989c16121f9e6b7765bb479c9db718c98db047c27fd426c127c4c95e28877a16'
        '16fe3a16eb874a69324ae42ba9f96deacb832e8cf9123cafb7f5148fbc3c84a2c78876b8fc62b9b9abefabfcfdcdbcfc1955040368d4dc1b3d4ccd719ec9b410')
validpgpkeys=('CEACC9E15534EBABB82D3FA03353C9CEF108B584') # Michael Roth <flukshun@gmail.com>

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -vp "$(dirname "$d")"
    mv -v "$f" "$d"
    rmdir -vp --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

# install the license files to that of qemu-common
_install_licenses() {
  install -vDm 644 qemu-$pkgver/LICENSE ./*LICENSE*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 qemu-$pkgver/tests/uefi-test-tools/LICENSE "$pkgdir/usr/share/licenses/$pkgname/BSD-2-Clause.txt"
  install -vDm 644 qemu-$pkgver/pc-bios/edk2-licenses.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

prepare() {
  # fix crash with static binaries: https://gitlab.com/qemu-project/qemu/-/issues/1913
  patch -Np1 -d qemu-$pkgver -i ../qemu-8.1.1-static_regression.patch

  # support libnfs 6 (LIBNFS_API_V2)
  patch -Np1 -d qemu-$pkgver -i ../qemu-9.2.2-libnfs6.patch

  # extract licenses for TCG
  sed -n '1,23p' qemu-$pkgver/tcg/tcg-internal.h > tcg.LICENSE.MIT.txt
  sed -n '1,23p' qemu-$pkgver/tcg/arm/tcg-target.c.inc > tcg-arm.LICENSE.MIT.txt
  sed -n '1,23p' qemu-$pkgver/tcg/tci/tcg-target.h > tci.LICENSE.MIT.txt

  # extract licenses for audio
  sed -n '2,4p' qemu-$pkgver/audio/sndioaudio.c > audio.LICENSE.ISC.txt

  # extract licenses for linux headers
  sed -n '3,33p' qemu-$pkgver/include/standard-headers/linux/fuse.h > fuse.LICENSE.BSD-2-Clause.txt

  # install qemu-pr-helper.socket and qemu-vmsr-helper.socket to sockets.target
  sed -e 's/multi-user.target/sockets.target/g' -i qemu-$pkgver/contrib/systemd/*.socket

  # create build dir
  mkdir -vp build
}

build() {
  local common_configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --libexecdir=/usr/lib/qemu
    --localstatedir=/var
    --docdir=/usr/share/doc/qemu
  )
  local configure_options=(
    "${common_configure_options[@]}"
    --enable-modules
    --enable-sdl
    --enable-slirp
    --enable-tpm
    --enable-rutabaga-gfx
    --smbd=/usr/bin/smbd
    --with-coroutine=ucontext
  )

  # Build only minimal debug info to reduce size
  CFLAGS+=' -g1'
  CXXFLAGS+=' -g1'

  (
    cd build
    ../qemu-$pkgver/configure "${configure_options[@]}"
    ninja
  )

}

package_qemu-full-rutabaga() {
  local binfmt_conf_options=(
    --systemd ALL
    --exportdir "$pkgdir/usr/lib/binfmt.d/"
    --qemu-path "/usr/bin"
    --persistent yes
    --preserve-argv0 yes
  )

  depends=("${depends[@]}" qemu-system-firmware-rutabaga=$pkgver-$pkgrel)
  backup=(
    etc/qemu/bridge.conf
    etc/sasl2/qemu.conf
  )
  install=qemu-common.install

  meson install -C build --destdir "$pkgdir"

  install -vdm 755 "$pkgdir/usr/lib/binfmt.d/"
  qemu-$pkgver/scripts/qemu-binfmt-conf.sh "${binfmt_conf_options[@]}"

  install -vDm 644 bridge.conf -t "$pkgdir/etc/qemu/"
  install -vDm 644 qemu-$pkgver/qemu.sasl "$pkgdir/etc/sasl2/qemu.conf"
  install -vDm 644 qemu-sysusers.conf "$pkgdir/usr/lib/sysusers.d/qemu.conf"

  _install_licenses

  # bridge_helper needs suid: https://bugs.archlinux.org/task/32565
  chmod u+s "$pkgdir/usr/lib/qemu/qemu-bridge-helper"

  # remoe invalid directory
  rm -frv "$pkgdir/var"

  # remove unneeded files
  find "$pkgdir" -name .buildinfo -delete

  # remove files provided by seabios
  rm -fv "$pkgdir/usr/share/qemu/"{bios,vgabios}*

  # remove files provided by edk2-{aarch64,arm,ovmf}
  rm -fv "$pkgdir/usr/share/qemu/"edk2-*
  rm -frv "$pkgdir/usr/share/qemu/firmware"

  (
    # create man page symlinks for all system emulators
    cd "$pkgdir/usr/share/man/man1"
    for _name in qemu-system-{aarch64,alpha,arm,avr,hppa,i386,loongarch64,m68k,microblaze{,el},mips{,64,64el,el},or1k,ppc{,64},riscv{32,64},rx,s390x,sh4{,eb},sparc{,64},tricore,x86_64,xtensa{,eb}}; do
      ln -sv qemu.1.gz "$pkgdir/usr/share/man/man1/$_name.1.gz"
    done
  )

  (
    # pick files for all split packages
    cd "$pkgdir"

    # not needed for qemu-full
    _pick qemu-guest-agent usr/bin/qemu-ga
    _pick qemu-guest-agent usr/share/man/man8/qemu-ga.8*
    _pick qemu-user-binfmt usr/lib/binfmt.d/*.conf

    _pick qemu-system-firmware-rutabaga usr/share/qemu/palcode-clipper
    _pick qemu-system-firmware-rutabaga usr/share/qemu/npcm7xx_bootrom.bin
    _pick qemu-system-firmware-rutabaga usr/share/qemu/hppa-firmware*.img
    _pick qemu-system-firmware-rutabaga usr/share/qemu/petalogix-*.dtb
    _pick qemu-system-firmware-rutabaga usr/share/qemu/{bamboo,canyonlands}.dtb
    _pick qemu-system-firmware-rutabaga usr/share/qemu/opensbi-riscv{32,64}*.bin
    _pick qemu-system-firmware-rutabaga usr/share/qemu/s390-ccw.img
    _pick qemu-system-firmware-rutabaga usr/share/qemu/{kvmvapic,linuxboot,multiboot{,_dma},pvh}.bin
    _pick qemu-system-firmware-rutabaga usr/share/qemu/qboot.rom
    # NOTE: needs to be replaced by openbios
    _pick qemu-system-firmware-rutabaga usr/share/qemu/openbios-ppc
    _pick qemu-system-firmware-rutabaga usr/share/qemu/qemu_vga.ndrv
    _pick qemu-system-firmware-rutabaga usr/share/qemu/skiboot.lid
    # NOTE: needs to be replaced by slof
    _pick qemu-system-firmware-rutabaga usr/share/qemu/slof.bin
    _pick qemu-system-firmware-rutabaga usr/share/qemu/u-boot.e500
    _pick qemu-system-firmware-rutabaga usr/share/qemu/u-boot-sam460-20100605.bin
    # NOTE: needs to be replaced by openbios
    _pick qemu-system-firmware-rutabaga usr/share/qemu/openbios-sparc{32,64}
    _pick qemu-system-firmware-rutabaga usr/share/qemu/QEMU,{cgthree,tcx}.bin
  )

  install -vDm 644 qemu-$pkgver/scripts/dump-guest-memory.py -t "$pkgdir/usr/share/qemu/"
  install -vDm 755 qemu-$pkgver/scripts/simpletrace.py -t "$pkgdir/usr/share/qemu/"
  install -vDm 644 qemu-$pkgver/scripts/tracetool/*.py -t "$pkgdir/usr/share/qemu/tracetool/"
  install -vDm 644 qemu-$pkgver/scripts/tracetool/backend/*.py -t "$pkgdir/usr/share/qemu/tracetool/backend/"
  install -vDm 644 qemu-$pkgver/scripts/tracetool/format/*.py -t "$pkgdir/usr/share/qemu/tracetool/format/"

  install -vDm 644 qemu-$pkgver/contrib/systemd/qemu-pr-helper.{service,socket} -t "$pkgdir/usr/lib/systemd/system/"
}

package_qemu-system-firmware-rutabaga() {
  pkgdesc="Firmware for QEMU system emulator"
  options=(!strip)
  depends=()
  conflicts=(qemu-system-{alpha,arm,hppa,microblaze,ppc,riscv,s390x,sparc,x86}-firmware)
  provides=("${conflicts[@]}")
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}
