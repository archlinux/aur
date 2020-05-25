# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Warning: If you are downgrading from the development branch (Wine ≥ 5.1,
# for example), your WINEPREFIX may break and experience unusual bugs.
# Try to make a clean WINEPREFIX, such as by doing “rm -rf ~/.wine”

pkgname=wine-stable
pkgver=5.0
pkgrel=3

source=(https://dl.winehq.org/wine/source/5.0/wine-$pkgver.tar.xz{,.sign}
        30-win32-aliases.conf
        wine-binfmt.conf
        0001-winedump-Add-a-default-case-to-numeric_leaf.patch
        0002-msi-Properly-declare-variables-in-msi-tests-utils.h-.patch
        0003-crypt32-Global-variable-compatibility-update-for-gcc.patch
        0004-dsound-Global-variable-compatibility-update-for-gcc-.patch
        0005-mshtml-Global-variable-compatibility-update-for-gcc-.patch
        0006-secur32-Global-variable-compatibility-update-for-gcc.patch
        0007-winebus-Global-variable-compatibility-update-for-gcc.patch
        0008-wbemprox-Global-variable-compatibility-update-for-gc.patch
        0009-xinput-Global-variable-compatibility-update-for-gcc-.patch
        0010-twain_32-Global-variable-compatibility-update-for-gc.patch
        0011-msi-Global-variable-compatibility-update-for-gcc-10.patch
        0012-webservices-Global-variable-compatibility-update-for.patch
        0013-gphoto2.ds-Global-variable-compatibility-update-for-.patch
        0014-sane.ds-Global-variable-compatibility-update-for-gcc.patch
        0015-schedsvc-tests-Fix-compilation-with-recent-gcc-clang.patch)
b2sums=('d26938e707545d31ed932c67eaaa9fd137e42daa6facadeaea2897797ec816658edc1b89c649e0cb5c453ca53ebea5d7156fdd188f1afe2a55ca7834e012e276'
        'SKIP'
        '45db34fb35a679dc191b4119603eba37b8008326bd4f7d6bd422fbbb2a74b675bdbc9f0cc6995ed0c564cf088b7ecd9fbe2d06d42ff8a4464828f3c4f188075b'
        'e9de76a32493c601ab32bde28a2c8f8aded12978057159dd9bf35eefbf82f2389a4d5e30170218956101331cf3e7452ae82ad0db6aad623651b0cc2174a61588'
        '3bad385a7c432f33a2ff0c5697e0fd43bfc178b184b2dfdb6dbf2861552b93a743b5fe9838069152df586eda547697033299a3b11620280250fa72913d41468c'
        '4f6516f0eb27adf96016f62fe29edc47abb1e27a4843a42dee88afad55c96f51082fcdfbb3bcbaded5e7df529f363eaadc0c05a55f604a020e56bf07befa5ccb'
        '8589ce198b76a53e65cf75328b6ab164beee5cf82e7baf4de9d4c86b403db9ddfe6ea1d219763da2ced58a70e7525f5c1755a466d38104ac8189c128ae291d95'
        '6deae909005d358eb3602aba4f1cdfbb3a01bd4005b7c75adbd9a91f07736b041e1342da32d62842aa48b6a7f835f049b95433621a2e769ac842d7bd4b4d89f0'
        '53becc8e020a1d87c1448b8c2ec50f267cd2b906f57647d48405cc0a0a74dd70b1d234564ce054a05b66b4713d5d2c7048f1ebca1497c0899782b0828889bed9'
        '6584b229179f8bb7df79c9bb6df73170a7230c6a8617ab017cef00b5aac7eacc13cc671aa0c0cf4f3180b56142d989bc9d9fd087b6a3fe695180b2089a0a8e35'
        'e7ae9a5e0a7c0dab900e8a735cd050f5eab31932cc03efc8065fdc9a1c1ee9c364930794f788fd91b2fe0eb2444464777f923bdf41c19230f284933ca73d8768'
        'e146764111a3aa048b711ddee585bec5a5e87bddea3d6447787af7338114a69e4905ea43d64994fff26fc35b1461e0049798df7db07bb85a84062cbbd9a16a6f'
        '0dcec6681ddae79783391e25d13d6184fab39443d07e378fbe24f421634f408f71dd4d16f7c0f39cfdd92c829aed806f8fd4a24bde9b2d570219dff0e7e6f6d6'
        'bbd131630657a3984eab4d1a4a33f4e67502db373896ac706b3bddd3cc59c10e25bf8ec3183c488eedfea0780acb436f7f9c8c79390ba7ad409d6ea996109865'
        '8b7cb73646dece70f4629908103190e62144f2ef83f2afd23bf571f22c7b9eaa9e9321c35b69f7e5be906558e5bbdb6955a83820be9823cce436c60a544541a7'
        'cdc92b181e5a4c1c39d4cd11c87676909252998a81361cb7618120c036f36ead08cf9549b835c7f5ff3b804f9f64feab1f6f0b38ae378e26b2305acc6530963f'
        'b6cf97520d3e32f95378787faa5e7445ce24b02a0a4a58180aa441599ef7bbc8fea8bf086249e50a2247235d00fdb79d1c29dc260d00fcd31e6cedc15c7d901a'
        'a352cb565394b5e5c734723d7aba7cb13fc0ca64231aaee757033b8001f4b7ff70202d7bf63cb65702be6fbb93678a62e983fb3e4f5e266630aa4abf69bb9842'
        '0343481010c5a68e19692207b9d95e90b7bda6da03204bc6a95e26b9dada862f75fa1cabc74bdcb71cbe5c3282318edd3cd1ad5d45cfcc5f66908dace8bda60d')
