# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=caveman-bin
_pkgname=caveman
pkgver=4.1.0
# Companion binary release the CLI pins (BINARY_RELEASE in the npm tarball).
# Usually equals pkgver; when upstream diverges, prepare() fails: set it literally.
_binver=$pkgver
pkgrel=1
pkgdesc='Make AI coding agents talk like a caveman, plus local context compression and metering (CLI + runtime binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/JuliusBrussee/caveman'
license=('Apache-2.0' 'MIT' 'BSD-2-Clause' 'BSD-3-Clause' 'OFL-1.1 OR GPL-2.0-or-later WITH Font-exception-2.0')
depends=('nodejs>=22.13')
optdepends=('chromium: headless browsing for caveman-browse')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
noextract=("$_pkgname-$_binver-THIRD_PARTY_GO_LICENSES.tar.gz")

_rel="$url/releases/download/bin-v$_binver"
_bins=(caveman-proxy caveman-engine caveman-mcp cavemem caveman-browse caveman-shrink caveman-blocks)
_notices=(NOTICE.browse NOTICE.engine-pixel COPYRIGHT.musl LICENSE.zig SPLEEN_LICENSE.txt UNIFONT_LICENSE.txt)

source=("$_pkgname-$pkgver.tgz::https://registry.npmjs.org/@caveman-ai/cli/-/cli-$pkgver.tgz"
    "$_pkgname-$_binver-THIRD_PARTY_GO_LICENSES.tar.gz::$_rel/THIRD_PARTY_GO_LICENSES.tar.gz"
    "$_pkgname-$_binver-NOTICE.browse::$_rel/NOTICE.browse"
    "$_pkgname-$_binver-NOTICE.engine-pixel::$_rel/NOTICE.engine-pixel"
    "$_pkgname-$_binver-COPYRIGHT.musl::$_rel/COPYRIGHT.musl"
    "$_pkgname-$_binver-LICENSE.zig::$_rel/LICENSE.zig"
    "$_pkgname-$_binver-SPLEEN_LICENSE.txt::$_rel/SPLEEN_LICENSE.txt"
    "$_pkgname-$_binver-UNIFONT_LICENSE.txt::$_rel/UNIFONT_LICENSE.txt")
source_x86_64=("caveman-proxy-$_binver-x86_64::$_rel/caveman-proxy_linux_amd64"
    "caveman-engine-$_binver-x86_64::$_rel/caveman-engine_linux_amd64"
    "caveman-mcp-$_binver-x86_64::$_rel/caveman-mcp_linux_amd64"
    "cavemem-$_binver-x86_64::$_rel/cavemem_linux_amd64"
    "caveman-browse-$_binver-x86_64::$_rel/caveman-browse_linux_amd64"
    "caveman-shrink-$_binver-x86_64::$_rel/caveman-shrink_linux_amd64"
    "caveman-blocks-$_binver-x86_64::$_rel/caveman-blocks_linux_amd64")
source_aarch64=("caveman-proxy-$_binver-aarch64::$_rel/caveman-proxy_linux_arm64"
    "caveman-engine-$_binver-aarch64::$_rel/caveman-engine_linux_arm64"
    "caveman-mcp-$_binver-aarch64::$_rel/caveman-mcp_linux_arm64"
    "cavemem-$_binver-aarch64::$_rel/cavemem_linux_arm64"
    "caveman-browse-$_binver-aarch64::$_rel/caveman-browse_linux_arm64"
    "caveman-shrink-$_binver-aarch64::$_rel/caveman-shrink_linux_arm64"
    "caveman-blocks-$_binver-aarch64::$_rel/caveman-blocks_linux_arm64")
