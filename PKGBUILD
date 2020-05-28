# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=proton-ge-custom
_srctag=5.9-GE-1-NR
pkgver=${_srctag//-/.}
_geckover=2.47.1
_monover=5.0.1
pkgrel=1
pkgdesc="Compatibility tool for Steam Play based on Wine and additional components. GloriousEggroll's custom build"
arch=(x86_64)
url="https://github.com/GloriousEggroll/proton-ge-custom"
license=('custom')
depends=(
  fontconfig      lib32-fontconfig
  lcms2           lib32-lcms2
  libxml2         lib32-libxml2
  libxcursor      lib32-libxcursor
  libxrandr       lib32-libxrandr
  libxdamage      lib32-libxdamage
  libpulse        lib32-libpulse
  gsm             lib32-gsm
  libxi           lib32-libxi
  gettext         lib32-gettext
  freetype2       lib32-freetype2
  glu             lib32-glu
  libsm           lib32-libsm
  gcc-libs        lib32-gcc-libs
  libpcap         lib32-libpcap
  desktop-file-utils
  python
  steam-native-runtime
  "wine-gecko-bin>=$_geckover"
)
makedepends=(autoconf ncurses bison perl fontforge flex meson
  'gcc>=4.5.0-2'
  mingw-w64-gcc
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
  libpulse              lib32-libpulse
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  libgphoto2
  sane
  gsm
  samba
  opencl-headers
  git
  cmake
  afdko
  nasm
  glslang
)
optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  sdl2                  lib32-sdl2
  libgphoto2
  sane
  gsm
  cups
  samba           dosbox
)
makedepends=(${makedepends[@]} ${depends[@]})
#install=${pkgname%-git}.install
source=(
    proton-ge-custom::git+https://github.com/gloriouseggroll/proton-ge-custom.git#tag=${_srctag}
    wine::git://source.winehq.org/git/wine.git
    wine-staging::git+https://github.com/wine-staging/wine-staging.git
    vkd3d::git+https://github.com/HansKristian-Work/vkd3d.git
    dxvk::git+https://github.com/doitsujin/dxvk.git
    openvr::git+https://github.com/ValveSoftware/openvr.git
    ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git
    liberation-fonts::git+https://github.com/liberationfonts/liberation-fonts.git
    SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git
    Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git
    FAudio::git+https://github.com/FNA-XNA/FAudio.git
    protonfixes-gloriouseggroll::git+https://github.com/gloriouseggroll/protonfixes.git
    glib::git+https://gitlab.gnome.org/GNOME/glib.git
    gstreamer::git+https://gitlab.freedesktop.org/gstreamer/gstreamer.git
    gst-orc::git+https://gitlab.freedesktop.org/gstreamer/orc.git
    gst-plugins-base::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-base.git
    gst-plugins-good::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-good.git
    gst-plugins-bad::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad.git
    gst-plugins-ugly::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly.git
    gst-libav::git+https://gitlab.freedesktop.org/gstreamer/gst-libav.git
    https://github.com/madewokherd/wine-mono/releases/download/wine-mono-${_monover}/wine-mono-${_monover}-x86.tar.xz
    proton-unfuck_makefile.patch
    proton-disable_lock.patch
    proton-user_compat_data.patch
    dxvk-extraopts.patch
)
noextract=(
    wine-mono-${_monover}-x86.tar.xz
)
sha256sums=(
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP    
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    'c899f176cbb7b1c411abbc103e17ae05702df21a502534c6f71c891ebde7b604'
    '3e4e609198d20ad2fef479ffca96120223df03581b489b0390f27c44075011ff'
    'b3013734f6c551bb669b6236ccdc0c38dde25b946b1b518e77c9b2a6adfb1166'
    '20f7cd3e70fad6f48d2f1a26a485906a36acf30903bf0eefbf82a7c400e248f3'
    'bc17f1ef1e246db44c0fa3874290ad0a5852b0b3fe75902b39834913e3811d98'
)

