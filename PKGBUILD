# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Andrew Crerar <crerar@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>

_pkgname=firefox-developer-edition
_patchurl=https://raw.githubusercontent.com/openSUSE/firefox-maintenance/master

pkgname=firefox-developer-edition-kde
pkgver=94.0b9
pkgrel=1
pkgdesc="Developer Edition of the popular Firefox web browser."
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/channel/#developer"
depends=('gtk3' 'libxt' 'mime-types' 'dbus-glib' 'ffmpeg' 'ttf-font' 'libpulse' 'nss'
         'hicolor-icon-theme' 'kmozillahelper' 'nspr' 'hunspell')
makedepends=('unzip' 'zip' 'diffutils' 'python-setuptools' 'yasm' 'mesa' 'imake' 'inetutils'
             'xorg-server-xvfb' 'libpulse' 'inetutils' 'autoconf2.13' 'rust' 'clang' 'llvm' 'jack' 'nodejs'
             'cargo' 'mercurial' 'llvm' 'python-psutil' 'cbindgen' 'nasm' 'lld' 'python-zstandard' 'dump_syms')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
conflicts=('firefox-developer-edition')
provides=('firefox-developer-edition')
options=(!emptydirs !makeflags !strip)
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz{,.asc}
        firefox-install-dir.patch
        0001-Use-remoting-name-for-GDK-application-names.patch
        0002-Add-missing-default-scheme.patch
        "$_pkgname".desktop
        identity-icons-brand.svg
        # https://github.com/openSUSE/firefox-maintenance
        mozilla-nongnome-proxies.patch::$_patchurl/mozilla-nongnome-proxies.patch
        mozilla-kde.patch::$_patchurl/mozilla-kde.patch
        mozilla-ntlm-full-path.patch::$_patchurl/mozilla-ntlm-full-path.patch
        mozilla-sandbox-fips.patch::$_patchurl/mozilla-sandbox-fips.patch
        mozilla-bmo1005535.patch::$_patchurl/mozilla-bmo1005535.patch
        mozilla-bmo1504834-part1.patch::$_patchurl/mozilla-bmo1504834-part1.patch
        mozilla-bmo1504834-part2.patch::$_patchurl/mozilla-bmo1504834-part2.patch
        mozilla-bmo1504834-part3.patch::$_patchurl/mozilla-bmo1504834-part3.patch
        mozilla-bmo1504834-part4.patch::$_patchurl/mozilla-bmo1504834-part4.patch
        mozilla-fix-top-level-asm.patch::$_patchurl/mozilla-fix-top-level-asm.patch
        mozilla-bmo849632.patch::$_patchurl/mozilla-bmo849632.patch
        mozilla-bmo998749.patch::$_patchurl/mozilla-bmo998749.patch
        mozilla-bmo1626236.patch::$_patchurl/mozilla-bmo1626236.patch
        mozilla-bmo531915.patch::$_patchurl/mozilla-bmo531915.patch        
        firefox-branded-icons.patch::$_patchurl/firefox/firefox-branded-icons.patch
        firefox-kde.patch::$_patchurl/firefox/firefox-kde.patch
)
sha512sums=('3a752f0ef8816427dddbe64f26c16da12fa430dfbc94bf44945d54fd0d581a5191d8a8f0e6aaf0e078697b71b6badc386276af27c8282dcea408bc011851404c'
            'SKIP'
            'b66dbe7f262d036e5a5b895ab5b0dbb03313bca18b0823c001ef2dbaeb1a33169b57db0cf4dfd268499f28913845119902b5d62e8a6a9cc4820eb0ee2f322a1e'
            '624a2531b4b85b1ad2286f0a6529313d9ae8a543b9f799a1f06d564db003f126e7bb3b5a35c6ab2f28d0e495a399d97476df8436914ba637cf627b52c3ab6f8d'
            '2a46f450fa230b964bc105087d578574bebccc18c337d89860740caeb00ea798c69edc70b256d87437dc4e791d1d223dbb1b70531c32333d6b23fa3550d1d941'
            '96d56ed8d14dd16cd44df5dc156d81a4426280cdd8bd61e71831b7555c4d4a256fca523ce53852f6f98a546bf20d92b9c63aeeaff7a06174b8da7a8028394397'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'dcdaba2b51f8e7dc4fbfeb7c707581a136d8727a64352fb09f40e62c1bba03f66d4770d21bd9ea0b9a249314fd4ce273bb42efb7108db39bbbadf1d0ddb8e3aa'
            '70e0098da963540eb685184bf24e32c4b7ecb28a373d6c1792961bf3142f964af247c94774be0ae1e014c9e43bf4aee439cb45dcf882ad234bdb00709b3e71d9'
            'a8d1da2d85cd59c9254cd10800957eebb2e60818968739c9711d53d651a72b7a895b3cf973e24c019ec996a1ad7e2f3e28448e4e3a43761ee00b53284274e400'
            '4716b5e450231ba375c26177a8983c8689054df0e8889488455bb1e045ec584f7bf7b7d0779c49fca43e2a05bcf25391dc7f825fadaa1079b283d9679083854f'
            'c46a5e05a7cfa6acceae7b3474b5fa26727b32369b1bbd93fcdb0bd3aa2b42192b7ce4ba540ecc1011317024f8005b264fa85273385e15e89c93c489f7da3c03'
            'c84d412df15a8aeaad41000f591e504bfef054614daff3246f292be59ce3b25e724149a94bdead5bcae5f1704c7e7c987b8130fa38f8dac0df466bdc8b9bb0e2'
            '7158ddd53b0e25e534f3df762d607c83f4e3e19385758534adcd1e3fc514d689373048fac878b8e27701bfc863ba6a52860d5dfb64902ec8ce59af427e7fb6c6'
            '4c9df14609e16ece6cbfd321b1242e6fc4377341ea269ec68aa2747c34cc2c40e38f342bdee1f1f5a4d4c6da62233706ec3ed677bcfafdcebe94200ff71e24fd'
            'aa3f0d0e2603d32722ba59700efdc4e618fe3ba15f4a2ecb3c63b28dc892138dbc1427b04e9f9749ff5009ca935c70d7c6cefe5b0ad6b121b82f5cf07ea45086'
            '31738b0d7c2ae0fbdc567e84d24774e057bc0257af66e3c08a6386828051d3df4fc7aaacf71aee5a7badfa0734a8999ce1a002e639b1cf35e576b1d889edcfea'
            '6b9e3589a7359499cf197556c00ee32193ee32b8bfb0d8811511d05105e89e107c8c0b3543a96b0234b0893c260ba6e07de23da67493505a846baf42d59cfd6e'
            '3216e96e7cd1624945595f016fbe76a699d8627c60250768857c74c2453e66e3cc9207bfbf486ea1be5685b595bf1ae4626401502f723e94320c42c7b12d0785'
            '773be00a1aea29527e8556b152f463e477f025785e2ca98ca12804b3a5783444bdf4f6d6765b167f64dce3110b91af5efed58c1744d35b2da187d1b4eac8ed59'
            '7c149f99541fb9d6f67a17987ce1ef4456799ac8ad7dc9d963b7a3435f024892014e8c577e7ee79735cbcaff9b67328d4c0e22c73adebf1052102cbcc95c85a8'
            '29eb82ff71385b299b2f1baefbb32c5add484117315245ca21d5d521ec9281d08023753d3daff731ecf93df83f9f1e945cd04a3320f0e05c0d675afbcab6ecc3'
            '4c4c6cdc86da0a7e335526df763379e24af2caa282b25d6ea32dbbc6af6c499177b1f4ae87b2f010e38be812c2529e79ac47abc692774e19af117ccbe9a5bbb1')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases <release@mozilla.com>

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=e05d56db0a694edc8b5aaebda3f2db6a

prepare() {
  mkdir mozbuild
  cd firefox-${pkgver%b*}

  # Install location
  patch -Np1 -i ../firefox-install-dir.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1530052
  patch -Np1 -i ../0001-Use-remoting-name-for-GDK-application-names.patch

  # https://github.com/openSUSE/firefox-maintenance/blob/master/firefox/MozillaFirefox.spec
  # Gecko/Toolkit
  patch -Np1 -i ../mozilla-nongnome-proxies.patch
  patch -Np1 -i ../mozilla-kde.patch
  patch -Np1 -i ../mozilla-ntlm-full-path.patch
  patch -Np1 -i ../mozilla-sandbox-fips.patch
  patch -Np1 -i ../mozilla-bmo1005535.patch
  patch -Np1 -i ../mozilla-bmo1504834-part1.patch
  patch -Np1 -i ../mozilla-bmo1504834-part2.patch
  patch -Np1 -i ../mozilla-bmo1504834-part3.patch
  patch -Np1 -i ../mozilla-bmo1504834-part4.patch
  patch -Np1 -i ../mozilla-fix-top-level-asm.patch
  patch -Np1 -i ../mozilla-bmo849632.patch
  patch -Np1 -i ../mozilla-bmo998749.patch
  patch -Np1 -i ../mozilla-bmo1626236.patch
  patch -Np1 -i ../mozilla-bmo531915.patch

  # Firefox/browser
  patch -Np1 -i ../firefox-kde.patch
  patch -Np1 -i ../firefox-branded-icons.patch

  # https://github.com/openSUSE/firefox-maintenance/issues/37
  patch -Np1 -i ../0002-Add-missing-default-scheme.patch

  echo -n "$_google_api_key" > google-api-key
  echo -n "$_mozilla_api_key" > mozilla-api-key

  cat > ../mozconfig << END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
# ac_add_options --with-ccache=sccache
export CC='clang --target=x86_64-unknown-linux-gnu'
export CXX='clang++ --target=x86_64-unknown-linux-gnu'
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib

# Branding
ac_add_options --enable-official-branding
ac_add_options --with-branding=browser/branding/aurora
ac_add_options --enable-update-channel=aurora
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=firefox-developer-edition
export MOZ_TELEMETRY_REPORTING=1
export MOZ_REQUIRE_SIGNING=

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
# ac_add_options --enable-default-toolkit=cairo-gtk3
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
END
}