# Release binaries/notices: from upstream's signed checksums.txt (bin-v$_binver).
sha256sums=('2019c87fd765183071bf383d765833aed804e320054e81ac0f3becb9f05a2b8c'
    'c5daee04c83eddbc9fb8a7791ee9221397ec800b6bb414b4dc9f567b5feabb61'
    'ac8b226fb6e5d7ca20804794bf3da9c5bad3030191c312a89d6c55c0c14e104f'
    'bb4dec62bfc539d7f7edf66d4fac1edfb84eeb705733f8f63611e0aa87171378'
    'f9bc4423732350eb0b3f7ed7e91d530298476f8fec0c6c427a1c04ade22655af'
    '5c537d6853e005298a285d508cff9ac7192cea23576c840d485b2b586a7ff177'
    'f33fe8679d5b2abecc4f1313ce6c6bfa58262964de5f7bca146596a7318047af'
    '1e74cb82bf476843e97c2596297b04219b1a7e51f7238944a8c031cb9401fa87')
sha256sums_x86_64=('393b4e9b58f52eddcf77a24d32fd98aa0be011f8cff77498cf7ef55d9901195c'
    '91813a148c82308973b854e888f4997d52918af9feb01571b06acc946386f20f'
    '23334424cf813117c497d49e1410d4b02f033db0a5f12ff8859e9bb62317f3cf'
    'ef11cb6d070a2217853330df19a842a2a94cb712bc2ae1a2fb1137e292e2653b'
    'ef3f72384536a65589badd15ba3f8b2f901c4d48af99eac80c4d1c7569729dd9'
    '079dff3478fba2aa91a558942e5e4a2ab4e5bfe317b530095615008ce62b9b73'
    'edb917309d776e5b12aa009334049da1ca8ea4de33679490df284e6f7682a006')
sha256sums_aarch64=('92ef7d4d1a1481642cb404d9fd7fa927f105bdaa8af04d1ccbcb95ce68230f64'
    'd77fed78f840bee9e9d97788ac67af2f5a4c6e0aef73ac1101b206da359d49b9'
    'd619fd13ed0da1178a84471eb19377254259901220a4e31afc66e032c7f6b72d'
    '8dd08345a565d4ba6a65d55a34aab30b8564c5f5124edaa989eea8884b9a248f'
    '12b4afdfa66493bf385894f381c82811e334a2ed8af2b92f5f511fe1c1c2dfa5'
    '22a30101f71a81de2f2174ac71722480778cc8415bb47e6a25fc579065d4e2b2'
    '33b38b27e326fcee794c2dbba14883cd081e6e08c2dfd6ac9e0b491f7f4d292f')

prepare() {
    # The CLI downloads companions for exactly this tag; packaging any other
    # release would leave `caveman setup` reporting them as behind the pin.
    grep -q "BINARY_RELEASE = \"bin-v$_binver\"" package/dist/binaries.generated.js ||
        {
            error "CLI $pkgver does not pin bin-v$_binver; update _binver"
            return 1
        }
}

package() {
    # CLI: self-contained npm bundle (no runtime dependencies).
    local _lib="/usr/lib/node_modules/@caveman-ai/cli"
    install -d "$pkgdir$_lib" "$pkgdir/usr/bin"
    cp -r --no-preserve=ownership package/. "$pkgdir$_lib/"
    ln -s "$_lib/dist/index.js" "$pkgdir/usr/bin/$_pkgname"
    ln -s "$_lib/dist/index.js" "$pkgdir/usr/bin/cave"

    # Companions: on PATH, so the CLI uses them instead of downloading to ~/.caveman/bin.
    local _b
    for _b in "${_bins[@]}"; do
        install -Dm755 "$_b-$_binver-$CARCH" "$pkgdir/usr/bin/$_b"
    done

    local _lic="$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 -t "$_lic" package/LICENSE package/NOTICE
    local _n
    for _n in "${_notices[@]}"; do
        install -Dm644 "$_pkgname-$_binver-$_n" "$_lic/$_n"
    done
    install -d "$_lic/third-party-go"
    tar -xzf "$_pkgname-$_binver-THIRD_PARTY_GO_LICENSES.tar.gz" -C "$_lic/third-party-go" --no-same-owner
    find "$_lic/third-party-go" -type d -exec chmod 755 {} + -o -type f -exec chmod 644 {} +
    install -Dm644 package/README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
