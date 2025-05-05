# Maintainer: The one with the braid <info@braid.business>

pkgbase=flutter-artifacts-google-bin
_group=flutter
groups=("$_group")
pkgver=3.29.3
# in order to update these version hashes, consult the PKGBUILD and update-artifact-versions.sh
# script of https://aur.archlinux.org/pkgbase/flutter
_enginever=cf56914b326edb0ccb123ffdc60f00060bd513fa
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
            '220a2da46fef6bde1ed1959173d3c59190714f9257b9693ee4c9399f5d32d72c'
            'b8a5e9fe92fc6aafbe93037096d8c7ddc375ffe37bf27019290cbdeca482f85c'
            '5c342f10ab3fb98a4e7242273450c976eb8e9916407a91c674e886559d46aa0a'
            'e58a9052a92d254ced989f01288826b354c7938649ec69f57cecb89f320b9d77'
            '62c980432552e67bc834ecf0204ce3961374257ee5f51adf2ce6a2f9239c6d3a'
            '75c37977501b5992ac132b63d481f3ce8ef543ca0ac8c0637c636230cc011aab'
            '286c8252b7b6af5051d509e420466b76bb8b039eb329ce0338c20a095f2d30a9'
            '35c2a4a65ad6bb60397bedd7776ac309de7896b3b425c92a20397183069f9487'
            'fe3d3428bc6e98297461e2579655ecedc4c6b5e5bfce051a396a1bb9130e1224'
            '111cb7cd125f4207a7a79cab076c8b95c6c1242323802a039634574a6b5470c7'
            'e5f701b6ee7187bde8df850d80a97ce761cea72bb68b093628dcd51c281f3bce'
            '4769a6e5fd2a927e738a49c14fe5d5d0fc1aad1682b70a3d953743ea69362a28'
            'eeec7106dfee6e0560fb5e5dfe8fd43a75801baf72c77e29b06edfe12de5bc9c'
            '8c4d87dd10f59871545a2f93da82f1684f23f8f83c3bd31b2dcdc2d7adfa5ec4')
sha256sums_x86_64=('b6f142ed08e5f77db694e4113b9dd5878bd54c913bac54a949705fbc7c5ed19b'
                   '104c3fcd8d9e09e1d76282a9d253c24046b7590e3801ce844c717c6be6563be7'
                   '4e0509f53050babaf53394e662f994b807b67ec08a453aead88f4c749f833785'
                   '959c44aefd43c391c35834403ae18691de86e493ef80f1d20c07586b4d859fb2'
                   '4a51211d486bf1d4ccf329176ab940ddf6411226385153b0b895b9e0cee6bbc8'
                   '4a39d6b3f6a19130aaabc5dacd6c6bdca4fa604ad3d5dd7ea6e1c24ff01ebc63'
                   'fea2bf94ce27392b6bfae8427f285ccdb2994a13b2ae548497c42d09e7069529'
                   'b059255dce52c094e542d6873470f9b327bef71591acb9a78362ec348e508479'
                   '11267ac49475e0915f43c3d824175bf07035577ece0e9247b74acb17c09a9d50'
                   '5435d432c4da01ba530e3fb5c6743e52103dba95a0a461be9f85e00562db8613'
                   '82d1961fe12118ba64e4d906a2b85c21048d5f84d583b17bfbb6e5639b3836b3'
                   '7106efb1b9f5dee8569f1e2d64f1099d505ab9bbff961627d5eb61ca18601ddb')
sha256sums_aarch64=('98ddd4282f0208f2874134d27663afb93a24adadf0febe6761d29601b7b343ed'
                    '9a425dc2ee4a6a168c53e943b6a86015571a600642e01663619e1174c0a09873'
                    '79384b0e20aa9dec188c73429d933408e4bd0abe43f578c2fa6b5a524d2570e0'
                    '629430b95a9124763f0ed475f2726e70ebc2f7f8707903012ede014c26c75961'
                    'ff53acb192915ed3b957accba20e63bfe1f89da97789e77c92574c506948483f'
                    '9f9d4f622ac7d19b8ce73d7aadef971b1ae7b53a6f1545157eb3f82a206f6d9e')

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

