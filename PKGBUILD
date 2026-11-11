# Maintainer: duanluan <duanluan@outlook.com>

pkgname=minimax-code-desktop
pkgver=3.1.14
pkgrel=1
# Electron version the upstream app is built against
_electron=42.11.10
# versions bundled by the upstream macOS build
_better_sqlite3_ver=12.11.1
_better_sqlite3_abi=146
pkgdesc='MiniMax Code desktop app repackaged from the official macOS release'
arch=('x86_64' 'aarch64')
url='https://code.minimax.cn/'
license=('LicenseRef-Proprietary')

depends_x86_64=(
  'electron42'
  'hicolor-icon-theme'
  'xdg-utils'
)
# Arch Linux ARM has no electron42 package, so the aarch64 build ships the
# official Electron runtime and depends on its shared libraries directly
depends_aarch64=(
  'hicolor-icon-theme'
  'xdg-utils'
  'gtk3'
  'nss'
  'alsa-lib'
  'libcups'
  'libdrm'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxi'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'libsecret'
  'libappindicator'
  'libpulse'
  'json-glib'
  'wayland'
  'systemd-libs'
  'dbus'
  'libnotify'
)
makedepends=(
  '7zip'
  'gcc'
  'make'
  'node-gyp'
  'nodejs'
  'python'
  'unzip'
)
options=('!strip' '!lto')

