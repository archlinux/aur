# Maintainer: The one with the braid <info@braid.business>

pkgbase=flutter-artifacts-google-bin
_group=flutter
groups=("$_group")
pkgver=3.24.3
# in order to update these version hashes, consult the PKGBUILD and update-artifact-versions.sh
# script of https://aur.archlinux.org/pkgbase/flutter
_enginever=36335019a8eab588c3c2ea783c618d90505be233
_materialfontsver=3012db47f3130e62f7cc0beabff968a33cbec8d8
_gradlewver=fd5c1f2c013565a3bea56ada6df9d2b8e96d56aa
_flutterarch=$(echo "$CARCH" | sed s/aarch64/arm64/ | sed s/x86_64/x64/)
_dartver="3.5.3"
_dartmin="3.5.0"
_dartmax="3.6.0"
# this host is blocked in China, according to Flutter docs, the FLUTTER_STORAGE_BASE_URL environment variable
# should be used to provide an alternative mirror
_storagebase="${FLUTTER_STORAGE_BASE_URL:-"https://storage.googleapis.com"}"
pkgrel=1
_pkgdesc="Flutter SDK artifacts (binary from Google)"
pkgdesc="${_pkgdesc}"
arch=("x86_64" "aarch64")
url="https://${_group}.dev"
license=("custom" "BSD" "CCPL")
makedepends=(
	"unzip"
	"tar"
)
options=("!emptydirs")
source=(
  # material_fonts
  "material_fonts-${_materialfontsver}.zip::${_storagebase}/flutter_infra_release/flutter/fonts/${_materialfontsver}/fonts.zip"
  # gradle_wrapper
  "gradle_wrapper-${_gradlewver}.tar.gz::${_storagebase}/flutter_infra_release/gradle-wrapper/${_gradlewver}/gradle-wrapper.tgz"

  # engine/android-x86
  "android-x86-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-x86/artifacts.zip"
  # engine/android-x64
  "android-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-x64/artifacts.zip"
  # engine/android-arm
  "android-arm-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-arm/artifacts.zip"
  # engine/android-arm-profile
  "android-arm-profile-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-arm-profile/artifacts.zip"
  # engine/android-arm-release
  "android-arm-release-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-arm-release/artifacts.zip"
  # engine/android-arm64
  "android-arm64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-arm64/artifacts.zip"
  # engine/android-arm64-profile
  "android-arm64-profile-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-arm64-profile/artifacts.zip"
  # engine/android-arm64-release
  "android-arm64-release-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-arm64-release/artifacts.zip"

  # engine/android-x64-profile
  "android-x64-profile-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-x64-profile/artifacts.zip"
  # engine/android-x64-release
  "android-x64-release-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-x64-release/artifacts.zip"
  # engine/android-x86-jit-release
  "android-x64-jit-release-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-x86-jit-release/artifacts.zip"

  # flutter_web_sdk
  "flutter_web_sdk-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/flutter-web-sdk.zip"
  # pkg
  "sky_engine-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/sky_engine.zip"

  # engine/common
  "flutter_patched_sdk-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/flutter_patched_sdk.zip"
  # engine/common
  "flutter_patched_sdk_product-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/flutter_patched_sdk_product.zip"
)
source_x86_64=(
  # dart-sdk
  "dart-sdk-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/dart-sdk-linux-x64.zip"
  # engine/android-arm-profile/linux-x64
  "android-arm-profile-linux-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-arm-profile/linux-x64.zip"
  # engine/android-arm-release/linux-x64
  "android-arm-release-linux-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-arm-release/linux-x64.zip"
  # engine/android-arm64-profile/linux-x64
  "android-arm64-profile-linux-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-arm64-profile/linux-x64.zip"
  # engine/android-arm64-release/linux-x64
  "android-arm64-release-linux-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-arm64-release/linux-x64.zip"
  # engine/android-x64-profile/linux-x64
  "android-x64-profile-linux-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-x64-profile/linux-x64.zip"
  # engine/android-x64-release/linux-x64
  "android-x64-release-linux-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/android-x64-release/linux-x64.zip"

  # engine/linux-$ARCH
  "engine-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-x64/artifacts.zip"
  # engine/linux-$ARCH
  "gtk-debug-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-x64-debug/linux-x64-flutter-gtk.zip"
  # engine/linux-$ARCH-profile
  "gtk-profile-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-x64-profile/linux-x64-flutter-gtk.zip"
  # engine/linux-$ARCH-release
  "gtk-release-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-x64-release/linux-x64-flutter-gtk.zip"
  # engine/linux-$ARCH
  "font-subset-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-x64/font-subset.zip"
)
source_aarch64=(
  # dart-sdk
  "dart-sdk-arm64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/dart-sdk-linux-arm64.zip"
  # engine/linux-$ARCH
  "engine-arm64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-arm64/artifacts.zip"
  # engine/linux-$ARCH
  "gtk-debug-arm64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-arm64-debug/linux-arm64-flutter-gtk.zip"
  # engine/linux-$ARCH-profile
  "gtk-profile-arm64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-arm64-profile/linux-arm64-flutter-gtk.zip"
  # engine/linux-$ARCH-release
  "gtk-release-arm64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-arm64-release/linux-arm64-flutter-gtk.zip"
  # engine/linux-$ARCH
  "font-subset-arm64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-arm64/font-subset.zip"
)
noextract=(
  "material_fonts-${_materialfontsver}.zip"
  "gradle_wrapper-${_gradlewver}.tar.gz"

  "android-x86-${_enginever}.zip"
  "android-x64-${_enginever}.zip"
  "android-arm-${_enginever}.zip"
  "android-arm-profile-${_enginever}.zip"
  "android-arm-release-${_enginever}.zip"
  "android-arm64-${_enginever}.zip"
  "android-arm64-profile-${_enginever}.zip"
  "android-arm64-release-${_enginever}.zip"

  "android-x64-profile-${_enginever}.zip"
  "android-x64-release-${_enginever}.zip"
  "android-x64-jit-release-${_enginever}.zip"

  "flutter_web_sdk-${_enginever}.zip"
  "sky_engine-${_enginever}.zip"
  "flutter_patched_sdk-${_enginever}.zip"
  "flutter_patched_sdk_product-${_enginever}.zip"

  # x64
  "android-arm-profile-linux-x64-${_enginever}.zip"
  "android-arm-release-linux-x64-${_enginever}.zip"
  "android-arm64-profile-linux-x64-${_enginever}.zip"
  "android-arm64-release-linux-x64-${_enginever}.zip"
  "android-x64-profile-linux-x64-${_enginever}.zip"
  "android-x64-release-linux-x64-${_enginever}.zip"

  "engine-x64-${_enginever}.zip"
  "gtk-debug-x64-${_enginever}.zip"
  "gtk-profile-x64-${_enginever}.zip"
  "gtk-release-x64-${_enginever}.zip"
  "font-subset-x64-${_enginever}.zip"

  # arm64
  "engine-arm64-${_enginever}.zip"
  "gtk-debug-arm64-${_enginever}.zip"
  "gtk-profile-arm64-${_enginever}.zip"
  "gtk-release-arm64-${_enginever}.zip"
  "font-subset-arm64-${_enginever}.zip"

  # dart
  "dart-sdk-x64-${_enginever}.zip"
  "dart-sdk-arm64-${_enginever}.zip"
)



