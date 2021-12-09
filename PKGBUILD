# -*- mode: shell-script -*-
# Maintainer: Manuel Reimer <mail+wine@m-reimer.de>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

# Contains fixes to make League Of Legends work.
# One fix requires a "hacked" glibc (wine-lol-glibc on AUR).
# Some history:
# Primary bug report: https://bugs.winehq.org/show_bug.cgi?id=47198

pkgname=wine-lol
pkgver=5.18
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}

source=("wine-tkg-5.18.tar.gz::https://github.com/Tk-Glitch/wine-tkg/archive/e379f968e8c8e693be4330bfa5ac03595e7ed1ce.tar.gz"
        30-win32-aliases.conf
        $pkgname-autoconf-2.70.patch
        $pkgname-bug-47198-fix.patch
        0001-Updated-wow64cpu-Wow64Transition-patchset.patch
        0001-ntdll-Stub-NtQueryInformationThread-ThreadHideFromDe.patch
        0001-Revert-winex11.drv-Update-_NET_WM_STATE-before-resiz.patch
        0001-Fix-ldap_connect-name-conflict.patch
       )
sha512sums=('85ea388e711b2a659b37233bcfd423d6bed3a56190d6cff3a9465eb8c0590cbc73b69479ec25749d43be9de7d8a37833e1c5c5f908d8e3c69f131ffa79dcbde3'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
            '8c8b7932573b028b58653dce0d307bcdd2910309e5c137c27ddcdfaa07aa46337b85c288e1fa67fde8dea75a67b632bbd5288e3abd5df06eea5b37a87ec7a1e8'
            'e8207a4cf79fe83c20d6f2257b469127baf81876f3de240a24744b23ab1c2b0b523afae6acb1fc95edfc1e2cb5db34adea87e36047455b82f42b29228681b9d5'
            '78680db42591fc882c50c4fc5156a1d3db915d71b8982b42b2affc6701d55bc5dacfd2d7a435a7b1424f9480b1e2db332321d9b4dae7122a3a0ad1efdcbe1d59'
            '68c027c748faf1ea86c4b01f2decadb3240d1e98f1f16a9fc6f6a841bb5240efc91237e77aedd188c450b6f47e1ca89620ef924ec44e3f0bc2c9097361c1ac08'
            'ff6ea107598bd681bb5534d977e2f40fe8104bcf53148284fdd2be14f67db1dfe6d8176ff8200fc982ab3902c28e4186876c4d1870fd7362d98e8b3b6d8efe31'
            '9be470762bfa4bf098e919bf94210103e1e9147693e74bfbc88fa539b3d1c8bd2da017005380dbe21ace39cc4fa949e923b3682cb9265d61bbd0e2f988562dbd')

pkgdesc="A compatibility layer for running Windows programs - Wine Tk-Glitch with League Of Legends fixes"
url="https://github.com/M-Reimer/wine-lol"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)

depends=(
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
  wine-lol-glibc
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
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  vkd3d                 lib32-vkd3d
  sane
  libgphoto2
  gsm
  ffmpeg
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
  sdl2                  lib32-sdl2
  vkd3d                 lib32-vkd3d
  sane
  libgphoto2
  gsm
  ffmpeg
  cups
  samba           dosbox
)

install=wine.install

prepare() {
  # Allow ccache to work
  mv $(tar -tf wine-tkg-$pkgver.tar.gz | head -n1) $pkgname

  # Apply fix for autoconf 2.70
  patch -d "$srcdir/$pkgname" -p1 -i "$srcdir/$pkgname-autoconf-2.70.patch"

  # Apply Tk-Glitch missing patches
  pushd "$srcdir/$pkgname"
  patch -p1 -i "$srcdir/0001-Updated-wow64cpu-Wow64Transition-patchset.patch"
  patch -p1 -i "$srcdir/0001-ntdll-Stub-NtQueryInformationThread-ThreadHideFromDe.patch"
  popd

  # Apply League Of Legends fixes
  patch -d "$srcdir/$pkgname" -p1 -i "$srcdir/$pkgname-bug-47198-fix.patch"

  # Revert commit that breaks _net_active in league-client since wine-5.8
  pushd "$srcdir/$pkgname"
  patch -p1 -i "$srcdir/0001-Revert-winex11.drv-Update-_NET_WM_STATE-before-resiz.patch"
  popd

  # Fix opencl header path
  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i $pkgname/configure*

  # Fix ldap_connect
  patch -d "$srcdir/$pkgname" -p1 -i "$srcdir/0001-Fix-ldap_connect-name-conflict.patch"
}

build() {
  cd "$srcdir"

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-{32,64}-build

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  # We need RPATH to point to the "lib32" in our prefix
  _RPATH="-rpath=/opt/wine-lol/lib32"
  # Dyamic linker has to be the one in wine-lol-glibc
  _LINKER="-dynamic-linker=/opt/wine-lol/lib32/ld-linux.so.2"
  # Export all this via LDFLAGS
  export LDFLAGS="$LDFLAGS,$_RPATH,$_LINKER"

  # Make sure everything builds for 32bit
  export CFLAGS="-m32 $CFLAGS"

  msg2 "Building Wine-32..."

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "$srcdir/$pkgname-32-build"

  # TODO: Remove "--disable-tests" for wine-tkg higher than 5.18. Some patches
  #       in wine-tkg seem to corrupt some tests in 5.18rc3
  ../$pkgname/configure \
    --disable-tests \
    --prefix=/opt/wine-lol \
    --with-x \
    --with-gstreamer \
    --with-xattr \
    --without-mingw \
    --libdir=/opt/wine-lol/lib32

  make depend LDRPATH_INSTALL="-Wl,$_RPATH,$_LINKER" # Use wine-lib-glibc for -install
  make
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  make prefix="$pkgdir/opt/wine-lol" \
    libdir="$pkgdir/opt/wine-lol/lib32" \
    dlldir="$pkgdir/opt/wine-lol/lib32/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail/30-wine-lol-win32-aliases.conf"
  ln -s ../conf.avail/30-wine-lol-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-wine-lol-win32-aliases.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
