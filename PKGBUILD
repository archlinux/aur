# Maintainer: Pantelis Christou <pantelisworks@gmail.com>
pkgname=mlrift
pkgver=1.1.0
pkgrel=1
pkgdesc="Self-hosted systems language and compiler for machine-learning workloads"
arch=('x86_64' 'aarch64')
url="https://github.com/Heniokhos-Systems/MLRift"
license=('Apache-2.0')
depends=()
# Prebuilt binaries in MLRift's own fat-binary format: nothing to strip, and
# no separate debug package makes sense.
options=('!strip' '!debug')
provides=('mlrc' 'mlr')

# Immutable, versioned URLs so the checksums below stay valid across releases.
_base="https://github.com/Heniokhos-Systems/MLRift/releases/download/v${pkgver}"
_raw="https://raw.githubusercontent.com/Heniokhos-Systems/MLRift/v${pkgver}"

# std modules are arch-independent (same git tag), so both source arrays list
# them in the same order and share the same std hashes. This is a curated
# subset of std/ — the general-purpose modules, not the ML/GPU-specific ones
# (gguf, hip, qwen3, amdgpu, ...) — because each is fetched individually over
# raw.githubusercontent.com rather than as a directory. Widen this list by
# hand if a released program needs one of the excluded modules.
_std=(alloc string io math math_float fmt mem memfast vec map color fb fixedpoint font widget time log net sha256)

source_x86_64=(
    "mlrc::${_base}/mlrc-linux-x86_64"
    "mlr::${_base}/mlr-linux-x86_64"
    "alloc.mlr::${_raw}/std/alloc.mlr"
    "string.mlr::${_raw}/std/string.mlr"
    "io.mlr::${_raw}/std/io.mlr"
    "math.mlr::${_raw}/std/math.mlr"
    "math_float.mlr::${_raw}/std/math_float.mlr"
    "fmt.mlr::${_raw}/std/fmt.mlr"
    "mem.mlr::${_raw}/std/mem.mlr"
    "memfast.mlr::${_raw}/std/memfast.mlr"
    "vec.mlr::${_raw}/std/vec.mlr"
    "map.mlr::${_raw}/std/map.mlr"
    "color.mlr::${_raw}/std/color.mlr"
    "fb.mlr::${_raw}/std/fb.mlr"
    "fixedpoint.mlr::${_raw}/std/fixedpoint.mlr"
    "font.mlr::${_raw}/std/font.mlr"
    "widget.mlr::${_raw}/std/widget.mlr"
    "time.mlr::${_raw}/std/time.mlr"
    "log.mlr::${_raw}/std/log.mlr"
    "net.mlr::${_raw}/std/net.mlr"
    "sha256.mlr::${_raw}/std/sha256.mlr"
    "LICENSE::${_raw}/LICENSE"
)

source_aarch64=(
    "mlrc::${_base}/mlrc-linux-arm64"
    "mlr::${_base}/mlr-linux-arm64"
    "alloc.mlr::${_raw}/std/alloc.mlr"
    "string.mlr::${_raw}/std/string.mlr"
    "io.mlr::${_raw}/std/io.mlr"
    "math.mlr::${_raw}/std/math.mlr"
    "math_float.mlr::${_raw}/std/math_float.mlr"
    "fmt.mlr::${_raw}/std/fmt.mlr"
    "mem.mlr::${_raw}/std/mem.mlr"
    "memfast.mlr::${_raw}/std/memfast.mlr"
    "vec.mlr::${_raw}/std/vec.mlr"
    "map.mlr::${_raw}/std/map.mlr"
    "color.mlr::${_raw}/std/color.mlr"
    "fb.mlr::${_raw}/std/fb.mlr"
    "fixedpoint.mlr::${_raw}/std/fixedpoint.mlr"
    "font.mlr::${_raw}/std/font.mlr"
    "widget.mlr::${_raw}/std/widget.mlr"
    "time.mlr::${_raw}/std/time.mlr"
    "log.mlr::${_raw}/std/log.mlr"
    "net.mlr::${_raw}/std/net.mlr"
    "sha256.mlr::${_raw}/std/sha256.mlr"
    "LICENSE::${_raw}/LICENSE"
)