sha256sums=('e56fa8e9bb4589fde964be3de451f3e5b251e4a1eafb1dc98d94add034dd5a86'
            '31e9428baf1a2b2f485f1110c5899f852649b33d46a2e9b07f9d17752d50190a'
            '31e41e0ec4ed148ae533d7ab64ee1206f6781ed2f5c9ed83e9e4593f2d193636'
            '61131c93ebe18d43530e0f3a9fd6aa3917dd47060805e0843c51af4da56bd1db'
            'af5ffc0fb9043e88404ef13aa92caf8e8f040524d33a7d3fbc5334221784f041'
            'ea63959457dddd3af84d768c6fbb68160b009012be928ccce8a165f670ed809a'
            '03aa90bde979414e2de798c7c02e066550c99c297d5ec9d277684ea3a0ef7141'
            'ec5c1ce66c46234bc94c8eae865ee0421ae61d8e1be46a82ad938bb74fc37992'
            '28f78da5df4c3cdd66729db876b44f31f435a4357d82b2176e30c420d4fddb3d'
            '304301cf21610118eda885315ac8b30be544e11c395d9d0b6aa49cc7208e4cb4'
            'e7fd98d8d4d96bc5c147f28782b8b2ccecaef2d16c46ee9ab463cfee5ed23b8a'
            '6105481f32c56652cf4ac50c3be101fde59f39ec5f4545e04e7b2018c9ecef4b'
            'cc9194c8fe043fa53ce86e632ffed8034a46eac740362736915d584be376dd11'
            'c5e202485891809a4fdc28bc1fb909de9f3fcdf1cdfde39b374fc77bda521892'
            '1eff84422da22e7d98d48bc1848b6ec0ae373397268be0acf1eaff68e22c5103'
            '0f3a7133dacba605de159c01e4ddc0530907da3ef508bf7eef9194a4748c20ff'
            '6765e119af8d17e84a28c5fa203f1346f1352cc27c6a3d6740a9ef822406e6d5')
