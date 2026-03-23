# Maintainer: Duru Can Celasun <can[at]dcc[dot]im>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-vaapi
_pkgname=firefox
pkgver=149.0
pkgrel=1
pkgdesc="Fast, Private & Safe Web Browser (with VA-API patches)"
url="https://www.mozilla.org/firefox/"
arch=(x86_64)
license=(MPL-2.0)
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libgcc
  libpulse
  libstdc++
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
makedepends=(
  cbindgen
  clang
  diffutils
  imake
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  onnxruntime
  python
  rust
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  xorg-server-xvfb
  yasm
  zip
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'onnxruntime: Local machine learning features such as smart tab groups'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
provides=(firefox=${pkgver})
conflicts=(firefox)
options=(
  !emptydirs
  !lto
  !makeflags
)
source=(
  https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz{,.asc}
  $_pkgname-symbolic.svg
  $_pkgname.desktop
  org.mozilla.$_pkgname.metainfo.xml
  0000-remove-nvidia-blocklist.patch
  0001-Install-under-remoting-name.patch
  0002-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch
  0003-Bug-2016618-Fix-Linux-sandbox-build-breakage-on-glib.patch
  0004-Use-wasm32-wasip1-target.patch
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2025/04/01/updated-gpg-key-for-signing-firefox-releases-2/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)
sha256sums=('b861fdee999d9b6404e1e865d6f707c41b4bded1b5ea62affc176288c1484b8a'
            'SKIP'
            'a9b8b4a0a1f4a7b4af77d5fc70c2686d624038909263c795ecc81e0aec7711e9'
            '5985c41a64dde6df3d31769ac57ddb59b94b1626aadb309fb488cdf6f3aa7015'
            '58d78ce57b3ee936bc966458d6b20ab142d02a897bbe924b3f26717af0c5bee1'
            '06e30b49678a48f4b6d5eb74de91f743734c7d21efd442777c77aee8cf5dad85'
            '4c53a3681e67fd586869c4c81c6ea195aa5b9ac4c08945560a3afc7c5b74b073'
            'fdc3df45b908191d1cfc3e593bb3140080feb80bd47bfdd58dbce79207dc7ece'
            'bfe4add19e77a67b06fa8ce7a01cd2328da39a6dbfb1a5409c237bd65856ccf5'
            '53ef3a18bde8cfe321b37f0e6f60272620f54c9696080d62eea632ce98ef34ca')
b2sums=('8b1d084dc2b8a7de85cc54aef57adda94afa191d4adb7a6e6ef1339e8a3cc7a7d8a42df52f858bcff358f69382e163ba42b2142126dcdbd1ad1cdc4bad0c0114'
        'SKIP'
        '63a8dd9d8910f9efb353bed452d8b4b2a2da435857ccee083fc0c557f8c4c1339ca593b463db320f70387a1b63f1a79e709e9d12c69520993e26d85a3d742e34'
        'c993d2c86c3ae7d63721f2df3cad64485e53cfc6b3f45cbd53e96765e4dab4bfaa9581cf4e8e458d61e749ba3adce6e11487cfb18227bfe7d193c4dd911e63c3'
        '2ce33432f8a73a4f1a412b7a065d3c124e1ca9f6bdf3fad0407e897efc0840f8ef43eeeb1b9bef4a102d9fac0b2c4a2ef205726b817f83fe9c3742d076778b14'
        'a59a736b1176ce523ec61357bc918b5792e7e35db0239e6776179d1e5942fd69640735ebf19e0824b71ddbdb3bd96a836e89cd2dced498a32374ebd7308db778'
        '82c1e48ba8ef31df7ea3ec75114b81cd8cb164c84116d0d8cad58e68a3af3417d91a660f2fa17365af359828c19064fd6c0893f390e5758cf82c82c5e6292f22'
        '568db760f2db13c758739da95ff060e7d039890dc3470636de23cb3c2474c505cc9ca7c9b5ed9e48f9b089d5443057b3139ed8f88b9616300a8bd908fc0a2f9e'
        'c8ce3b13b0983172dc7fae4cd241b584a41856b2b912baaba6844a89b3dd9b6dd3a038c4f66c15ba08790b13275aa7041b23ba41294d9875e22816933f967a39'
        'da279ffe2f16be7ce7342b4c60da00e843aec8edeef4ac41e769fb1aa5a01dcb90cabaf68413da9871329881e5226b74a820b20c3da091e5b21d4966a3c7c6ce')

# Google API keys (see https://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

prepare() {
  mkdir mozbuild
  cd firefox-$pkgver

  # Disable NVIDIA blocklists, to make it function with libva-nvidia-driver-git AUR package
  msg2 "Patching Nvidia blocklist"
  patch -Np1 -i ../0000-remove-nvidia-blocklist.patch

  # Make different channels installable in parallel
  patch -Np1 -i ../0001-Install-under-remoting-name.patch

  # Fix build with glibc 2.43
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1999625
  patch -Np1 -i ../0002-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch
  # https://bugzilla.mozilla.org/show_bug.cgi?id=2016618
  patch -Np1 -i ../0003-Bug-2016618-Fix-Linux-sandbox-build-breakage-on-glib.patch
  
  # Fix build with Clang 22
  patch -Np1 -i ../0004-Use-wasm32-wasip1-target.patch

  echo -n "$_google_api_key" >google-api-key

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-install-strip
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$_pkgname

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
END
}

build() {
  cd firefox-$pkgver

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build --priority normal

  echo "Profiling instrumented browser..."
  ./mach package
  LLVM_PROFDATA=llvm-profdata JARLOG_FILE="$PWD/jarlog" \
    dbus-run-session \
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach python build/pgo/profileserver.py

  stat -c "Profile data found (%s bytes)" merged.profdata
  test -s merged.profdata

  stat -c "Jar log found (%s bytes)" jarlog
  test -s jarlog

  echo "Removing instrumented browser..."
  ./mach clobber objdir

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross,full
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build --priority normal
}

package() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install
  local appdir="$pkgdir/usr/lib/$_pkgname"

  install -Dvm644 /dev/stdin "$appdir/browser/defaults/preferences/vendor.js" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);

// Enable WebRender
pref("gfx.webrender.all", true);

// Enable hardware accelerated video
pref("media.hardware-video-decoding.enabled", true);
pref("media.hardware-video-decoding.force-enabled", true);
pref("media.ffmpeg.vaapi.enabled", true);
pref("media.webrtc.hw.h264.enabled", true);
END

  install -Dvm644 /dev/stdin "$appdir/distribution/distribution.ini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  # Link up system ONNX runtime
  ln -srv "$pkgdir/usr/lib/libonnxruntime.so" -t "$appdir"

  # Install desktop icons and metadata
  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$_pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

  install -Dvm644 ../$_pkgname-symbolic.svg -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
  install -Dvm644 ../$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dvm644 ../org.mozilla.$_pkgname.metainfo.xml -t "$pkgdir/usr/share/metainfo"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
exec /usr/lib/$_pkgname/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/firefox-bin"

  # Use system certificates
  if [[ -e $appdir/libnss3.so ]]; then
    ln -sfv ../libnssckbi.so -t "$appdir"
  fi

  # Register GNOME search provider
  install -Dvm644 /dev/stdin "$pkgdir/usr/share/gnome-shell/search-providers/$_pkgname.search-provider.ini" <<END
[Shell Search Provider]
DesktopId=$_pkgname.desktop
BusName=org.mozilla.${_pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${_pkgname//-/}/SearchProvider
Version=2
END
}

# vim:set sw=2 sts=-1 et:

