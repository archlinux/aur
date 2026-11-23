# Maintainer: Markus Maiwald <markus@maiwald.tk>
pkgname=prism-harness-suite
pkgver=1.0.1
pkgrel=1
pkgdesc="PRISM harness suite for AI coding agents: doctrine rules, review steering, overnight loops, model routing and security gates on one Bun runtime"
arch=('x86_64')
url=https://getharness.app
license=('custom:LSL-1.0')
depends=('bun')
makedepends=('git' 'bun')
provides=('prism-harness' 'prism-mem' 'prism-loop' 'prism-proxy' 'prism-route' 'prism-sober')
conflicts=('prism-harness' 'prism-mem' 'prism-loop' 'prism-proxy' 'prism-route' 'prism-sober')

# Every component is a declared source and every runtime dependency a declared
# npm tarball verified against the sha512 its project lockfile records; nothing
# is cloned or resolved in build(). Components are pinned by the commit their
# signed release tag points to, so a moved tag cannot change the build.
# This AUR copy also pins prism-harness to the commit its v1.0.1 tag
# points to (the in-repo copy cannot contain its own commit).
_forge=https://git.sovereign-society.org/prism
_tag=v1.0.1
# loop: v1.0.3; proxy, route: v1.1.0; sober: v1.2.0-rc.7 (signed tags at these commits)
_components=(prism-harness prism-loop prism-sober prism-proxy prism-route)
source=("prism-harness::git+${_forge}/prism-harness.git#commit=9f110516a66952eee2a45d911c218425f5e7e772"
        "prism-loop::git+${_forge}/prism-loop.git#commit=f2ec45941abea0c4d9df6767a6a73098f61e5641"
        "prism-sober::git+${_forge}/prism-sober.git#commit=cde931ad34ff9475d860bc9a3ad0cb1a7849bdf0"
        "prism-proxy::git+${_forge}/prism-proxy.git#commit=294697acd9250352213f8e5c5c9042c7c63a74c8"
        "prism-route::git+${_forge}/prism-route.git#commit=4b462a240e08a87a413adf6fbc70d410a5220b76"
        "harness-noble-hashes-2.4.0.tgz::https://registry.npmjs.org/@noble/hashes/-/hashes-2.4.0.tgz"
        "route-chevrotain-cst-dts-gen-11.2.0.tgz::https://registry.npmjs.org/@chevrotain/cst-dts-gen/-/cst-dts-gen-11.2.0.tgz"
        "route-chevrotain-gast-11.2.0.tgz::https://registry.npmjs.org/@chevrotain/gast/-/gast-11.2.0.tgz"
        "route-chevrotain-regexp-to-ast-11.2.0.tgz::https://registry.npmjs.org/@chevrotain/regexp-to-ast/-/regexp-to-ast-11.2.0.tgz"
        "route-chevrotain-types-11.2.0.tgz::https://registry.npmjs.org/@chevrotain/types/-/types-11.2.0.tgz"
        "route-chevrotain-utils-11.2.0.tgz::https://registry.npmjs.org/@chevrotain/utils/-/utils-11.2.0.tgz"
        "route-chevrotain-11.2.0.tgz::https://registry.npmjs.org/chevrotain/-/chevrotain-11.2.0.tgz"
        "route-kdljs-0.3.0.tgz::https://registry.npmjs.org/kdljs/-/kdljs-0.3.0.tgz"
        "route-lodash-es-4.17.23.tgz::https://registry.npmjs.org/lodash-es/-/lodash-es-4.17.23.tgz"
        "loop-noble-hashes-2.4.0.tgz::https://registry.npmjs.org/@noble/hashes/-/hashes-2.4.0.tgz"
        "loop-ajv-8.17.1.tgz::https://registry.npmjs.org/ajv/-/ajv-8.17.1.tgz"
        "loop-fast-deep-equal-3.1.3.tgz::https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz"
        "loop-fast-uri-3.1.9.tgz::https://registry.npmjs.org/fast-uri/-/fast-uri-3.1.9.tgz"
        "loop-json-schema-traverse-1.0.0.tgz::https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz"
        "loop-require-from-string-2.0.2.tgz::https://registry.npmjs.org/require-from-string/-/require-from-string-2.0.2.tgz")
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            '5f95da5566480424fb1c76469b923b6505c3c0b1be6c65ee4ab310016fbb66f97cee1d6499cd5907555244972951fa14ac6429e05928c66e6467e32cf9a5be78'
            'b2c245be7fd45e14107880b0dd247f7d93e66158fe24cda63fe2f1edb679d5c39e1da31638aa7701432ec8cdd047cd9a1455d37dc029ebb3f91a93e31a66d959'
            '73e2a80fa792235c630196683545be574975dd4127f9ae1286652b8c82acd417845828e2d0ac219aa9f9152c752b806158bec840a955ef02d1e2bf252c0ace45'
            '946ef7a4116a6d73834db5e1759c2fd28c94688fb722b9beb8ebf9fd6efd948de0e616ac61a2675493a6dc7d8d92103411fe172c153849cafb4c90c9c2016403'
            'bc13128ff973fcbaa895b190107074b65a56e419e58c756da7e9338d07d053ee41b46313b9908f5606808ed2af4185e71dbffc8bfd362a28b4d32d2db2ec1fb3'
            'fbbc21102838c8d587a2db63bebd93a36051c4be172558c8cb2bf9278f9b27488c39553c8fff27d6a3c32d94bff745bf04e6c347c54d2f8ea515bcd8fc7a2c9b'
            '9870874f1339d670a4954c3d4734557340cb8c087f48050f33893fccc227953228db995d597399a0fb7b5c4224fcbc284f894556625cbbd839307b71dfbd71dc'
            'b4d6f9bd691ca2e40aa7c437089d01840e1385c9d6755718d19fb37abb4e7a533ccb01d539a6eedc565d0ca95d423f63fc266dd7b79be7e92aff51a0f460ed5e'
            '915238f2edcf66bdfc1dd633f7c5267cf9d79760d7ae975cb4bac52c277790ec75c5490e9a914fc7b80259633930f90bfdf0fccdbf8f8744338c616ce3e8475a'
            '5f95da5566480424fb1c76469b923b6505c3c0b1be6c65ee4ab310016fbb66f97cee1d6499cd5907555244972951fa14ac6429e05928c66e6467e32cf9a5be78'
            '07f801b8d8394a2313acf902f80dbe716d11b33c316269fa558c41fe29e5052b52e67c7ac4722dfde84a46120c86abac97b6bc2e34286678c2b39be1c31390d6'
            '7f7a90f68432f63d808417bf1fd542f75c0b98a042094fe00ce9ca340606e61b303bb04b2a3d3d1dce4760dcfd70623efb19690c22200da8ad56cd3701347ce1'
            '852ff45addd86b4e37a0a5ecd2c231acca4a4084d784c2c8ad500a2978b8828cc60bdbfb6115959d7219ce334f4ced3633d05dc4b096a8ad7245780dce257225'
            '34cf3f3fd9f75e35e12199f594b86415a0024ce5114178d6855e0103f4673aff31be0aadaa9017f483b89914314b1d51968e2dab37aa6f4b0e96bb9a3b2dddba'
            '5dfd2759ee91b1ece214cbbe029f5b8a251b9a996ae92f7fa7eef0ed85cffc904786b5030d48706bebc0372b9bbaa7d9593bde53ffc36151ac0c6ed128bfef13')