sha256sums_x86_64=('43db554b66866480a181adfbec3b65d78c47882bf366cd511f22737497fceabd'
                   'e951b13a4ef8bf6e7bf4c3a37ed3f52d373a7475227947346cedc5eb9ebb2794'
                   'f7380c1aefbecb937bbeeb0a1940c0ba4fa0ad2b9b924b3980f28cd20c0bad37'
                   'abba4649c68cb96308b5c0ccf435be7d3b3598e6f9b85230ebb64512e00ee04a'
                   '4d958c9f952c74ee3f763a3962cce320c63450a495e4a14e09539e64cd2e4c0e'
                   '5536e55a4d1ac0e8e4fa4e87d48690b036f4ca4ae195e5a64f996bbee9e3d1b0'
                   '01e31db7ecd1fadfc977631b07d8243c1ae067c4fee897014971a29b0b87f376'
                   '86a1be2665c211da763ac23f511baefd2db92a20ead9533fea6b1d5a066e7c50'
                   'a3d1c525dcfe0a1aab90994c11f9363f98dde69f1f2cc7090a71be52937b01eb'
                   '1e7de5125d530d57c953b1dc20e3efeb054fd8fe284ce0f092873af4b45ae75e'
                   '8e38fa614ed108098d5b5ba8b0004dfc2ce630aaec81138b7dfa2d63b7befb4b'
                   '4f4a86e4ca8a6ff5cc718dac777e30ef07877e291a4de00a8c3749dd1c8dfbc0')
sha256sums_aarch64=('d1ac7f14b9421be0b0cf0350b0d2c204482c9bc859288021bc35fcfad08b3699'
                    '190c134c301a6b6ea2f168ebc16491f1c3ce9cd7dcfa94b901aebadd84407cdd'
                    '7a22fa3f4b5e28da617178c818e82c0815a2eff009c581a6245150f095f89549'
                    '3f84d4038ed9fc3957e30683f0198385f1230bcda4db687242b5567693fa24ee'
                    '46f4103d9e00f829803289ebf44116d7baaf17501c286aeff35623ae62e46545'
                    '43a976da30911e1eb251c64036acd69ce78d24b424ceb65e0cc680bd7032d60e')