prepare() {
    [ ! -d mono ] && mkdir mono
    cp "wine-mono-${_monover}-x86.tar.xz" mono/

    [ ! -d build ] && mkdir build
    cd proton-ge-custom
    for submodule in ffmpeg openvr SPIRV-Headers Vulkan-Headers FAudio fonts/liberation-fonts; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url ../"${submodule#*/}"
        git submodule update "${submodule}"
    done

    for submodule in wine wine-staging vkd3d dxvk; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url ../"${submodule#*/}"
        git submodule update "${submodule}"
    done

    for submodule in gstreamer gst-{plugins-{base,good,bad,ugly},libav,orc} glib; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url ../"${submodule#*/}"
        git submodule update "${submodule}"
    done

    git submodule init protonfixes
    git config submodule.protonfixes.url ../protonfixes-gloriouseggroll
    git submodule update protonfixes

    patch -p1 -i "$srcdir"/proton-unfuck_makefile.patch
    patch -p1 -i "$srcdir"/proton-disable_lock.patch
    patch -p1 -i "$srcdir"/proton-user_compat_data.patch

    # Uncomment to enable extra optimizations
    # Patch crossfiles with extra optimizations from makepkg.conf
    patch -p1 -i "$srcdir"/dxvk-extraopts.patch
    local dxvk_cflags="$CFLAGS"
    local dxvk_ldflags="$LDFLAGS"
    # Filter known bad flags before applying optimizations
    # If using -march=native and the CPU supports AVX, launching a d3d9
    # game can cause an Unhandled exception. The cause seems to be the
    # combination of AVX instructions and tree vectorization (implied by O3),
    # all tested archictures from sandybridge to haswell are affected.
    # Disabling either AVX (and AVX2 as a side-effect) or tree
    # vectorization fixes the issue.
    # Relevant Wine issues
    # https://bugs.winehq.org/show_bug.cgi?id=45289
    # https://bugs.winehq.org/show_bug.cgi?id=43516
    dxvk_cflags+=" -mno-avx"
    # Filter fstack-protector{ ,-all,-strong} flag for MingW.
    # https://github.com/Joshua-Ashton/d9vk/issues/476
    #dxvk_cflags+=" -fno-stack-protector"
    dxvk_cflags="${dxvk_cflags// -fstack-protector*([\-all|\-strong])/}"
    # Adjust optimization level in meson arguments. This is ignored
    # anyway because meson sets its own optimization level.
    dxvk_cflags="${dxvk_cflags// -O+([0-3s]|fast)/}"
    # Doesn't compile with these flags in MingW so remove them.
    # They are also filtered in Wine PKGBUILDs so remove them
    # for winelib versions too.
    dxvk_cflags="${dxvk_cflags/ -fno-plt/}"
    dxvk_ldflags="${dxvk_ldflags/,-z,now/}"
    dxvk_ldflags="${dxvk_ldflags/,-z,relro/}"
    sed -i dxvk/build-win64.txt \
        -e "s|@CARGS@|\'${dxvk_cflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${dxvk_ldflags// /\',\'}\'|g"
    sed -i dxvk/build-win32.txt \
        -e "s|@CARGS@|\'${dxvk_cflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${dxvk_ldflags// /\',\'}\'|g"

    ./patches/protonprep.sh
}

build() {
    cd build
    ../proton-ge-custom/configure.sh \
        --no-steam-runtime \
        --with-ffmpeg \
        --build-name="${pkgname%-git}"

    # Use -mno-avx for wine too
    # https://bugs.winehq.org/show_bug.cgi?id=45289
    # https://bugs.winehq.org/show_bug.cgi?id=43516
    export CFLAGS+=" -mno-avx"
    export CXXFLAGS+=" -mno-avx"
    # From wine-staging PKGBUILD
    # Doesn't compile without remove these flags as of 4.10
    export CFLAGS="${CFLAGS/ -fno-plt/}"
    export CXXFLAGS="${CXXFLAGS/ -fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"

    SUBMAKE_JOBS="${MAKEFLAGS/-j/}" \
        WINEESYNC=0 \
        WINEFSYNC=0 \
        NO_DXVK=0 \
        SYSTEM_GSTREAMER=0 \
        SYSTEM_GECKO=1 \
        SYSTEM_MONO=0 \
        make -j1 dist
}

package() {
    cd build

    mkdir -p "$pkgdir/usr/share/steam/compatibilitytools.d"
    mv dist "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"

    find "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}" \
        -exec chmod go-w {} \;
    find "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}" \
        -type f \
        -not -path "*/proton" \
        -not -path "*/dist/bin/*" \
        -not -path "*/dist/lib/*" \
        -not -path "*/dist/lib64/*" \
        -not -path "*/dist/share/default_pfx/*" \
        -exec chmod 644 {} \;
    chmod 755 "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/{proton,dist/bin/{msidb,wine{,64},wine{,64}-preloader,wineserver}}

    ln -s /usr/share/wine/gecko \
        "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/share/wine/gecko

    mkdir -p "$pkgdir/usr/share/licenses/${pkgname%-git}"
    mv "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/LICENSE{,.OFL} \
        "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
