# $Id$
# Maintainer: Stefan Schmidt <thrimbor.github@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-staging-pba
pkgver=2.21
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}

source=("https://github.com/wine-compholio/wine-patched/archive/staging-$_pkgbasever.tar.gz"
        harmony-fix.diff
        30-win32-aliases.conf
        "0001-wined3d-Implement-a-simple-heap-allocator-backed-by-.patch"
        "0002-wined3d-Allocate-global-write-only-persistent-buffer.patch"
        "0003-wined3d-Add-support-for-persistently-mapped-wined3d_.patch"
        "0004-wined3d-Implement-aligned-persistent-heaps-for-persi.patch"
        "0005-wined3d-Experimental-buffer-heap-fence-batching-uppe.patch"
        "0006-wined3d-Switch-wined3d_buffer_heap-to-be-backed-by-a.patch"
        "0007-wined3d-Add-segregated-free-bins-to-complement-rbtre.patch"
        "0008-wined3d-Implement-lazy-free-using-a-deferred-free-li.patch")

sha512sums=('4e3fe2eb81360bfa095194ab5b9647636cbeac0dc3955e6a3ee26062f650c66a4bd2353a1cd8063f9b7c65a6bcc1f892cc7c1d0f00c3c8525a124ec2109d1e86'
            'b86edf07bfc560f403fdfd5a71f97930ee2a4c3f76c92cc1a0dbb2e107be9db3bed3a727a0430d8a049583c63dd11f5d4567fb7aa69b193997c6da241acc4f2e'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
            'b9141fbe8f5189eb46c83b178497f9ee6d1f2daec3009877557ba28e5f2ce6d818cfef5b0eba15c1e9e4c50dd5950486f8091793d704ec532f82155056725e71'
            '8e112e25392fb2bd035c4b8792e43ad86bf81b1c24ff429ff8943a2c02ee761fc25446791475e4115e6b03f50cdb4cf6a8f128cc770c3941b59ee1dfbe79137b'
            '7335797924f1c4403a438ccfe36f8a650ddf8271d33ca962e270cf34762170038017cd53cad35f1ad61128f2c496edb68791783259df33cb997a73959136bdc0'
            '52ebb56c6adfbef526d2db19618f9155084dacd7600d166f04ba5423c63a4294294589d675c391e577330f1b68755bb5d3b6a2cd3006902269cb73140973dba3'
            'd326b8da8fb02462bac178a23e18f5468de62780717c24eadb453201b2b6b6439d2be7dda38e40f24fdc570dd5bc54102e7bf05868c53b17b27f6b9a06fccdb0'
            '04b41d4198138dbfe1399e7ed1e406fb265472d08a3e4de3c5c8584574b167613c598d7fa397c6944b809a96f699a4447694291296fa01a8e07b8ea96026ed2f'
            '9f90b7adc0ed87daac0f453caf2fff8b338061d96a9cd890f305704f9b22581232c6a207eb9eb1670c69b083caa780a6e44280df47c95b4e6e8e73f046f7c8a5'
            '8fd8d2e262327e78dad69186ebf091dbc034fab2675f0be91df75c88ae6f5e5ae6f456a2098c460861946390ce139e998f4b0f77e33671c8a7062a5e06b6e4ca')

pkgdesc="A compatibility layer for running Windows programs - Staging branch"
url="http://www.wine-staging.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)

_depends=(
  attr             lib32-attr
  fontconfig       lib32-fontconfig
  lcms2            lib32-lcms2
  libxml2          lib32-libxml2
  libxcursor       lib32-libxcursor
  libxrandr        lib32-libxrandr
  libxdamage       lib32-libxdamage
  libxi            lib32-libxi
  gettext          lib32-gettext
  freetype2        lib32-freetype2
  glu              lib32-glu
  libsm            lib32-libsm
  gcc-libs         lib32-gcc-libs
  libpcap          lib32-libpcap
  desktop-file-utils
)

makedepends=(autoconf ncurses bison perl fontforge flex
  'gcc>=4.5.0-2'
  giflib                lib32-giflib
  libpng                lib32-libpng
  gnutls                lib32-gnutls
  libxinerama           lib32-libxinerama
  libxcomposite         lib32-libxcomposite
  libxmu                lib32-libxmu
  libxxf86vm            lib32-libxxf86vm
  libldap               lib32-libldap
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libpulse              lib32-libpulse
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  samba
  opencl-headers
)

optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  ncurses               lib32-ncurses
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  cups
  samba           dosbox
)

if [[ $CARCH == i686 ]]; then
  # Strip lib32 etc. on i686
  _depends=(${_depends[@]/*32-*/})
  makedepends=(${makedepends[@]/*32-*/} ${_depends[@]})
  makedepends=(${makedepends[@]/*-multilib*/})
  optdepends=(${optdepends[@]/*32-*/})
  provides=("wine=$pkgver")
  conflicts=('wine' 'wine-staging')
else
  makedepends=(${makedepends[@]} ${_depends[@]})
  provides=("wine=$pkgver" "wine-wow64=$pkgver")
  conflicts=('wine' 'wine-wow64' 'wine-staging')
fi

prepare() {
  # Allow ccache to work
  mv wine-patched-staging-$_pkgbasever $pkgname

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  patch -d $pkgname -Np1 < harmony-fix.diff

  patch -d $pkgname -Np1 < 0001-wined3d-Implement-a-simple-heap-allocator-backed-by-.patch
  patch -d $pkgname -Np1 < 0002-wined3d-Allocate-global-write-only-persistent-buffer.patch
  patch -d $pkgname -Np1 < 0003-wined3d-Add-support-for-persistently-mapped-wined3d_.patch
  patch -d $pkgname -Np1 < 0004-wined3d-Implement-aligned-persistent-heaps-for-persi.patch
  patch -d $pkgname -Np1 < 0005-wined3d-Experimental-buffer-heap-fence-batching-uppe.patch
  patch -d $pkgname -Np1 < 0006-wined3d-Switch-wined3d_buffer_heap-to-be-backed-by-a.patch
  patch -d $pkgname -Np1 < 0007-wined3d-Add-segregated-free-bins-to-complement-rbtre.patch
  patch -d $pkgname -Np1 < 0008-wined3d-Implement-lazy-free-using-a-deferred-free-li.patch

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i $pkgname/configure*

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-32-build
}

build() {
  cd "$srcdir"

  if [[ $CARCH == x86_64 ]]; then
    msg2 "Building Wine-64..."

    mkdir $pkgname-64-build
    cd "$srcdir/$pkgname-64-build"
    ../$pkgname/configure \
      --prefix=/usr \
      --libdir=/usr/lib \
      --with-x \
      --with-gstreamer \
      --enable-win64 \
      --with-xattr

    make

    _wine32opts=(
      --libdir=/usr/lib32
      --with-wine64="$srcdir/$pkgname-64-build"
    )

    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  fi

  msg2 "Building Wine-32..."
  cd "$srcdir/$pkgname-32-build"
  ../$pkgname/configure \
    --prefix=/usr \
    --with-x \
    --with-gstreamer \
    --with-xattr \
    "${_wine32opts[@]}"

  make
}

package() {
  depends=(${_depends[@]})

  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  if [[ $CARCH == i686 ]]; then
    make prefix="$pkgdir/usr" install
  else
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib32" \
      dlldir="$pkgdir/usr/lib32/wine" install

    msg2 "Packaging Wine-64..."
    cd "$srcdir/$pkgname-64-build"
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib" \
      dlldir="$pkgdir/usr/lib/wine" install
  fi

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