validpgpkeys=(DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

pkgdesc="A compatibility layer for running Windows programs"
url="http://www.winehq.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)
install=wine.install

depends=(desktop-file-utils faudio fontconfig freetype2 glu lcms2
  libpcap libsm libxcursor libxdamage libxi libxml2 libxrandr
  lib32-faudio lib32-fontconfig lib32-freetype2 lib32-gcc-libs
  lib32-gettext lib32-glu lib32-lcms2 lib32-libpcap lib32-libsm
  lib32-libxcursor lib32-libxdamage lib32-libxi lib32-libxml2
  lib32-libxrandr)

makedepends=(alsa-lib fontforge giflib gnutls gsm
  gst-plugins-base-libs libcups libgl libgphoto2 libldap libpng
  libpulse libxcomposite libxinerama libxmu libxslt libxxf86vm mesa
  mpg123 ncurses ocl-icd openal opencl-headers perl samba sane sdl2
  v4l-utils vkd3d vulkan-headers vulkan-icd-loader lib32-alsa-lib
  lib32-giflib lib32-gnutls lib32-gst-plugins-base-libs lib32-libcups
  lib32-libgl lib32-libldap lib32-libpng lib32-libpulse
  lib32-libxcomposite lib32-libxinerama lib32-libxmu lib32-libxslt
  lib32-libxxf86vm lib32-mesa lib32-mpg123 lib32-ncurses lib32-ocl-icd
  lib32-openal lib32-sdl2 lib32-v4l-utils lib32-vkd3d
  lib32-vulkan-icd-loader)

optdepends=(alsa-lib alsa-plugins dosbox giflib gnutls gsm
  gst-plugins-base-libs libcups libgphoto2 libjpeg-turbo libldap
  libpng libpulse libxcomposite libxinerama libxslt mpg123 ncurses
  ocl-icd openal samba sane sdl2 v4l-utils vkd3d vulkan-icd-loader
  lib32-alsa-lib lib32-alsa-plugins lib32-giflib lib32-gnutls
  lib32-gst-plugins-base-libs lib32-libcups lib32-libjpeg-turbo
  lib32-libldap lib32-libpng lib32-libpulse lib32-libxcomposite
  lib32-libxinerama lib32-libxslt lib32-mpg123 lib32-ncurses
  lib32-ocl-icd lib32-openal lib32-sdl2 lib32-v4l-utils lib32-vkd3d
  lib32-vulkan-icd-loader)

provides=("wine=$pkgver" "wine-stable=$pkgver")
conflicts=("wine" "wine-stable")

prepare() {
  # Allow ccache to work
  mv wine-$pkgver wine

  for patch in *.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -d wine -p1 -i "../$patch"
    fi
  done

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i wine/configure*

  # Get rid of old build dirs
  rm -rf wine-{32,64}-build
  mkdir wine-{32,64}-build
}

build() {
  cd "$srcdir/wine-64-build"
  ../wine/configure \
      --prefix=/usr \
      --libdir=/usr/lib \
      --with-x \
      --with-gstreamer \
      --enable-win64

  make

  _wine32opts=(
    --libdir=/usr/lib32
    --with-wine64="$srcdir/wine-64-build"
  )

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "$srcdir/wine-32-build"
  ../wine/configure \
      --prefix=/usr \
      --with-x \
      --with-gstreamer \
      "${_wine32opts[@]}"

  make
}

package() {
  cd "$srcdir/wine-32-build"

  make STRIP=true prefix="$pkgdir/usr" \
       libdir="$pkgdir/usr/lib32" \
       dlldir="$pkgdir/usr/lib32/wine" install

  cd "$srcdir/wine-64-build"
  make STRIP=true prefix="$pkgdir/usr" \
       libdir="$pkgdir/usr/lib" \
       dlldir="$pkgdir/usr/lib/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf \
     "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
  install -Dm644 "$srcdir/wine-binfmt.conf" \
     "$pkgdir/usr/share/wine/binfmt/wine.conf"
}
