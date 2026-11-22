# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=caveman-bin
_pkgname=caveman
pkgver=4.2.0
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
sha256sums=('010938f5f2b369360e248aabd62089e9a894a88d005ace29b24a82da9bbcc4cc'
            '7a4a6d86714171105fa5509030c2085494aea368d59a1a527c7f994b3f129a06'
            'ac8b226fb6e5d7ca20804794bf3da9c5bad3030191c312a89d6c55c0c14e104f'
            'bb4dec62bfc539d7f7edf66d4fac1edfb84eeb705733f8f63611e0aa87171378'
            'f9bc4423732350eb0b3f7ed7e91d530298476f8fec0c6c427a1c04ade22655af'
            '5c537d6853e005298a285d508cff9ac7192cea23576c840d485b2b586a7ff177'
            'f33fe8679d5b2abecc4f1313ce6c6bfa58262964de5f7bca146596a7318047af'
            '1e74cb82bf476843e97c2596297b04219b1a7e51f7238944a8c031cb9401fa87')
sha256sums_x86_64=('15674af7d23e53a2caa994dfe02108b8cde81f901035b450f713bb7c5c1a6d9f'
                   '8844668345b094ff46ee6037ab2e8453dfc97b979f3e9c3a9b520c509bdef860'
                   '2579992faa94f2c68f91a5b544ad99faa77d87b1ca87b3e6bc634caa21fb8d73'
                   '3c5eaf897fa01d35d54d56175cc1bebe817814571f6d3caeec796db10f37c607'
                   '42a7782779b33bf05eb0be8c9389c4d507f349ae6d6ed4b63b0eed8016723d20'
                   '84ab4f69a1a5a8a86af0d49eefda90e07ae8a425c16e11e88aafc01360dc9af5'
                   'edb917309d776e5b12aa009334049da1ca8ea4de33679490df284e6f7682a006')
sha256sums_aarch64=('3124ef687136fdac8f622b1862cdc553e60f423cb6db51ca2f2655086c491c15'
                    '2e1617562020863e8e77e0cbea85793d9d3827d74747526b1a076d6bfa1db849'
                    'ac16e252c31b91224173ea57992fc8fc4fa1e4ab5cacc66727f423a8c069dafe'
                    '677b9211fe93c92edb17a7efe3800cc6a47c720bb3ed77835a8e94a0d840e9a9'
                    'be87b21c3a4750da5b6c69006af4b66efa6ee12d17eca89abc22756abdbda25c'
                    '5795ca8dddbd35330b0bd66a75ba5692a22338d64841a719ce2bd5abd457d8c2'
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