prepare() {
  unzip -o -q "${srcdir}/dart-sdk-${_flutterarch}-${_enginever}.zip" -d dart

  mkdir -p "${srcdir}/${_group}/bin/cache/artifacts"

  cd "${srcdir}/${_group}/bin/cache"

  unzip -o -q "${srcdir}/flutter_web_sdk-${_enginever}.zip" -d flutter_web_sdk
  unzip -o -q "${srcdir}/sky_engine-${_enginever}.zip" -d pkg

  cd "${srcdir}/${_group}/bin/cache/artifacts"

  mkdir -p "gradle_wrapper"
  tar -xzf "${srcdir}/gradle_wrapper-${_gradlewver}.tar.gz" -C "gradle_wrapper"
  unzip -o -q "${srcdir}/material_fonts-${_materialfontsver}.zip" -d "material_fonts"

  mkdir -p engine/android-arm-profile
  mkdir -p engine/android-arm64-profile
  mkdir -p engine/android-x64-profile
  mkdir -p engine/android-arm-release
  mkdir -p engine/android-arm64-release
  mkdir -p engine/android-x64-release

  if [ "$(uname -m)" == "x86_64" ]; then

  unzip -o -q "${srcdir}/android-arm-profile-linux-x64-${_enginever}.zip" -d engine/android-arm-profile/linux-x64
  unzip -o -q "${srcdir}/android-arm-release-linux-x64-${_enginever}.zip" -d engine/android-arm-release/linux-x64
  unzip -o -q "${srcdir}/android-arm64-profile-linux-x64-${_enginever}.zip" -d engine/android-arm64-profile/linux-x64
  unzip -o -q "${srcdir}/android-arm64-release-linux-x64-${_enginever}.zip" -d engine/android-arm64-release/linux-x64
  unzip -o -q "${srcdir}/android-x64-profile-linux-x64-${_enginever}.zip" -d engine/android-x64-profile/linux-x64
  unzip -o -q "${srcdir}/android-x64-release-linux-x64-${_enginever}.zip" -d engine/android-x64-release/linux-x64

  fi

  unzip -o -q "${srcdir}/android-x86-${_enginever}.zip" -d engine/android-x86
  unzip -o -q "${srcdir}/android-x64-${_enginever}.zip" -d engine/android-x64
  unzip -o -q "${srcdir}/android-arm-${_enginever}.zip" -d engine/android-arm
  unzip -o -q "${srcdir}/android-arm-profile-${_enginever}.zip" -d engine/android-arm-profile
  unzip -o -q "${srcdir}/android-arm-release-${_enginever}.zip" -d engine/android-arm-release
  unzip -o -q "${srcdir}/android-arm64-${_enginever}.zip" -d engine/android-arm64
  unzip -o -q "${srcdir}/android-arm64-profile-${_enginever}.zip" -d engine/android-arm64-profile
  unzip -o -q "${srcdir}/android-arm64-release-${_enginever}.zip" -d engine/android-arm64-release

  unzip -o -q "${srcdir}/android-x64-profile-${_enginever}.zip" -d engine/android-x64-profile
  unzip -o -q "${srcdir}/android-x64-release-${_enginever}.zip" -d engine/android-x64-release
  unzip -o -q "${srcdir}/android-x64-jit-release-${_enginever}.zip" -d engine/android-x86-jit-release

  unzip -o -q "${srcdir}/flutter_patched_sdk-${_enginever}.zip" -d engine/common
  unzip -o -q "${srcdir}/flutter_patched_sdk_product-${_enginever}.zip" -d engine/common

  unzip -o -q "${srcdir}/engine-${_flutterarch}-${_enginever}.zip" -d engine/linux-${_flutterarch}
  unzip -o -q "${srcdir}/gtk-debug-${_flutterarch}-${_enginever}.zip" -d engine/linux-${_flutterarch}
  unzip -o -q "${srcdir}/gtk-profile-${_flutterarch}-${_enginever}.zip" -d engine/linux-${_flutterarch}-profile
  unzip -o -q "${srcdir}/gtk-release-${_flutterarch}-${_enginever}.zip" -d engine/linux-${_flutterarch}-release
  unzip -o -q "${srcdir}/font-subset-${_flutterarch}-${_enginever}.zip" -d engine/linux-${_flutterarch}
}

build() {
    true
}

_package-engine-common-google-bin() {
  pkgdesc="${_pkgdesc} - common engine files"
  depends=(
	"${_group}-common=${pkgver}"
	"${_group}-sky-engine=${pkgver}"
	"${_group}-material-fonts=${pkgver}"
	"dart>=${_dartmin}"
	"dart<${_dartmax}"
  )
  provides=(
	"${_group}-engine-common=${pkgver}"
  )
  conflicts=(
	"${_group}-engine-common"
  )

  install -dm755 "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"

  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/common" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine/common"
}

_package-sky-engine-google-bin() {
  pkgdesc="${_pkgdesc} - sky-engine"
  provides=(
	"${_group}-sky-engine=${pkgver}"
  )
  conflicts=(
	"${_group}-sky-engine"
  )

  install -dm755 "${pkgdir}/usr/lib/${_group}/bin/cache"

  cp -ra "${srcdir}/${_group}/bin/cache/pkg" "${pkgdir}/usr/lib/${_group}/bin/cache/pkg"
}

