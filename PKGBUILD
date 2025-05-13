# Maintainer: lectrode <electrodexsnet AT gmail>
# Contributor: Matthew "Madness" Evan <matthew.v.evan@outlook.com>
# Contributor: Robert Brzozowski <robson75@linux.pl>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au
# Contributor: /dev/rs0 <rs0@secretco.de.com>
# Contributor: Iven Hsu <ivenvd AT gmail>
# Contributor: Nathan Hulse <nat.hulse@gmail.com>

## basic info
_name='compiz'
_pkgname='compiz-easy-patch'
pkgname="${_pkgname}"
pkgver=0.9.14.2
pkgrel=11
pkgdesc="OpenGL compositing window manager. Includes friendly defaults, GWD theme selector and autostart for Xfce & MATE."
url="https://launchpad.net/compiz"
arch=('i686' 'x86_64')
license=(
  'GPL-2.0-or-later'
  'LGPL-2.1-or-later'
  'MIT'
)

depends=(
  'glibmm'
  'glu'
  'libice'
  'libnotify'
  'libsm'
  'libwnck3'
  'libxslt'
  'metacity'
  'protobuf'
  'python'
  'python-cairo'
  'python-dbus'
  'python-gobject'
  'zenity'
)
makedepends=(
  'boost'
  'cmake'
  'cython'
  'intltool'
  'ninja'
  'python-setuptools'
)
optdepends=(
  'xorg-xprop: grab various window properties for use in window matching rules'
  'xfce-theme-greybird: A grey and blue Xfce theme'
)

replaces=('compiz-manjaro')
provides=(
  "ccsm=${pkgver:0:6}"
  "compiz-bcop=${pkgver:0:6}"
  "compiz-core=${pkgver:0:6}"
  "compiz-plugins-extra=${pkgver:0:6}"
  "compiz-plugins-main=${pkgver:0:6}"
  "compizconfig-python=${pkgver:0:6}"
  "libcompizconfig=${pkgver:0:6}"
  "$_name=${pkgver:0:6}"
)
conflicts=(
  'ccsm'
  'compiz-bcop'
  'compiz-core'
  'compiz-fusion-plugins-experimental'
  'compiz-fusion-plugins-extra'
  'compiz-fusion-plugins-main'
  'compiz-gtk'
  'compizconfig-python'
  'libcompizconfig'
  'simple-ccsm'
  "$_name"
  'compiz-manjaro'
)

_pkgsrc="$_name-${pkgver%%.r*}"
_pkgext="tar.xz"
source=(
  "$_pkgsrc.$_pkgext"::"https://launchpad.net/$_name/${pkgver:0:6}/${pkgver%%.r*}/+download/$_pkgsrc.$_pkgext"

  # Reverse Unity specific configuration patches
  "0001-reverse-unity-config.patch"

  # Set focus prevention level to off which means that new windows will always get focus
  "0002-focus-prevention-disable.patch"

  # Fix incorrect extents for GTK+ tooltips, csd etc
  "0003-gtk-extents.patch"

  # Fix application launching for the screenshot plugin
  "0004-screenshot-launch-fix.patch"

  # Don't try to compile gschemas during make install
  "0005-no-compile-gschemas.patch"

  # New upstream patches
  "0006-Drop-toggle-shaded-since-it-s-no-longer-included-in-.patch"
  "0007-64-bit-time-t-compat.patch"

  # Fix negating windows by default (custom patch by lectrode)
  "0008-fix-negating-windows-by-default.patch"

  # https://bugs.launchpad.net/compiz/+bug/2060620
  "1001-fix-crash-in-vertexbuffer.patch"

  # https://bugs.launchpad.net/compiz/+bug/2103951
  "1002-fix-wrapmode.patch"

  # compiz easy patch tweaks
  "9001-compiz-easy-defaults.patch"
  "compiz-easy.gschema.override"
  "compiz-gtk-decorator-theme-selector"
  "compiz-gtk-decorator-theme-selector.desktop"
  "compiz-xfce-autostart-setup"
  "compiz-xfce-autostart-setup.desktop"
  "compiz-xfce-uninstall-helper"
  "compiz-xfce-uninstall-helper.desktop"
)
sha256sums=(
  'cfa061e93b032275ff9e7041f582a8f6d5ae271cf8a89e6bc74e3d3635999d3c'

  '6ec9c04540ca1649c687d9ab2c8311caea7075831e2cffe719ec7958c9ebab7b'
  'f4897590b0f677ba34767a29822f8f922a750daf66e8adf47be89f7c2550cf4b'
  '16ddb6311ce42d958505e21ca28faae5deeddce02cb558d55e648380274ba4d9'
  '89ee91a8ea6b1424ef76661ea9a2db43412366aacddc12d24a7adf5e04bfbc61'
  '4ab3277da201314b3f65e30128bc30704ddee584fdbbfc8d0d83c7e0de91fa9a'
  '9b9e92a7174f2255f408d340dcb7b765211777cd92fe9ed17b5888ff13578291'
  '90969b7beba107a7146b11c3a60969b62c2be7a3e891d7dee913504ec6de759c'
  '4fb18253eb1b438cfd5e8e9acb740b368cf18eace07459cb094ce7a9198e6d89'
  '859dca15821fac3b8d1e231d48932c0fad3f5d3f16cb53a8a761df2bd51b9d3a'
  '8edae4f7b0ac67c8bf46a429a7c08cff1aae16dd2949a291fdf8ce27d39a6aa8'

  '4d28bc2cefbfae77b9157f39876f5296b5edb7fb00de2a391a262688d2f7590c'
  'b549d6a61115ab0cbd6bf74be79cd449477aaadb6a9968743236e3ed3d93f668'
  '28d14e5ec0694b4a451540f35210eac5699e9daf1b00020bf59d8b0296d7d9bf'
  '0faaf9e9df28d2857108ccd0910d50ba631c34c2b1659b8860da8c2b552fc889'
  '3e46a0b50a16d9fd6fd4f9d28f6082fc76f39dff8a82a79af312126a6bcf7cc2'
  'd23b8633186bb3a2a841734ad0b917500f3536a67046f5d8fbb08818eab59160'
  '5c471a34a1d79a45e8c4a924f0f58d71199328e45c80472fe32ecaac76c987ee'
  '02eec20f75eb1f9571a2cf92013fc3c78d13c155a8ede0467cc10b83cdeba43c'
)

