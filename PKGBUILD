# Maintainer: Björn Bidar <AUR+me@thaodan.de>
# Vanilla package Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

_pkgbase=qemu
pkgbase=$_pkgbase-scratchbox2
pkgname=(
  $pkgbase-tests
  $pkgbase-user
)
pkgver=7.0.0
pkgrel=10
_pkgdesc_suffix="patched for use with scratchbox2"
pkgdesc="A generic and open source machine emulator and virtualizer $_pkgdesc_suffix"
arch=(x86_64)
url="https://www.qemu.org/"
license=(GPL2 LGPL2.1)
# TODO: consider providing rdma-core
# TODO: consider providing lzfse
# TODO: package systemtap
# TODO: package openbios for qemu-system-{ppc,sparc}
# TODO: package /usr/share/qemu/{efi,pxe}-* for qemu (ipxe)
# TODO: package /usr/share/qemu/slof.bin for qemu-system-ppc (slof)
# TODO: package /usr/share/qemu/sgabios.bin for qemu-system-x86 (sgabios)
# TODO: package static libs of glib2 and pcre for qemu-user-static
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

# patch source: https://github.com/Thaodan/qemu/tree/sailfishos/7.0.0
source=(
  https://download.qemu.org/qemu-$pkgver.tar.xz{,.sig}
  0001-Revert-linux-user-Use-safe_syscall-for-open-and-open.patch
  0002-Revert-linux-user-Use-safe_syscall-for-execve-syscal.patch
  0003-Revert-linux-user-Use-safe_syscall-wrapper-for-send-.patch
  0004-Revert-linux-user-Use-safe_syscall-wrapper-for-accep.patch
  0005-Revert-linux-user-Use-safe_syscall-wrapper-for-conne.patch
  0006-Revert-linux-user-Use-direct-syscall-for-utimensat.patch
  0007-Revert-util-drop-old-utimensat-compat-code.patch
  0008-Revert-linux-user-Use-safe_syscall-wrapper-for-fcntl.patch
  0009-make-sure-mode-is-passed-to-openat-if-O_TMPFILE-is-s.patch
  0010-linux-user-disable-commpage.patch
  0011-virtio-scsi-don-t-waste-CPU-polling-the-event-virtqu.patch
  0012-virtio-scsi-fix-ctrl-and-event-handler-functions-in-.patch
)
sha512sums=('44ecd10c018a3763e1bc87d1d35b98890d0d5636acd69fe9b5cadf5024d5af6a31684d60cbe1c3370e02986434c1fb0ad99224e0e6f6fe7eda169992508157b1'
            'SKIP'
            'b8f16f8e73a05aba0caab7844700ee57dcd9aba337a58a5a6b862ac4642919378ca9532972b760b42a65f48730ab96a4c5e4bd68af7f42b0e18a5e050a68539d'
            '124b4be68e3949293c0c90cee8c6da719c871426e83fbc9e52597d02dfaf79ce95ed12373e3d0bafbd83f019fd6e254ec91651dab17a868c06b7eaa8abc1e19a'
            '37626ac06af37a324f4912dff689b52a9b3da27e08a0029ad2dd0855137fae8b3aacb873456897298f9a4fb28e4f04929477ab433ede0e6e9cb3534657114233'
            'b173e735ce7f81c4ad986d8b6d774663957e59ee025cd153f6b016c5687a7d62a82b031e5956dd7b8ecf086addc38b1a509d7c3180988bdd7333847557781c9f'
            '520697682261e89017b091f3ce16a1bab8be18d2291a9febf9eb7ed8e1a54422eb3a26e96f16d8994d50ca73f6e08f3df7dc5130fadffe5cf9c52c779d501c51'
            'c0c74faab1685107b0e83e76e5a592966d3e3497191cf32b3d84fff70feac1ebdbcf3d8a481fdddfd04d79883e3155db9564c9a51b279a83cf650b248d76b033'
            '6fb03b29ea9a3c2ab13da01d97c735b2b28dbe262cd18f068f21ce5b808cab0042c2f22b5066da744255ac380104b8740d02754fe11c3e4f0e864bbf6e46336a'
            '9db86e41e7725fd670625b78341a4b5c20e8271b4ab2673cda153696cb57f662bd5383f96c887a41a629cf8c35ed36f6a20f8b8bec23ab7cbf3621695ff7d697'
            'ef057bf82dd81bbf4fd1270876698efc69e5f9c4f34c4b424e6562eeed64a8fa70126b192c041d342e7b44369223d79b587198a2a07d0cef16c03305a75d7b00'
            '57f4b72df80333e457bbc6a9afa47af40dcd59a32d55a7babda5b5378f9485282823c50e2baca54230fc77056303e809b2108b9ffb73d64eab7eedbf67303ab5'
            '4c66df5ffbae302bf0a2f5f6aab1536ac00b5e57eab94e69f7fbd79f54fefa47c46ca20c3b039fd7e51ee72bc74142ab7a94ec2e64f653682992a7df30867d9b'
            '155b3de89a18fa8cb234ce71767dbf59ab4e0ed2c6375279413fa2c11c128d46bdc2c28467fdbe226e2188755cecae2e33c964f7a35806882a173551d9765684')