_package-material-fonts-google-bin() {
  pkgdesc="${_pkgdesc} - material fonts"
  provides=(
	"${_group}-material-fonts=${pkgver}"
  )
  conflicts=(
	"${_group}-material-fonts"
  )

  install -dm755 "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts"

  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/material_fonts" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/material_fonts"
}

_package-engine-linux-google-bin() {
  pkgdesc="${_pkgdesc} - linux engine"
  depends=(
	"${_group}-engine-common=${pkgver}"
  )
  provides=(
	"${_group}-engine-linux=${pkgver}"
  )
  conflicts=(
	"${_group}-engine-linux"
	"${_group}-target-linux<${pkgver}"
	"${_group}-engine-android<${pkgver}"
	"${_group}-engine-web<${pkgver}"
  )

  install -dm755 "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"

  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/linux-${_flutterarch}" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"
  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/linux-${_flutterarch}-profile" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"
  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/linux-${_flutterarch}-release" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"
}

_package-engine-web-google-bin() {
  pkgdesc="${_pkgdesc} - web engine"
  depends=(
	"${_group}-engine-common=${pkgver}"
  )
  provides=(
	"${_group}-engine-web=${pkgver}"
  )
  conflicts=(
	"${_group}-engine-web"
	"${_group}-target-web<${pkgver}"
	"${_group}-engine-android<${pkgver}"
	"${_group}-engine-linux<${pkgver}"
  )

  install -dm755 "${pkgdir}/usr/lib/${_group}/bin/cache"

  cp -ra "${srcdir}/${_group}/bin/cache/flutter_web_sdk" "${pkgdir}/usr/lib/${_group}/bin/cache"
}

_package-gradle-google-bin() {
  pkgdesc="${_pkgdesc} - gradle wrapper"
  depends=(
	"${_group}-common=${pkgver}"
  )
  provides=(
	"${_group}-gradle=${pkgver}"
  )
  conflicts=(
	"${_group}-gradle"
	"${_group}-target-android<${pkgver}"
  )

  install -dm755 "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts"

  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/gradle_wrapper" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts"
}

_package-engine-android-google-bin() {
  pkgdesc="${_pkgdesc} - android engine"
  depends=(
	"${_group}-engine-common=${pkgver}"
  )
  provides=(
	"${_group}-engine-android=${pkgver}"
  )
  conflicts=(
	"${_group}-engine-android"
	"${_group}-target-android<${pkgver}"
	"${_group}-engine-linux<${pkgver}"
	"${_group}-engine-web<${pkgver}"
  )

  install -dm755 "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"

  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/android-arm" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"
  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/android-arm-release" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"
  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/android-arm-profile" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"

  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/android-arm64" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"
  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/android-arm64-release" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"
  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/android-arm64-profile" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"

  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/android-x64" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"
  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/android-x64-release" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"
  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/android-x64-profile" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"

  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/android-x86" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"
  cp -ra "${srcdir}/${_group}/bin/cache/artifacts/engine/android-x86-jit-release" "${pkgdir}/usr/lib/${_group}/bin/cache/artifacts/engine"
}

_package-dart-google-bin() {
  pkgdesc="${_pkgdesc} - Dart SDK"
  depends=(
	"glibc"
  )
  provides=(
	"dart=${_dartver}"
  )
  conflicts=(
	"dart"
  )

  install -dm755 "${pkgdir}/opt"
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/dart/LICENSE.dart_sdk_archive.md" "${pkgdir}/usr/share/licenses/dart/LICENSE"

  cp -ra "${srcdir}/dart/dart-sdk" "${pkgdir}/opt/dart-sdk"

  chmod -R ugo+rX "${pkgdir}/opt"

  ln -sf "/opt/dart-sdk/bin/dart" "${pkgdir}/usr/bin/dart"
  ln -sf "/opt/dart-sdk/bin/dartaotruntime" "${pkgdir}/usr/bin/dartaotruntime"
}

pkgname=("${_group}-engine-common-google-bin" "${_group}-engine-linux-google-bin" "${_group}-engine-web-google-bin" "${_group}-engine-android-google-bin" "${_group}-sky-engine-google-bin" "${_group}-material-fonts-google-bin" "${_group}-gradle-google-bin" "${_group}-dart-google-bin")

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$_group}")
    _package${_p#$_group}
  }"
done