install="${_pkgname}.install"

prepare() {
  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done

  #build fix 2025/05/01 https://aur.archlinux.org/cgit/aur.git/commit/?h=compiz&id=3973b9fb7dcb3fa6a37ee1bbd084d23016b48a2e
  sed -E \
    -e 's&^(destroy_(bare|normal|switcher)_frame)\s?.*;$&\1 (decor_frame_t *frame);&' \
    -i "gtk/window-decorator/gtk-window-decorator.h"
}

build() {
  export CXXFLAGS+=" -Wno-error=incompatible-pointer-types" #build fix 2025/05/01

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_CXX_STANDARD=17
    -DBUILD_GTK=ON
    -DBUILD_METACITY=ON
    -DCOMPIZ_BUILD_TESTING=OFF
    -DCOMPIZ_BUILD_WITH_RPATH=OFF
    -DCOMPIZ_DEFAULT_PLUGINS="composite,opengl,decor,resize,place,move,compiztoolbox,staticswitcher,expo,grid,regex,animation,ccp"
    -DCOMPIZ_DISABLE_SCHEMAS_INSTALL=ON
    -DCOMPIZ_PACKAGING_ENABLED=ON
    -DCOMPIZ_WERROR=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"

  # A race condition consistently causes build to fail in the following environment:
  # * processor has more than 4 threads
  # * compile folder is located on a spindle hdd
  # * MAKEFLAGS is configured to run more than 4 jobs at the same time
  # Limiting max simultaneous make jobs to 4 or less seems to work around the issue
  mjobs=4; [[ "$(nproc)" -lt 4 ]] && mjobs="$(nproc)"
  if [[ "$MAKEFLAGS" = "" ]]; then
    MAKEFLAGS="-j$mjobs"
  else
    curmjobs="$(echo "$MAKEFLAGS"|grep -oE '\-j[0-9]+'|cut -d'j' -f2)"
    if [[ "$curmjobs" = "" ]]; then
      MAKEFLAGS+=" -j$mjobs"
    else
      [[ "$curmjobs" -gt "$mjobs" ]] && MAKEFLAGS="${MAKEFLAGS//-j$curmjobs/-j$mjobs}"
    fi
  fi
  export MAKEFLAGS

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # findcompiz_install needs COMPIZ_DESTDIR and install needs DESTDIR
  # make findcompiz_install
  CMAKE_DIR=$(cmake --system-information | grep '^CMAKE_ROOT' | awk -F\" '{print $2}')
  install -Dm644 "$_pkgsrc/cmake/FindCompiz.cmake" \
    -t "${pkgdir}${CMAKE_DIR}/Modules/"

  # documentation
  install -Dm644 "$_pkgsrc"/{AUTHORS,NEWS,README} \
    -t "$pkgdir/usr/share/doc/compiz/"

  # gsettings schema files
  if ls build/generated/glib-2.0/schemas/ | grep -qm1 .gschema.xml; then
    install -Dm644 build/generated/glib-2.0/schemas/*.gschema.xml \
      -t "$pkgdir/usr/share/glib-2.0/schemas/"
  fi

  # licenses
  install -Dm644 "$_pkgsrc"/{COPYING,COPYING.GPL,COPYING.LGPL,COPYING.MIT} \
    -t "$pkgdir/usr/share/licenses/$pkgname"

  ## Easy Patch Stuff ##

  # Add dconf/gsettings schema override file
  install -Dm644 "$srcdir/compiz-easy.gschema.override" \
    -t "$pkgdir/usr/share/glib-2.0/schemas/"

  # Make ccsm icon appear in Xfce settings manager
  sed -i 's|Categories=Settings;DesktopSettings;|Categories=Settings;DesktopSettings;X-XFCE-SettingsDialog;X-XFCE-OtherSettings;|' "$pkgdir/usr/share/applications/ccsm.desktop"

  # Install GWD theme selector app
  install -Dm755 "$srcdir/compiz-gtk-decorator-theme-selector" \
    -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/compiz-gtk-decorator-theme-selector.desktop" \
    -t "$pkgdir/usr/share/applications/"

  # Place autostart/theme scripts/enablers
  install -Dm755 "$srcdir"/compiz-xfce-{'autostart-setup','uninstall-helper'} \
    -t "${pkgdir}/usr/bin/"
  install -Dm644 "$srcdir"/compiz-xfce-{'autostart-setup','uninstall-helper'}.desktop \
    -t "${pkgdir}/etc/xdg/autostart/"
}
