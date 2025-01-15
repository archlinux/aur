# Maintainer: The one with the braid <info@braid.business>

pkgbase=flutter-artifacts-google-bin
_group=flutter
groups=("$_group")
pkgver=3.27.2
# in order to update these version hashes, consult the PKGBUILD and update-artifact-versions.sh
# script of https://aur.archlinux.org/pkgbase/flutter
_enginever=e672b006cb34c921db85b8e2f482ed3144a4574b
_materialfontsver=3012db47f3130e62f7cc0beabff968a33cbec8d8
_gradlewver=fd5c1f2c013565a3bea56ada6df9d2b8e96d56aa
_flutterarch=$(echo "$CARCH" | sed s/aarch64/arm64/ | sed s/x86_64/x64/)
_dartver="3.6.1"
_dartmin="3.6.0"
_dartmax="3.7.0"
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
            '30931c4e98044c7e8ac404dfda91406cc3c93919f70da6a6aa04b532c2390817'
            '5991a6bc7006aa7baa918f3410f82c16ca9c6c55c02e45a3dd1c8e920b005a89'
            '2d26a1f5145c2d275fc4984055d82bce93addc279f959428b7eeeccf73ab6f11'
            '7f9fe4dfe5ff00712641ce7708f31501084a6b75e5ffba0bbfdb54a65681dea4'
            '1364d8e82124e39f27fba4c52d504aa9e5b22bbc92d5d7b6e6709813d0a56112'
            '5a693773a7b9fa9dfcd3456b126d7d47263db7918503e41de5343dc609976614'
            'ee4aa33a2783a064ec14d1fa3977bce239b3bf639995447d5e897ab2295d3b3c'
            '3e97204473cd84b1ba4fe2dd493684dba0f2d9dd6ace0e9211458b6e292255cd'
            '287599684b8be8b9a8d1287df0b414052288abbffe0b3d3a3e0c7ea0af03fc5f'
            '5c6f7d3f59ec338de00f040d4eaaf786139437f32bcdca543d7305783afba2a6'
            'e803b3734068ca3d1c2132368bb5e0fd54a249c9b1c9e5302d11344349b64ce2'
            '7d1439f6881bfc85cf17166426926f7943f7107ab218067e483e3cf8f600110e'
            'ea5f6f95780dc7114d66c3e60a4f8ef6f9835c40099d25be2e31e510df95ac5b'
            '03cfe6ca4876f606b49d8974bd6ff202f4221725efb65ecfb2df75e6e4c9cc12'
            'cd2cf6ef3a2ae77278aa2f115d772b8a4269520141cd886986c1f5c8646a8c88')
sha256sums_x86_64=('fd83783f4a8f809e38228374df254f30a462fdb565e446b82919e6592a2021e0'
                   'd633a4a1f828f02d1c8bce887461ee06df5f40df8911d153e138282291cd0f93'
                   '755fbffacd646a70801578fa1dd416b4b7e0a6c1c6eb3d437c2fe21671697b79'
                   'f187238db9b1a70c74fdd4e73dd9fd2940776091a88511b413cbb7ca2791f34b'
                   'f19c53779b68d9408bcdbe6f62e29eba9a6b026bb02eda3c5e9cb93f37bcb94b'
                   'ae1fcf8c109c849a415ea14d5267b120264d565c5dd901b90ec6fc659feb8dd6'
                   'd2343bb998c459df0bb1f48112f85b8b32f0f07e430859ef4d56b82aa55722c9'
                   '5856a4291a01f995a3c7b08df2fded44e21ee79977aaca2869131cf606e84bae'
                   '127fe3368287d9064316d140b88b4adbfbf1711e9e445b6e42532325b00b38cf'
                   '5def1eb226a9ba12e8eda5a95b842a5ee5f0afa488a9a55928b727f57fc091e0'
                   'b47f539fba6031496090999685de222500f465f082fa7eb74be02cb83396bbda'
                   '2abfb266feb76ec181f3fa70c956c67ca293ceb83b7542c1fe7598f6f7f1f575')
sha256sums_aarch64=('68fb8a337be397362b9fb37c237768ad88fa6c3cbc6847eae0b5c1c3111b073c'
                    '35f682143348b8a50375f28a57f7d64b7e354a31b0e80b5d1a8eef620e757b42'
                    '262ee4d554b2c8cfab6d8fe9e80df7dd7bd22ae913f1979acd34f40062f70780'
                    '0fdd55e624e0bee78b75d8a3633f2fd63c1c09407bd71df616482302f1280741'
                    'ed2e574274e123dc3432b79b8a6f95b6bc5a5eec7497b4f5d4dd568cbea00d7f'
                    'bde08c40712fd2bc58912712cf913e26a3ff49ed6f6428858895c1b43d26f3e4')

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

