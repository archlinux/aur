# Maintainer: The one with the braid <info@braid.business>

pkgbase=flutter-artifacts-google-bin
_group=flutter
groups=("$_group")
pkgver=3.24.5
# in order to update these version hashes, consult the PKGBUILD and update-artifact-versions.sh
# script of https://aur.archlinux.org/pkgbase/flutter
_enginever=a18df97ca57a249df5d8d68cd0820600223ce262
_materialfontsver=3012db47f3130e62f7cc0beabff968a33cbec8d8
_gradlewver=fd5c1f2c013565a3bea56ada6df9d2b8e96d56aa
_flutterarch=$(echo "$CARCH" | sed s/aarch64/arm64/ | sed s/x86_64/x64/)
_dartver="3.5.4"
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
            'ca879e6a540303a8dbb7c7341fe1e096edd32a337c702deaffaa33b655f93a3c'
            '2533461bc54076baee74317778ffbe5c063b85d291903addc1a590f5a54b9941'
            'f65b69e38f803c45a61b6e2e6cea01ecd49ecf1a7e18c715d6f4ecd3aef7387a'
            '698a4a75c9a87afa82b317223786826c4d6b5da575fdb3f783ce77e02d000178'
            '73a3b6724148c756d3d2a2f4dfdc3be5423b78171439dd4a305f20989e8c225e'
            '7333c06ec2999600c2d9c0db5973e53efbb144302d46c03b3e966f43239d3bd0'
            '8887d79cb8b0e041332d5dfae3e34783a9219df0815aadec63c92398b186630e'
            'a9557b2424f8222cda02fc8c0beadd482e6b3d916e1b74a176cd0e77b61f1bd9'
            '22306b59981362aadd834b394dd0859052f8c99dcd11843318f2e91fb5bfa3f1'
            'd8525c213e8fdfa7e93c842a8bc3c57ff4b03981a3b0c15a2596bdb12073c8d8'
            '51423b61e9906a899d6a6035c46fe162d60e2313fc3a51c92264609fdd66ec44'
            '03b2aa7c0e47aecd60711576539beec0834588a932a915e1af370daa6cc85b97'
            '0ee0af6df98d7218c787c57087b36d57cb162d789c656b54a4c0f40a2fc4d4f1'
            '86cd82aa70babfcdd59a2dc6ac24e392b122738b10253eb23d7703ad1336b435'
            '01943767f2ce8efb6629be31b5cab449243110818e3a03ab182a090d98d6e2e9')
sha256sums_x86_64=('682b118e4cc6832d22cd17b3a1ca5edc7f5761f2c2c9519196068f0d2656d469'
                   '3ec52b86e29ea4784778e01b046758186e15d8b1387d7b1bd8c658fcd1a767fc'
                   'ade7f07f6c30523fffccc0479b5ea7b39ec125bddfcb36be353ba2a5725cb6dd'
                   'e1e650072b611ab7ec156c08acf76a87e5e21a3474d606170f55bbb70aa92607'
                   '08b91fd90a773dd0c3651eb2bdfbc05313628836aa4f14c909cc32112dd4573c'
                   '44aa321da55bd13b8c3bec2f46da805bd9be9d655220f82a42f859ab73b5d1c6'
                   '866d1173b0bb161e0599dd5aa3ed994aaeaca327e4597b51a7ce8d11d69365d4'
                   'bfb66f08fc4e542fe8d725d413a3239692304616b6f7455db291c91e7821e90b'
                   'eec4a5ebd0227e8dbd34af842b174ca1cbb7c05a5f40877ff25ac8f4f6e5389f'
                   '335accf5887b835eb21eb39573fb09b0ed785ddbba6a621f737aa1fd28b298b6'
                   '136e46d5f069e80f7fd27043b062ebe7d2aaf87ea3eb443b1f052e8d8324a4b1'
                   'db3850e0ef4c0b81293f249137bff256b70a99b7e02fa09d97f2594aa3eb3ea0')
sha256sums_aarch64=('635789cf5e0b2a1d33e0d4992ecfdf1c7a49884652cc13829698d45d3dc06406'
                    'b825ab524579ef7b2988a189976cf4833b31c646f5a999484ccc08bee15e120c'
                    '8be7029ebaba2dfda1ac7c6e5cf812cece4eb2fcbdbc87535608a157f4ba4dab'
                    'a32250ef45f95f9a26874ff41c2817e13a1fb11962a240f8108b2bf139d4ef9a'
                    'c4ec5d901763e3af796c318a8b8b4070769cc8d587e001b4d8e1dd88918d9031'
                    '6824c3bb0a33c3fd3fdeeed1c67aa672aba5a3d0481c29ff7207ffa6ddc9f169')

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