# These hashes are generated, not hand-written: scripts/update-packaging.sh
# (run automatically by .github/workflows/release.yml's update-packaging job)
# reads them out of the release's own published SHA256SUMS asset, so they are
# the hashes of the artifacts users actually download rather than of a local
# rebuild that merely ought to match. Do not edit them by hand — re-run the
# script, and regenerate .SRCINFO alongside.
sha256sums_x86_64=(
    '6a36aa4dc946b6b3ae23b363f5d8b6230b7742cdca18817aae2ee333683f0999'  # mlrc
    '7255594d41898e9cd4beaa01c26387e4aaedee284baf000fbd4f2fbaca75a3db'  # mlr
    '1399c7cf911138f4ac46ab593c4d9caf85e920fd31b7452620c82a66220db8e0'  # alloc
    '1d0802d48e534570fd92b30b4568c2fc4f4e933797b4131ce3c8329f678a2772'  # string
    'b28a2b6af75010cfeaaff86e27c3eadb3445a365eb6f87120746ba4f24b9f90b'  # io
    '8ead4a408c5887ca90f25d62138c076f247fcba317e5eedeb763bb68c4d551f2'  # math
    '7cbe6df852c0ed519e6c56a6708f701347cfb93c32e32e82f968b8e3b4abe7e7'  # math_float
    'ec35d7d2943122388b013dbe4a9d146962f6decee1e214ff3d550abee0b250c4'  # fmt
    '3fdbb63d4c8d7c473569159d7652b6cb8b7e411841015f7fa61a33f6b2618737'  # mem
    '8080f2ccd6fa48e928311c4dedbf41e1a9c9ba7e929f359363936f4e16a2ce56'  # memfast
    '7df742f8b4012aafc2b9c15a60e4da6422696cd66f3461666757bce02163c191'  # vec
    '76a2d8353ee5590a2ce1b86efb682ba2efa1ff36d41deda7335b58d3c1502bba'  # map
    '66cf6aba8db43d8e10ce149bdfb6e08b7b6c792679b00b2916ec236e8d02da32'  # color
    '87e39a5bed3d6aab865ad50232e43dd3079162f555d1f181dd20d7e12a544e6c'  # fb
    'db0c4ba19c589d35e3d58654606660f5b7198a4c7f5ca438e8f1a99014941cca'  # fixedpoint
    '0d454ec80d673e73f1fb125d9dddefc7a3561c9b3a1fb13b51b7dbfd2e12ed9e'  # font
    '43781ed32dc543f1f979bdd9085956ec14ec3544ec557ab293884e1ca1091545'  # widget
    'd82f5b9e4a5e32b7dacde39db70e1b0f6eac29de5a8ad1c5aaaf182549a8502a'  # time
    'e1d6a129ce6780634cab6c42ca26f9c19d7ac35d7cd8ba67c29e6c1b5e1637ea'  # log
    '6ee56ea089f93f602607a8bf31090dc9a495dafcf00993eca8d3da1e50422c5c'  # net
    '7b71db7bf4a3faea44382afb8f8637c79735a1c835d53cfa9e1fb7263928c5fc'  # sha256
    'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'  # LICENSE
)

sha256sums_aarch64=(
    'b862f3f1d729905044405de4cc5cc53af03891f7f8ee7d4f3da1079eaea3379b'  # mlrc
    '28fa5ed7c64178d8adde25780ab316c3514dd7b955659a94a0c7e1a547d0091e'  # mlr
    '1399c7cf911138f4ac46ab593c4d9caf85e920fd31b7452620c82a66220db8e0'  # alloc
    '1d0802d48e534570fd92b30b4568c2fc4f4e933797b4131ce3c8329f678a2772'  # string
    'b28a2b6af75010cfeaaff86e27c3eadb3445a365eb6f87120746ba4f24b9f90b'  # io
    '8ead4a408c5887ca90f25d62138c076f247fcba317e5eedeb763bb68c4d551f2'  # math
    '7cbe6df852c0ed519e6c56a6708f701347cfb93c32e32e82f968b8e3b4abe7e7'  # math_float
    'ec35d7d2943122388b013dbe4a9d146962f6decee1e214ff3d550abee0b250c4'  # fmt
    '3fdbb63d4c8d7c473569159d7652b6cb8b7e411841015f7fa61a33f6b2618737'  # mem
    '8080f2ccd6fa48e928311c4dedbf41e1a9c9ba7e929f359363936f4e16a2ce56'  # memfast
    '7df742f8b4012aafc2b9c15a60e4da6422696cd66f3461666757bce02163c191'  # vec
    '76a2d8353ee5590a2ce1b86efb682ba2efa1ff36d41deda7335b58d3c1502bba'  # map
    '66cf6aba8db43d8e10ce149bdfb6e08b7b6c792679b00b2916ec236e8d02da32'  # color
    '87e39a5bed3d6aab865ad50232e43dd3079162f555d1f181dd20d7e12a544e6c'  # fb
    'db0c4ba19c589d35e3d58654606660f5b7198a4c7f5ca438e8f1a99014941cca'  # fixedpoint
    '0d454ec80d673e73f1fb125d9dddefc7a3561c9b3a1fb13b51b7dbfd2e12ed9e'  # font
    '43781ed32dc543f1f979bdd9085956ec14ec3544ec557ab293884e1ca1091545'  # widget
    'd82f5b9e4a5e32b7dacde39db70e1b0f6eac29de5a8ad1c5aaaf182549a8502a'  # time
    'e1d6a129ce6780634cab6c42ca26f9c19d7ac35d7cd8ba67c29e6c1b5e1637ea'  # log
    '6ee56ea089f93f602607a8bf31090dc9a495dafcf00993eca8d3da1e50422c5c'  # net
    '7b71db7bf4a3faea44382afb8f8637c79735a1c835d53cfa9e1fb7263928c5fc'  # sha256
    'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'  # LICENSE
)

package() {
    install -Dm755 "$srcdir/mlrc" "$pkgdir/usr/bin/mlrc"
    install -Dm755 "$srcdir/mlr"  "$pkgdir/usr/bin/mlr"

    # Standard library, installed under the mlrift OS-prefix path for
    # consistency with install.sh (which targets $HOME/.local/share/mlrift/std).
    #
    # KNOWN BUG (src/main.mlr, import_init_search_paths(), ~line 499-513):
    # on Linux/macOS mlrc's stdlib search paths are still hardcoded to
    # /usr/local/share/kernrift/, /usr/share/kernrift/ and
    # $HOME/.local/share/kernrift/ -- leftover from the KernRift fork and
    # never renamed. There is no MLR_STDLIB env override and no exe-relative
    # fallback on Linux (only Windows has one). Until that is fixed upstream,
    # `import "std/..."` will NOT resolve for an mlrc installed by this
    # package (or by install.sh, which has the same mismatch). Not fixed
    # here because packaging must not patch src/.
    local stddir="$pkgdir/usr/share/mlrift/std"
    install -dm755 "$stddir"
    for mod in "${_std[@]}"; do
        install -Dm644 "$srcdir/${mod}.mlr" "$stddir/${mod}.mlr"
    done

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
