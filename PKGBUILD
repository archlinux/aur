# Maintainer: The one with the braid <info@braid.business>

pkgbase=flutter-artifacts-google-bin
_group=flutter
groups=("$_group")
pkgver=3.29.2
# in order to update these version hashes, consult the PKGBUILD and update-artifact-versions.sh
# script of https://aur.archlinux.org/pkgbase/flutter
_enginever=18b71d647a292a980abb405ac7d16fe1f0b20434
_materialfontsver=3012db47f3130e62f7cc0beabff968a33cbec8d8
_gradlewver=fd5c1f2c013565a3bea56ada6df9d2b8e96d56aa
_flutterarch=$(echo "$CARCH" | sed s/aarch64/arm64/ | sed s/x86_64/x64/)
_dartver="3.7.2"
_dartmin="3.7.0"
_dartmax="3.8.0"
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
            '93eb20b5037aebe16938425121dab10a9f0080a8c411f97279b6ba8564d2b187'
            '9a0d597c341a0d1810129061ef4637e102548157a3f6775b6b4d3f14d5c95c42'
            '7386ed06ba614231e5b25d8d8b05afd005abf5d8dfe99d87e72d99ff668e3b6f'
            'be2de2d186aed6efea76f94f0883183b25a55da60cbe5e669d31a0a2386e0110'
            '3901f8b181f86d6f90db6084d7c715c095ea55801c3b4cd794757751079ca2f8'
            '5628097cc426a3af5b292e9f558313e321d5fcd603efa4acf355bbce68ad734b'
            'c695edb8d17de3854f694ee340c7cfc6679952e75eb229f8142bb458924b9bf3'
            '36b11712564816259f6d0cd479b50bd8fe0ce462f9c0d9645781d7e430c8e020'
            '6a233ca403ba461c40f51c3fc3d92384a6fb5046fd943b0a42082e7fb33c7827'
            'aa1958b66086ed9520520b840f01b452fe2fc3a122fa05d856569769ab71c100'
            'e655d2d490a6462f9a7c76f219dedc92537aff940e1d26e2535a6eee52fbb0be'
            'f27b7806f41202992c11df4830fd6aef8c63a5f892462bfc8c82532135e8e975'
            'cacf002daa1ce9d2edd27819b4cc8287587943202b5fa960ef416bfcbffcb2a7'
            '880cc6b39536203f218759ea1f63ebe8738d13ed2fad481b891840ba6cc43c6d')
sha256sums_x86_64=('2dfd375a03a0e9b5e40cddc2093d2f4d4a5e7559e73cfdd5afdb44954e3581a2'
                   '6e310678c2e13bf021afd67dac2911611ab885b185385acfcc00848442d3f886'
                   '615b9c8a59c8648bb077d395e61d45904ca375e206d392eccb95ff4e587b1417'
                   '506a244427636f4b6490bfd021fefdf8fe7ee886e757a6597f35db4d69a209cc'
                   '7ef8ff99e7e6b0bb348a7c64de8510b885662f9f3a06c5d13fa40766ddcb3f42'
                   '9e945191a6a8dae4ce0c2ca3284f85835b3a27ef409d4fbeb73a2a808161d5cf'
                   '3fc5bb19f86a68f687c9dfda795f74159c593317d80d5f565f51eb00265d7919'
                   '3c72dc85ac0dd23b2ba6a01db41ef03ba99a255fd756fdd67fe18441c08a7497'
                   '015e938e1791ede12e2985ca0a6b53c44f1603ade33294d882a2d7e9dfce424c'
                   'e3c2dedb898bddd11ccaa16001fd4a6fec194f4b99edf986925c0db9f49b82c5'
                   '2638be4e60b75ededb0de69676327ec568588e02bc677dde1145a70f2c05fe43'
                   '1cc0e0d40fa9d4d6b1769e7f9e94a0a9ce24caa76ab601fa77401af0ddb8104f')
sha256sums_aarch64=('802a9b6f4c4d6a91ef1e871341873b3e54d7dd6bc5ea183b17b3e9c636ac79c4'
                    '715605f443a302a172ab665f4c2b42622d61de7305c9ce13c831131fa6cf20df'
                    '60f6383896221b734ce8862a6667c95fbd518f9453d8e0d19eb7c8fb6c89121f'
                    '50f940d308b3abbd2f14c47479f7d72a6f6986ef1beb0f34a101e4753b99dd6f'
                    'ad01845dfacd6d69b6c85ba27dbfafccbba31a5da1112546f8fb93b816bdb17e'
                    'd8726dff254c3b186a13d9e48bdc3491a3905e35e67118dd94f2f297fbd23749')

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