b2sums=('ceda6d9f1a585298bd49fed61e8bb35f0064ad8388a9f979c8bd68a38bfe1a47c5bb055e5f74f970c2c440957042b9de4a861524120040c56e4cd8b56c5cfb68'
        'SKIP'
        '0f591ed6d4d1356d75039429da7711f03bbafff8014ef47ab3b7683111d30c4a535ab79c5701984b3a04af74cd6b2d395fe1da942eb4da43cf08f16753b6024e'
        'b0d553e58da26f33003ab95b3910b98e0a14ef0719facef01c8cf22facec20fd29a1f5bae6f7301c53bd23e02abfd7cedfbfb263a558f4c4eea808a157b2c6b4'
        'e70c3ea01afd75c2489d106a2464f4bd8d9b373a8a3147d0a5fb77ebc5587b66c2924bd11a2c2a61359f080e20071810faed299f9bab3816ac2142360a54deb3'
        'c113c1297de8222d413c8715de2e35fc7166ea3064e04de4242e59eb1f283c38589ccc26c21e1937eb1f0d935dc3aba55ab5b549efb02a27ca3ae880c10f1b47'
        '2e5d5aa1c98142c55f94104d40116ff8baf8a1a995704ec86d164455d840fcf210e68093790e6968c357dafce0cf8ab600d53fd692887563186a571e2d3f3b93'
        '0aae840a656c05c10c9d10d1894869e472e3415af3895d35bdd86fdb77c597c157ee867a77a202ef2e81d6a89eeb086a1b86ff396276fc31f61d5a1566c1af15'
        '9d067a955d1ecaf838fa24161af32d4402308af1c24364a13357ffc39abd4ce346b27af40642e5236aec8af85748329c2f736ee386f2e2f802fa335d56a1b8d5'
        '975d48c77fb62876e19f2548572c46b19d34e3836c42f482b35759dd3405c9601d6030009a56336a55e1d0baf049632de77ad8928660ccbc6fb42bff27d5d720'
        '5972d7524bd3d1b3c37f68c4d23358eac4bf68762a857362caff5ebe90480b6ff8d18f8a667d3b88b908cad75de6a5140a23471deea75394afc99904d550fd90'
        '28654ef9a6cab7a9e2408c44de9769fb5772141eb8253058f147b807cf46ed25b72dc404addb09cc9495f9f872b0af8859f7d75d597ad3c1b33f05c17e3e00d3'
        'd7c3b91fa4ed217d9df1d2cb0fbf696ed81fcbcb15f15fc631a75aef4e45dc51ef58d6f9db40eea274c8b745d76a4c6fbad4357a85bdbba12c6b342cd7020576'
        'd02aaaa9763740c6e46fa66d1247e441c396ebc9d0351c86c913629d47f4e64fea23ee7b4376234f8d33bd5a67f109e2d7e485bb078327ec9b3e5271982d07cc')
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
  qemu-common
  snappy
  vde2
  zlib
  zstd libzstd.so
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
  sed -n '1,23p' $_pkgbase-$pkgver/tcg/tcg-internal.h > tcg.LICENSE.MIT
  sed -n '1,23p' $_pkgbase-$pkgver/tcg/arm/tcg-target.c.inc > tcg-arm.LICENSE.MIT
  sed -n '1,23p' $_pkgbase-$pkgver/tcg/tci/tcg-target.h > tci.LICENSE.MIT

  # install qemu-pr-helper.socket to sockets.target
  sed -e 's/multi-user.target/sockets.target/g' -i $_pkgbase-$pkgver/contrib/systemd/qemu-pr-helper.socket

  # create build dir
  mkdir -vp build
  mkdir -vp build-static

  # fix issues with virtio-scsi https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg04724.html
  cd $_pkgbase-$pkgver
  for patch in ${srcdir}/*.patch ; do
    patch -p1 -i "$patch"
  done
}

build() {
  # Build only minimal debug info to reduce size
  CFLAGS+=' -g1'
  CXXFLAGS+=' -g1'


  (
    cd build

    # LTO needs more open files
    ulimit -n 50000

    ../$_pkgbase-$pkgver/configure \
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
    ninja -j $(($(nproc)/4))
  )

  # TODO: qemu-user-static
  #  (
  #    cd build-static
  #    ../$_pkgbase-$pkgver/configure \
    #      --enable-attr \
    #      --enable-linux-user \
    #      --enable-tcg \
    #      --disable-install-blobs \
    #      --static
  #    ninja
  #  )

  meson install -C build --destdir "$srcdir"/_pkgdir
  install -vdm 755 "$srcdir"/_pkgdir/usr/lib/binfmt.d/
  $_pkgbase-$pkgver/scripts/qemu-binfmt-conf.sh --systemd ALL \
                              --exportdir \
                              "$srcdir"/_pkgdir/usr/lib/binfmt.d/ --qemu-path "/usr/bin"
  (
    # pick files for all split packages
    cd "$srcdir/_pkgdir"

    _pick qemu-scratchbox2-user usr/bin/qemu-{aarch64{,_be},alpha,arm{,eb},cris,hexagon,hppa,i386,m68k,microblaze{,el},mips{,64,64el,el,n32,n32el},nios2,or1k,ppc{,64,64le},riscv{32,64},s390x,sh4{,eb},sparc{,32plus,64},x86_64,xtensa{,eb}}
    _pick qemu-scratchbox2-user usr/lib/binfmt.d/*.conf
    _pick qemu-scratchbox2-tests usr/lib/qemu/accel-qtest-*.so
  )
}


package_qemu-scratchbox2-tests() {
  pkgdesc="QEMU tests $_pkgdesc_suffix"
  depends=(qemu-common)
  provides=($_pkgbase-tests)
  conflicts=($_pkgbase-tests)
  mv -v $pkgname/* "$pkgdir"
}

package_qemu-scratchbox2-user() {
  pkgdesc="QEMU user mode emulation $_pkgdesc_suffix"
  depends=(gcc-libs glib2 libglib-2.0.so libgmodule-2.0.so glibc gnutls
           liburing liburing.so qemu-common zlib)
  provides=($_pkgbase-user)
  conflicts=($_pkgbase-user)
  mv -v $pkgname/* "$pkgdir"
  install -vdm 755 "$pkgdir/usr/lib/binfmt.d/"
}

# package_qemu-user-static() {
#   pkgdesc="QEMU static user mode emulation $_pkgdesc_suffix"
#   depends=(glibc)
#   mv -v $pkgname/* "$pkgdir"
# }





# vim:set ts=2 sw=2 et:
