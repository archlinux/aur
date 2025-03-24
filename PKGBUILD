# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

pkgbase=qemu-hw-display-virtio-rutabaga
_modules=(hw-display-virtio-{gpu-{rutabaga,pci-rutabaga},vga-rutabaga})
pkgname=(qemu-hw-display-virtio-rutabaga "${_modules[@]/#/qemu-}")
pkgver=9.2.2
pkgrel=1
pkgdesc="QEMU Rutabaga Virtual Graphics Interface support"
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
depends=(rutabaga-ffi)
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
sha512sums=('b010876da9f91da01dbb9e06705a1358d5f062d0fdd4ad5c8cd8ce3fd43adcefcf72a61216eb8d415281f6607b945ce1cfb6b5fc5692ada9163e8f05b7fb5533'
            'SKIP'
            '7b412ffa5dcda47b0a4ec9e2c5e5e1d9eaaaf0a087b7ea3ead3e706ba4c9cafb919beadd088a0299b6f7aab753b81a5eafb545b4842ee5f26646d16544dd02a7'
            '6e838773d63ae0ffdffe2b891bf611d8f5f3c67a9bc4cbbedf8363c150c2c9971c8e44d92270bc581af40eb0ece02192760bcdd6aee229fff55635f3a4825afa'
            '985c2c7a6b5217c87a15b45368089ee91b2f9027b070f9eafa448a18b27ae0d9edd964d52e134b9c1f4aeef4d6aae88afd3f454551ca898affef7f9d28b99b8f'
            'bdf05f99407491e27a03aaf845b7cc8acfa2e0e59968236f10ffc905e5e3d5e8569df496fd71c887da2b5b8d1902494520c7da2d3a8258f7fd93a881dd610c99'
            '93b905046fcea8a0a89513b9259c222494ab3b91319dde23baebcb40dc17376a56661b159b99785d6e816831974a0f3cbd7b2f7d89e5fc3c258f88f4492f3839'
            'c7d086a951e9a378434ea95a843a4b01f0eb2ae430135a81365147cf6806a7ba1b49014a3aa66904970853ba84a4a28dbaded7bccb99a0bc3730572c80fb8b12'
            '7949b1435ed979836c59149b4b06b80fe14fa89ef12d1e027860df392e2ffdaf4a0f881021f80b4ee56e8657068bf7f2c6415c9891f34c32228b9d35e9359c8f')
b2sums=('fe341d25010b02c47c263e6b1bf1a64f72226e188bd79901ec0072005994e305f5c75b8e5b3f36af1e3b3f776a04cd18b4084dc044952f34b131f3b94134f5b8'
        'SKIP'
        'b1eca364aa60f130ff5e649f5d004d3fcb75356d3421a4542efdfc410d39b40d9434d15e1dd7bbdbd315cb72b5290d3ea5f77f9c41961a5601cd28ef7bbe72e8'
        '2102e4a34e11e406e9606c97e026e7b92e887e296a7f77b9cede1b37119d0df33735f3588628167b2b8e32244c196c491bfab623e2caddac9014d445aa2a6d98'
        '69177b962d2fda20cafdbc6226fd017b5ca5a0f69f866d055dc1c744b7b2955059f47c693cfb5b4c863ec159569fdabd4327ab4b8a95566a68cd8ce38e339c7a'
        '3559fe9c4f744194939770047a0a02d07ff791c845a80726d0bc7b8c4801ed5f11150e7d5adab813844b3dab1cf38c3a5a87fb6efbb8fc9dccdda9fa56409ed8'
        'a9a2bdfeeb44eb86cbe88ac7c65f72800bdb2fd5cecb02f3a258cf9470b52832180aab43c89d481f7fd4d067342a9a27dd6c8a94d625b95d6e2b912e47d274e7'
        '209ec05e161d157aaa08a9fcbea45cf87aa22fe9360f9b3c477a78a274e4ecee989c16121f9e6b7765bb479c9db718c98db047c27fd426c127c4c95e28877a16'
        '16fe3a16eb874a69324ae42ba9f96deacb832e8cf9123cafb7f5148fbc3c84a2c78876b8fc62b9b9abefabfcfdcdbcfc1955040368d4dc1b3d4ccd719ec9b410')
validpgpkeys=('CEACC9E15534EBABB82D3FA03353C9CEF108B584') # Michael Roth <flukshun@gmail.com>

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
    echo "meson compile ${_modules[@]/%/:shared_module}"
    meson compile ${_modules[@]/%/:shared_module}
  )
}

package_qemu-hw-display-virtio-gpu-rutabaga() {
  pkgdesc="QEMU virtio-gpu display Rutabaga support"
  depends=(qemu-hw-display-virtio-gpu=$pkgver-$pkgrel ${depends[@]})


  install -vDm 755 build/hw-display-virtio-gpu-rutabaga.so -t "$pkgdir/usr/lib/qemu/"
  _install_licenses
}

package_qemu-hw-display-virtio-gpu-pci-rutabaga() {
  pkgdesc="QEMU virtio-gpu-pci display Rutabaga support"
  depends=(qemu-hw-display-virtio-gpu-pci=$pkgver-$pkgrel ${depends[@]})

  install -vDm 755 build/hw-display-virtio-gpu-pci-rutabaga.so -t "$pkgdir/usr/lib/qemu/"
  _install_licenses
}

package_qemu-hw-display-virtio-vga-rutabaga() {
  pkgdesc="QEMU virtio-vga display Rutabaga support"
  depends=(qemu-hw-display-virtio-vga=$pkgver-$pkgrel ${depends[@]})

  install -vDm 755 build/hw-display-virtio-vga-rutabaga.so -t "$pkgdir/usr/lib/qemu/"
  _install_licenses
}

package_qemu-hw-display-virtio-rutabaga() {
  depends=(
    qemu-hw-display-virtio-gpu-rutabaga=$pkgver-$pkgrel
    qemu-hw-display-virtio-gpu-pci-rutabaga=$pkgver-$pkgrel
    qemu-hw-display-virtio-vga-rutabaga=$pkgver-$pkgrel
  )
  _install_licenses
}