source=(
  'node-pty-1.1.0.tgz::https://registry.npmjs.org/node-pty/-/node-pty-1.1.0.tgz'
  'node-addon-api-7.1.1.tgz::https://registry.npmjs.org/node-addon-api/-/node-addon-api-7.1.1.tgz'
  "node-v${_electron}-headers.tar.gz::https://artifacts.electronjs.org/headers/dist/v${_electron}/node-v${_electron}-headers.tar.gz"
  'patch-asar.js'
  'sync-unpacked.js'
  'minimax-code-desktop.sh'
  'minimax-code-desktop.desktop'
  'minimax-code-desktop.png'
)
source_x86_64=(
  "MiniMax-Code-${pkgver}.dmg::https://filecdn.minimax.chat/public/minimax-agent-prod/release/MiniMax%20Code-${pkgver}.dmg"
  'ripgrep-linux-x64-1.18.0.tgz::https://registry.npmjs.org/@vscode/ripgrep-linux-x64/-/ripgrep-linux-x64-1.18.0.tgz'
  'clipboard-linux-x64-gnu-0.3.9.tgz::https://registry.npmjs.org/@mariozechner/clipboard-linux-x64-gnu/-/clipboard-linux-x64-gnu-0.3.9.tgz'
  'cua-driver-linux-x64-gnu-0.34.1.tgz::https://registry.npmjs.org/@trycua/cua-driver-linux-x64-gnu/-/cua-driver-linux-x64-gnu-0.34.1.tgz'
  'node-linux-x64-gnu-0.31.0-3.tgz::https://registry.npmjs.org/@ubjs/node-linux-x64-gnu/-/node-linux-x64-gnu-0.31.0-3.tgz'
  'node-screenshots-linux-x64-gnu-0.2.8.tgz::https://registry.npmjs.org/node-screenshots-linux-x64-gnu/-/node-screenshots-linux-x64-gnu-0.2.8.tgz'
  'keyring-linux-x64-gnu-2.1.1.tgz::https://registry.npmjs.org/@napi-rs/keyring-linux-x64-gnu/-/keyring-linux-x64-gnu-2.1.1.tgz'
  "better-sqlite3-v${_better_sqlite3_ver}-electron-v${_better_sqlite3_abi}-linux-x64.tar.gz::https://github.com/WiseLibs/better-sqlite3/releases/download/v${_better_sqlite3_ver}/better-sqlite3-v${_better_sqlite3_ver}-electron-v${_better_sqlite3_abi}-linux-x64.tar.gz"
)
source_aarch64=(
  "MiniMax-Code-${pkgver}-arm64.dmg::https://filecdn.minimax.chat/public/minimax-agent-prod/release/MiniMax%20Code-${pkgver}-arm64.dmg"
  'ripgrep-linux-arm64-1.18.0.tgz::https://registry.npmjs.org/@vscode/ripgrep-linux-arm64/-/ripgrep-linux-arm64-1.18.0.tgz'
  'clipboard-linux-arm64-gnu-0.3.9.tgz::https://registry.npmjs.org/@mariozechner/clipboard-linux-arm64-gnu/-/clipboard-linux-arm64-gnu-0.3.9.tgz'
  'cua-driver-linux-arm64-gnu-0.34.1.tgz::https://registry.npmjs.org/@trycua/cua-driver-linux-arm64-gnu/-/cua-driver-linux-arm64-gnu-0.34.1.tgz'
  'node-linux-arm64-gnu-0.31.0-3.tgz::https://registry.npmjs.org/@ubjs/node-linux-arm64-gnu/-/node-linux-arm64-gnu-0.31.0-3.tgz'
  'node-screenshots-linux-arm64-gnu-0.2.8.tgz::https://registry.npmjs.org/node-screenshots-linux-arm64-gnu/-/node-screenshots-linux-arm64-gnu-0.2.8.tgz'
  'keyring-linux-arm64-gnu-2.1.1.tgz::https://registry.npmjs.org/@napi-rs/keyring-linux-arm64-gnu/-/keyring-linux-arm64-gnu-2.1.1.tgz'
  "better-sqlite3-v${_better_sqlite3_ver}-electron-v${_better_sqlite3_abi}-linux-arm64.tar.gz::https://github.com/WiseLibs/better-sqlite3/releases/download/v${_better_sqlite3_ver}/better-sqlite3-v${_better_sqlite3_ver}-electron-v${_better_sqlite3_abi}-linux-arm64.tar.gz"
  "electron-v${_electron}-linux-arm64.zip::https://github.com/electron/electron/releases/download/v${_electron}/electron-v${_electron}-linux-arm64.zip"
)
noextract=(
  "MiniMax-Code-${pkgver}.dmg"
  "MiniMax-Code-${pkgver}-arm64.dmg"
  'ripgrep-linux-x64-1.18.0.tgz'
  'clipboard-linux-x64-gnu-0.3.9.tgz'
  'cua-driver-linux-x64-gnu-0.34.1.tgz'
  'node-linux-x64-gnu-0.31.0-3.tgz'
  'node-screenshots-linux-x64-gnu-0.2.8.tgz'
  'keyring-linux-x64-gnu-2.1.1.tgz'
  'ripgrep-linux-arm64-1.18.0.tgz'
  'clipboard-linux-arm64-gnu-0.3.9.tgz'
  'cua-driver-linux-arm64-gnu-0.34.1.tgz'
  'node-linux-arm64-gnu-0.31.0-3.tgz'
  'node-screenshots-linux-arm64-gnu-0.2.8.tgz'
  'keyring-linux-arm64-gnu-2.1.1.tgz'
  'node-pty-1.1.0.tgz'
  'node-addon-api-7.1.1.tgz'
  "better-sqlite3-v${_better_sqlite3_ver}-electron-v${_better_sqlite3_abi}-linux-x64.tar.gz"
  "better-sqlite3-v${_better_sqlite3_ver}-electron-v${_better_sqlite3_abi}-linux-arm64.tar.gz"
  "node-v${_electron}-headers.tar.gz"
  "electron-v${_electron}-linux-arm64.zip"
)
sha256sums=(
  'c7517f19083ddcb05f276904680eb2b11a6b5ecab778b8e4e5685a6d645b3f60'
  'b10455d15a977c0cd17a1cb0eb679e03d939f8ef8d4302eb33e1f78dacc71f82'
  '1395c3a7109e77da31eb40136ccc69858c01c3a5e40d4499892a3764120bd65f'
  '2d1a9453815e39dabff21ca060c6ccf3979b3e4fbf62d9e16078c726e890a2c8'
  'dca29eec3b3bbee5287783b43a9941b4245c67d489ce7c7a0fa32e20adaba6ec'
  '86aade1205a6f8ba6b3013c5a1f12fdaba90407d398b47eae3ab526f94735bff'
  '9dc2b21a8d9d2117535a6b3cee56bf679d0a2cda92e96f6958ce165fe16c09d8'
  '472c7a5452a02bd080209979742bec7313f846e9fb046b76458767a847581ff7'
)
sha256sums_x86_64=(
  'e95b5016c7884073c5b875217ab54093b41aaf8a174f93eccc817e0bb1afc9e9'
  '8cc06e25e29f9c258ee9a09eecd7707c1ea2e99d9e76151e53dbe39f8d6b4a09'
  '106b4f4a9218991056912937dfc6b7a2311d5ddf360c9692a765559656beb05e'
  '45a2df04cccab5567483d557a14c655cb8c4e31305de6159bf05fd070ddcea00'
  '08e05d837c6b3faefdd3e77ac3155c2654392a62d241961bcccc221f3783170a'
  '7d8c1a7c78fdf013bddd4e9dd20578467d63f18c2f81ba1819b11c5ce4c06f6f'
  'e6ed5aed06bd0a597310d4e2191abf2c3c0dd95ca8ba701e34203e243402aebc'
  'e2021aeed80de4f15212525e30565756aaae790e68e3229df6d1345f43803221'
)
sha256sums_aarch64=(
  '6c9a057d07c1d4fcd1c76127e7dbf92153de72620e4d54da5b45cb377625c2d0'
  '2d65504a71ea421d1c457177ebefcbe0d2d3a1f60f9709b6337f1d933553064b'
  '652eb7575ab534099a3698cb08722aa4b985b681c84e6e13dc8bcb57db94d42d'
  '2f39e1ef9b0d76d99b43162d8a060db7eebb9ac1162edca59219f36698ba2714'
  '31c4c8ecbd26484f660c03576fb1c0de7883f45b0018df4b76fd316845b96a52'
  '0fced3e456057ef33795417c3aee7af23201610b8320a23b2542846c3fc58ead'
  '99f301b012394036a7fb8c19ad664368d10fc5921488a31e5c724e442988ef9a'
  '2d0d01b9671523ab561a5edd0bfb009581c5eae4bb1af7d55a682faa623308f0'
  '74dfbe646ac85766e759c77bceda70015032a15d144b7f9418b3ca45869d339c'
)

