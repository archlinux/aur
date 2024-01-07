# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Figue <ffigue@gmail.com>
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-esr52
pkgver=52.9.0
pkgrel=9
pkgdesc='Standalone web browser from mozilla.org, Extended Support Release 52.x with NPAPI support'
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url='https://www.mozilla.org/en-US/firefox/organizations/'
depends=('gtk3' 'gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'ffmpeg' 'libvpx' 'libevent' 'nss' 'hunspell'
         'sqlite' 'ttf-font' 'icu')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'gconf'
             'libpulse' 'inetutils' 'xorg-server-xvfb' 'autoconf2.13' 'rust'
             'patch')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'speech-dispatcher: Text-to-Speech')
provides=('firefox')
options=('!emptydirs' '!makeflags')
source=("https://ftp.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz"
        "${pkgname}.desktop"
        "${pkgname}-symbolic.svg"
        "0001-Bug-54395-remove-hardcoded-flag-lcrmf.patch"
        "firefox-install-dir.patch"
        "fix-wifi-scanner.diff"
        "make_SystemResourceMonitor.stop_more_resilient_to_errors.patch"
        "use_noexcept_in_mozalloc.patch"
        "ffmpeg4.patch.gz"
        "${pkgname}.sh"
        "mozconfig"
        "vendor.js"
        "distribution.ini"
        "gcc9_format-overflow.patch"
        "glibc-gettid-wrapper.patch"
        "gfxFont.patch"
        "linux_remove_sysctl.patch"
        "gcc11_limits.patch"
        "mach_install_ignore_errors.patch"
        "seamonkey-use-scoped-enums-in-IDBTransaction.patch"::"https://bugs.archlinux.org/task/71113?getfile=20366"
        "RemoteSpellCheckEngineChild.patch"
        "icu74_nsJISx4051LineBreaker.patch"
        "gcc_lto-partitions.patch"::"https://bug1258215.bmoattachments.org/attachment.cgi?id=8766692"
        "arc4random.patch"
        "mathops_operand_type_mismatch_for_shr.patch"::"https://git.videolan.org/?p=ffmpeg.git;a=patch;h=effadce6c756247ea8bae32dc13bb3e6f464f0eb")
sha256sums=('c01d09658c53c1b3a496e353a24dad03b26b81d3b1d099abc26a06f81c199dd6'
            '9efd02ff78c31f8690a12401faac2605dffcac12eaf11e1791ec4221570c2746'
            'a2474b32b9b2d7e0fb53a4c89715507ad1c194bef77713d798fa39d507def9e9'
            '93c495526c1a1227f76dda5f3a43b433bc7cf217aaf74bd06b8fc187d285f593'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            '9765bca5d63fb5525bbd0520b7ab1d27cabaed697e2fc7791400abc3fa4f13b8'
            '7760ebe71f4057cbd2f52b715abaf0d944c14c39e2bb2a5322114ad8451e12d9'
            '32eae55bf9151df5f77ee98585e6cef4cc7ee2e5f2ca44c1a42f87d132eb22d8'
            '2a285e0c31968e3fe9b65a585838b46f9342ff0a369e786a729b4c3886617034'
            'fc0bc82aa88b15ce9ebf35d2d12750e2cd3b6bd93d5fc7b52b596f76e0e58608'
            '1c17c99ffc7ddf83d79ee76a91927a55a45bb6bd459bcff3baf79c5ad5748645'
            '3c039dbfdcf63022812b51f35289b176b26b4a9933da073f8788fde02be9fdcd'
            '8ae5b7cd1f7092f13859b632e1e5f69948b2801e0459fdf29c745c89f8eeb823'
            'b66a84af7cc1809fe9dd0d7737f6043be2919ebe0a2c752cca483d67957ad431'
            'e2f6353d2021bb2490acd7216762cd5bae41eb55a82e245813a62a7024c01229'
            'ba7858a8cb852388c870bb9acd20bedc5e9cb0b2cf7bdfa5c334e61350279232'
            '1f324e9a5bf195a58416f622c025a9dd0aac7d802f838e44d9b55b34a0e56585'
            'f88b950d72d5edae01289fddb29dad75de075ed61735782da6687bf56af225d8'
            'cc1cbddc8f984dc6e626eda530e67592ac1982f5644318b7873e989392926612'
            '6227a54ef4519c19ab8e39412bca71711fabab393491db691f7ef90dbe99f225'
            '979ddabbd475eee2664a63667cd4c7867ce781d5b8fc14a3de3fe51577b75bf0'
            '0aedf9faa0be244be6fefbe25bf5f85df0ce757f7b0d45720b1baa2f6ee1f990'
            '64118a811ecf34762c433bad92e9e895c69b8a3060e7261246519a2b6d25ff1b'
            '0a8a8119c3b10d09f7caf3ebe9b25ae7f51001ce835cab8baafc507fb3fd6772'
            'a50d7da9870a3fd801ad3a4d13d5c9b260acb094cf8bfa4afd95a54741173a7f')