# component|package|tarball: the runtime closure of each component's bun.lock.
_vendored=("prism-harness|@noble/hashes|harness-noble-hashes-2.4.0.tgz"
           "prism-route|@chevrotain/cst-dts-gen|route-chevrotain-cst-dts-gen-11.2.0.tgz"
           "prism-route|@chevrotain/gast|route-chevrotain-gast-11.2.0.tgz"
           "prism-route|@chevrotain/regexp-to-ast|route-chevrotain-regexp-to-ast-11.2.0.tgz"
           "prism-route|@chevrotain/types|route-chevrotain-types-11.2.0.tgz"
           "prism-route|@chevrotain/utils|route-chevrotain-utils-11.2.0.tgz"
           "prism-route|chevrotain|route-chevrotain-11.2.0.tgz"
           "prism-route|kdljs|route-kdljs-0.3.0.tgz"
           "prism-route|lodash-es|route-lodash-es-4.17.23.tgz"
           "prism-loop|@noble/hashes|loop-noble-hashes-2.4.0.tgz"
           "prism-loop|ajv|loop-ajv-8.17.1.tgz"
           "prism-loop|fast-deep-equal|loop-fast-deep-equal-3.1.3.tgz"
           "prism-loop|fast-uri|loop-fast-uri-3.1.9.tgz"
           "prism-loop|json-schema-traverse|loop-json-schema-traverse-1.0.0.tgz"
           "prism-loop|require-from-string|loop-require-from-string-2.0.2.tgz")
noextract=()
for _v in "${_vendored[@]}"; do noextract+=("${_v##*|}"); done

prepare() {
  local v comp name file
  # An existing node_modules disables Bun's auto-install, so an import outside
  # the vendored closure fails the build instead of being fetched unverified.
  for comp in "${_components[@]}"; do
    mkdir -p "$srcdir/$comp/node_modules"
  done
  for v in "${_vendored[@]}"; do
    IFS='|' read -r comp name file <<<"$v"
    mkdir -p "$srcdir/$comp/node_modules/$name"
    bsdtar -xf "$srcdir/$file" -C "$srcdir/$comp/node_modules/$name" --strip-components 1 --no-same-owner
  done
}

build() {
  local comp
  for comp in "${_components[@]}"; do
    cd "$srcdir/$comp"
    # Dependencies were vendored in prepare(); components without a lockfile
    # have no runtime dependencies.
    bun run --no-install build
    [ -f "dist/$comp.js" ] || { echo "error: $comp built no dist/$comp.js" >&2; return 1; }
    # Install exactly the published package contents (package.json "files").
    bun pm pack --ignore-scripts --filename "$srcdir/$comp.tgz"
  done
}

package() {
  local comp spec name
  install -d "$pkgdir/usr/lib/prism" "$pkgdir/usr/bin"
  for comp in "${_components[@]}"; do
    install -d "$pkgdir/usr/lib/prism/$comp"
    bsdtar -xf "$srcdir/$comp.tgz" -C "$pkgdir/usr/lib/prism/$comp" --strip-components 1 --no-same-owner
  done

  # One wrapper per shipped binary; prism-harness also ships prism-mem.
  for spec in prism-harness:prism-harness prism-harness:prism-mem \
              prism-loop:prism-loop prism-sober:prism-sober \
              prism-proxy:prism-proxy prism-route:prism-route; do
    comp=${spec%%:*}
    name=${spec##*:}
    [ -f "$pkgdir/usr/lib/prism/$comp/dist/$name.js" ] || { echo "error: $comp ships no dist/$name.js" >&2; return 1; }
    printf '#!/bin/sh\nexec /usr/bin/bun "/usr/lib/prism/%s/dist/%s.js" "$@"\n' "$comp" "$name" > "$pkgdir/usr/bin/$name"
    chmod 755 "$pkgdir/usr/bin/$name"
  done

  cd "$srcdir/prism-harness"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 install.sh "$pkgdir/usr/share/doc/$pkgname/install.sh"
}