build() {
  cd firefox-${pkgver%b*}

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MACH_USE_SYSTEM_PYTHON=1
  export MOZ_ENABLE_FULL_SYMBOLS=1

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build

  echo "Profiling instrumented browser..."
  ./mach package
  LLVM_PROFDATA=llvm-profdata \
    JARLOG_FILE="$PWD/jarlog" \
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach python build/pgo/profileserver.py

  stat -c "Profile data found (%s bytes)" merged.profdata
  test -s merged.profdata

  stat -c "Jar log found (%s bytes)" jarlog
  test -s jarlog

  echo "Removing instrumented browser..."
  ./mach clobber

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package() {
  cd firefox-${pkgver%b*}
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$vendorjs" << END
// Use LANG environment variable to choose locale.
pref("intl.locale.requested", "");

// Use system-provided dictionaries.
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable our bundled extensions in the application directory.
pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/$_pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$distini" << END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox Developer Edition for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  local i theme=aurora
  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$_pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
  install -Dvm644 ../identity-icons-brand.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_pkgname-symbolic.svg"

  install -Dm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/bin/sh
exec /usr/lib/$_pkgname/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/firefox-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$_pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srf "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  export SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE="$startdir/.crash-stats-api.token"
  if [[ -f $SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE ]]; then
    make -C obj uploadsymbols
  else
    cp -fvt "$startdir" obj/dist/*crashreporter-symbols-full.tar.zst
  fi
}