validpgpkeys=('2B90598A745E992F315E22C58AB132963A06537A')

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key='AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM'

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key='16674381-f021-49de-8622-3021c5942aff'

prepare() {
  mkdir "build"
  ln -s "/usr/bin/python2" "build/python"

  cd "firefox-${pkgver}esr"

  # Remove dangling old-configure file in the source package
  rm "old-configure"

  patch -Np1 -i "${srcdir}/firefox-install-dir.patch"
  sed -i 's#^installdir .*#installdir = $(libdir)/firefox-esr52#' "config/baseconfig.mk"

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  patch -Np1 -i "${srcdir}/fix-wifi-scanner.diff"

  # https://bugs.archlinux.org/task/54395 // https://bugzilla.mozilla.org/show_bug.cgi?id=1371991
  patch -Np1 -i "${srcdir}/0001-Bug-54395-remove-hardcoded-flag-lcrmf.patch"

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1384062
  patch -Np1 -i "${srcdir}/make_SystemResourceMonitor.stop_more_resilient_to_errors.patch"

  # https://hg.mozilla.org/mozilla-central/rev/ae7e3082d862
  patch -Np1 -i "${srcdir}/use_noexcept_in_mozalloc.patch"

  # https://hg.mozilla.org/releases/mozilla-esr60/rev/2f39b32593bd
  # https://svnweb.freebsd.org/ports/head/www/firefox/files/patch-bug1435212?view=markup&pathrev=468159
  gzip --keep --decompress --to-stdout "${srcdir}/ffmpeg4.patch.gz" > ffmpeg4.patch
  patch -Np0 -i "ffmpeg4.patch"

  echo -n "${_google_api_key}" >google-api-key
  echo -n "${_mozilla_api_key}" >mozilla-api-key
  install -m 644 "${srcdir}/mozconfig" ".mozconfig"
  # Fix path for Google API and Mozilla API keys
  sed -i "s#\$SOURCE#${PWD}#" ".mozconfig"

  # Fix for GCC 9 and format overflow incompatibilities
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1514781
  # https://forum.palemoon.org/viewtopic.php?t=21745
  # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=925781
  patch -Np1 -i "${srcdir}/gcc9_format-overflow.patch"

  # Fix for gettid() wrapper in newer glibc
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1533969
  patch -Np1 -i "${srcdir}/glibc-gettid-wrapper.patch"
  
  # Fix for gfxFont.cpp
  patch -Np1 -i "${srcdir}/gfxFont.patch"
  
  # Fix for missing sysctl.h in memory/mozjemalloc/jemalloc.c
  patch -Np1 -i "${srcdir}/linux_remove_sysctl.patch"

  # Fix for limits on BaseRect.h
  patch -Np1 -i "${srcdir}/gcc11_limits.patch"

  # Ignore mach install errors as it's buggy ATM
  patch -Np1 -i "${srcdir}/mach_install_ignore_errors.patch"

  # Fix for nss 3.66
  patch -Np1 -i "${srcdir}/seamonkey-use-scoped-enums-in-IDBTransaction.patch"
  
  # Fix for RemoteSpellCheckEngineChild
  patch -Np1 -i "${srcdir}/RemoteSpellCheckEngineChild.patch"
  
  # Fix for icu 74
  patch -Np1 -i "${srcdir}/icu74_nsJISx4051LineBreaker.patch"
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1862601
  
  # Fix for G++ lto-partitions=1
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1258215
  patch -Np1 -i "${srcdir}/gcc_lto-partitions.patch"
  
  # Fix for arc4random
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1782988
  patch -Np1 -i "${srcdir}/arc4random.patch"
  
  # Fix for ffmpeg mathops
  # https://hg.mozilla.org/releases/mozilla-esr115/rev/e024fe4fd62c
  cd "media/ffvpx"
  patch -Np1 -i "${srcdir}/mathops_operand_type_mismatch_for_shr.patch"
}