pkg_extract() {
  local tgz=$1 dest=$2
  rm -rf "${dest}"
  install -dm755 "${dest}"
  tar -xzf "${tgz}" -C "${dest}" --strip-components=1
  chmod 755 "${dest}"
}

prepare() {
  cd "${srcdir}"

  rm -rf dmg stage node-pty-build node-headers bs3
  install -dm755 dmg

  local dmg_file app_arch
  case "${CARCH}" in
    x86_64)
      dmg_file="MiniMax-Code-${pkgver}.dmg"
      app_arch=x64
      ;;
    aarch64)
      dmg_file="MiniMax-Code-${pkgver}-arm64.dmg"
      app_arch=arm64
      ;;
    *)
      echo "Unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  7z x -bd -y "${dmg_file}" -odmg >/dev/null

  local asar_path res_dir
  asar_path="$(find dmg -path '*/Contents/Resources/app.asar' -print -quit)"
  [[ -n "${asar_path}" && -f "${asar_path}" ]] || {
    echo "Could not find app.asar in upstream dmg" >&2
    return 1
  }
  res_dir="$(dirname "${asar_path}")"

  install -dm755 stage
  cp "${res_dir}/app.asar" stage/app.asar
  cp -a "${res_dir}/app.asar.unpacked" stage/app.asar.unpacked
  cp -a "${res_dir}/resources" stage/resources

  # macOS 和 Windows 专用的资源
  rm -rf stage/resources/computer-use
  rm -f stage/resources/*.nsh stage/resources/dmg-background*.png \
    stage/resources/entitlements.mac.plist stage/resources/file-associations*
  find stage \( -name '*:com.apple.*' -o -name '.DS_Store' \) -delete

  # 把系统 electron 下的资源路径和打包状态改为上游预期的生产值，并关掉内置更新
  node "${srcdir}/patch-asar.js" stage/app.asar

  local nm="stage/app.asar.unpacked/node_modules"
  local keep_rid keep_cid keep_cud keep_nid keep_shots
  case "${CARCH}" in
    x86_64)
      keep_rid='ripgrep-linux-x64'
      keep_cid='clipboard-linux-x64-gnu'
      keep_cud='cua-driver-linux-x64-gnu'
      keep_nid='node-linux-x64-gnu'
      keep_shots='node-screenshots-linux-x64-gnu'
      ;;
    aarch64)
      keep_rid='ripgrep-linux-arm64'
      keep_cid='clipboard-linux-arm64-gnu'
      keep_cud='cua-driver-linux-arm64-gnu'
      keep_nid='node-linux-arm64-gnu'
      keep_shots='node-screenshots-linux-arm64-gnu'
      ;;
  esac

  # 上游只带 macOS 预编译，先删掉，再换成 Linux 版
  rm -rf "$nm/@vscode/ripgrep-darwin-${app_arch}" \
    "$nm/@mariozechner/clipboard-darwin-"* \
    "$nm/@trycua/cua-driver-darwin-${app_arch}" \
    "$nm/@ubjs/node-darwin-${app_arch}" \
    "$nm/node-screenshots-darwin-${app_arch}" \
    "$nm/@earendil-works/pi-tui/native" \
    "$nm/@napi-rs"

  pkg_extract "${srcdir}/${keep_rid}-1.18.0.tgz" "$nm/@vscode/${keep_rid}"
  pkg_extract "${srcdir}/${keep_cid}-0.3.9.tgz" "$nm/@mariozechner/${keep_cid}"
  pkg_extract "${srcdir}/${keep_cud}-0.34.1.tgz" "$nm/@trycua/${keep_cud}"
  pkg_extract "${srcdir}/${keep_nid}-0.31.0-3.tgz" "$nm/@ubjs/${keep_nid}"
  pkg_extract "${srcdir}/${keep_shots}-0.2.8.tgz" "$nm/${keep_shots}"
  pkg_extract "${srcdir}/keyring-linux-${app_arch}-gnu-2.1.1.tgz" \
    "$nm/@napi-rs/keyring-linux-${app_arch}-gnu"

  install -dm755 "${srcdir}/bs3"
  tar -xzf "${srcdir}/better-sqlite3-v${_better_sqlite3_ver}-electron-v${_better_sqlite3_abi}-linux-${app_arch}.tar.gz" -C "${srcdir}/bs3"
  install -Dm755 "${srcdir}/bs3/build/Release/better_sqlite3.node" \
    "$nm/better-sqlite3/build/Release/better_sqlite3.node"

  # node-pty 没有可用的 Linux 预编译，按 Electron 头文件从源码编译
  local pty="${srcdir}/node-pty-build" hdrs="${srcdir}/node-headers"
  pkg_extract "${srcdir}/node-pty-1.1.0.tgz" "$pty"
  pkg_extract "${srcdir}/node-addon-api-7.1.1.tgz" "$pty/node_modules/node-addon-api"
  install -dm755 "$hdrs"
  tar -xzf "${srcdir}/node-v${_electron}-headers.tar.gz" -C "$hdrs"
  (
    cd "$pty"
    node-gyp rebuild --nodedir="$hdrs/node_headers" --target_arch="${app_arch}" --release
  ) >"${srcdir}/node-pty-build.log" 2>&1 || {
    tail -n 40 "${srcdir}/node-pty-build.log" >&2
    return 1
  }
  rm -rf "$nm/node-pty/prebuilds"
  install -Dm755 "$pty/build/Release/pty.node" "$nm/node-pty/build/Release/pty.node"
  # 只保留运行需要的文件，源码和测试不打包
  rm -rf "$nm/node-pty/deps" "$nm/node-pty/src" "$nm/node-pty/scripts" \
    "$nm/node-pty/typings" "$nm/node-pty/binding.gyp"
  find "$nm/node-pty/lib" -name '*.test.js' -delete
  find "$nm" -type f -name '*.node' -exec chmod 755 {} +

  # 新增的 Linux 模块要写进 asar 头部，否则 Electron 找不到
  node "${srcdir}/sync-unpacked.js" stage/app.asar stage/app.asar.unpacked
}

package() {
  cd "${srcdir}"

  install -dm755 "$pkgdir/usr/lib/${pkgname}"
  cp -a stage/. "$pkgdir/usr/lib/${pkgname}/"

  find "$pkgdir/usr/lib/${pkgname}" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/lib/${pkgname}" -type f -perm /111 -exec chmod 755 {} +
  find "$pkgdir/usr/lib/${pkgname}" -type f ! -perm /111 -exec chmod 644 {} +
  find "$pkgdir/usr/lib/${pkgname}" -type f \( -name '*.node' -o -name 'rg' \) -exec chmod 755 {} +

  # aarch64 没有发行版提供的 electron42，用官方运行时
  if [[ "${CARCH}" == "aarch64" ]]; then
    install -dm755 "$pkgdir/usr/lib/electron42"
    unzip -q "${srcdir}/electron-v${_electron}-linux-arm64.zip" -d "$pkgdir/usr/lib/electron42"
    rm -f "$pkgdir/usr/lib/electron42/resources/default_app.asar"
    chmod 755 "$pkgdir/usr/lib/electron42/electron"
    chmod 4755 "$pkgdir/usr/lib/electron42/chrome-sandbox"
  fi

  install -Dm755 "${srcdir}/minimax-code-desktop.sh" \
    "$pkgdir/usr/bin/minimax-code-desktop"
  install -Dm644 "${srcdir}/minimax-code-desktop.desktop" \
    "$pkgdir/usr/share/applications/minimax-code-desktop.desktop"
  install -Dm644 "${srcdir}/minimax-code-desktop.png" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/minimax-code-desktop.png"
}