build() {
  cd "firefox-${pkgver}esr"

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=' -O2'

  export PATH="${srcdir}/path:${PATH}"
  ./mach build
}

package() {
  cd "firefox-${pkgver}esr"
  DESTDIR="${pkgdir}" ./mach install

  # Install custom preferences
  install -m 644 -D "${srcdir}/vendor.js" \
    "${pkgdir}/usr/lib/${pkgname}/browser/defaults/preferences/vendor.js"
  install -m 644 -D "${srcdir}/distribution.ini" \
    "${pkgdir}/usr/lib/${pkgname}/distribution/distribution.ini"

  # Install icons
  for _size in 16 22 24 32 48 256
  do
    install -m 644 -D "browser/branding/official/default${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done
  install -m 644 -D "browser/branding/official/content/icon64.png" \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
  install -m 644 -D "browser/branding/official/mozicon128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -m 644 -D "browser/branding/official/content/about-logo.png" \
    "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${pkgname}.png"
  install -m 644 -D "browser/branding/official/content/about-logo@2x.png" \
    "${pkgdir}/usr/share/icons/hicolor/384x384/apps/${pkgname}.png"
  install -m 644 -D "../${pkgname}-symbolic.svg" \
    "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/${pkgname}-symbolic.svg"

  # Install desktop file
  install -m 644 -D "../${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Use system-provided dictionaries
  rm -r "${pkgdir}/usr/lib/${pkgname}/dictionaries"
  ln -Ts /usr/share/hunspell "${pkgdir}/usr/lib/${pkgname}/dictionaries"
  ln -Ts /usr/share/hyphen "${pkgdir}/usr/lib/${pkgname}/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -m 755 -D "${srcdir}/${pkgname}.sh" \
    "${pkgdir}/usr/bin/${pkgname}"

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  rm "${pkgdir}/usr/bin/firefox"
  ln -srf "${pkgdir}/usr/bin/${pkgname}" \
    "${pkgdir}/usr/lib/${pkgname}/firefox-bin"

  # Rename firefox directories to package directories
  mv "${pkgdir}/usr/include/firefox-${pkgver}" \
    "${pkgdir}/usr/include/${pkgname}"
  mv "${pkgdir}/usr/lib/firefox-devel-${pkgver}/sdk" \
    "${pkgdir}/usr/lib/${pkgname}"
  mv "${pkgdir}/usr/lib/firefox-devel-${pkgver}/xpcom-config.h" \
    "${pkgdir}/usr/lib/${pkgname}"
  rm "${pkgdir}/usr/lib/firefox-devel-${pkgver}/bin"
  rm "${pkgdir}/usr/lib/firefox-devel-${pkgver}/idl"
  rm "${pkgdir}/usr/lib/firefox-devel-${pkgver}/include"
  rm "${pkgdir}/usr/lib/firefox-devel-${pkgver}/lib"
  mv "${pkgdir}/usr/share/idl/firefox-${pkgver}" \
    "${pkgdir}/usr/share/idl/${pkgname}"
}
