# Maintainer: futpib <futpib@gmail.com>
# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=urbit-git
pkgver=4.3.r34.gb11c20baa6
pkgrel=1
pkgdesc="An Operating Function"
url="https://github.com/urbit/vere"
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=(zig git)
conflicts=('urbit')
provides=('urbit')
options=('!makeflags')
source=(
  'urbit-vere::git+https://github.com/urbit/vere.git'
  'natpmp.orig.tar.gz::https://debian.mirror.root.lu/debian/pool/main/libn/libnatpmp/libnatpmp_20230423.orig.tar.gz'
  'curl-8.9.1.tar.gz::https://github.com/curl/curl/releases/download/curl-8_9_1/curl-8.9.1.tar.gz'
  'gmp-6.3.0.tar.xz::https://ftp.fr.openbsd.org/pub/OpenBSD/distfiles/gmp-6.3.0.tar.xz'
  'h2o-3bbfe369.tar.gz::https://github.com/pkova/h2o/archive/3bbfe369a5c31d38cc1717e5281ca6af89ecf787.tar.gz'
  'sse2neon-v1.5.1.tar.gz::https://github.com/DLTcollab/sse2neon/archive/refs/tags/v1.5.1.tar.gz'
  'libuv-v1.50.0.tar.gz::https://dist.libuv.org/dist/v1.50.0/libuv-v1.50.0.tar.gz'
  'lmdb-40d3741b.tar.gz::https://github.com/LMDB/lmdb/archive/40d3741b7d40ba4c75cb91dd9987ce692d376d71.tar.gz'
  'openssl-1.1.1w.tar.gz::https://github.com/openssl/openssl/releases/download/OpenSSL_1_1_1w/openssl-1.1.1w.tar.gz'
  'libsigsegv-2.14.tar.gz::https://ftp.fr.openbsd.org/pub/OpenBSD/distfiles/libsigsegv-2.14.tar.gz'
  'libaes_siv-9681279c.tar.gz::https://github.com/dfoxfranke/libaes_siv/archive/9681279cfaa6e6399bb7ca3afbbc27fc2e19df4b.tar.gz'
  'secp256k1-v0.5.1.tar.gz::https://github.com/bitcoin-core/secp256k1/archive/refs/tags/v0.5.1.tar.gz'
  'urcrypt-465aad62.tar.gz::https://github.com/urbit/urcrypt/archive/465aad6262f2710f76f75adfe74effb5751c5ab3.tar.gz'
  'whereami-ba364cd5.tar.gz::https://github.com/gpakosz/whereami/archive/ba364cd54fd431c76c045393b6522b4bff547f50.tar.gz'
  'wasm3-be8cbea.tar.gz::https://github.com/urbit/wasm3/archive/be8cbeafa8b2301350484ecb494ed0288589d985.tar.gz'
  'tracy-v0.12.2.tar.gz::https://github.com/wolfpld/tracy/archive/v0.12.2.tar.gz'
  'zlib-61e7df7e.tar.gz::https://github.com/allyourcodebase/zlib/archive/61e7df7e996ec5a5f13a653db3c419adb340d6ef.tar.gz'
)
noextract=(
  'natpmp.orig.tar.gz'
  'curl-8.9.1.tar.gz'
  'gmp-6.3.0.tar.xz'
  'h2o-3bbfe369.tar.gz'
  'sse2neon-v1.5.1.tar.gz'
  'libuv-v1.50.0.tar.gz'
  'lmdb-40d3741b.tar.gz'
  'openssl-1.1.1w.tar.gz'
  'libsigsegv-2.14.tar.gz'
  'libaes_siv-9681279c.tar.gz'
  'secp256k1-v0.5.1.tar.gz'
  'urcrypt-465aad62.tar.gz'
  'whereami-ba364cd5.tar.gz'
  'wasm3-be8cbea.tar.gz'
  'tracy-v0.12.2.tar.gz'
  'zlib-61e7df7e.tar.gz'
)
sha256sums=(
  'SKIP'
  '0684ed2c8406437e7519a1bd20ea83780db871b3a3a5d752311ba3e889dbfc70'
  '291124a007ee5111997825940b3876b3048f7d31e73e9caa681b80fe48b2dcd5'
  'a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
  '87d8a3040c922f6736fa3ada578baf9848e6aa1bb47db473c07e3cda79525f96'
  '4001e2dfb14fcf3831211581ed83bcc83cf6a3a69f638dcbaa899044a351bb2a'
  '6dc2b39aa7fa66c04e2e015bf47738b84e1c6b86b8987d57dd432d149d77ee25'
  'b80ed032246adda023132bda5fca1f8629201bcc828355fb5007fcf59f598fb6'
  'cf3098950cb4d853ad95c0841f1f9c6d3dc102dccfcacd521d93925208b76ac8'
  'cdac3941803364cf81a908499beb79c200ead60b6b5b40cad124fd1e06caa295'
  '1916a428dff480e06b09dc0fb1c9d849c048f838dc9b8d141452233b508f6bb1'
  '081f4730becba2715a6b0fd198fedd9e649a6caaa6a7d6d3cf0f9fa7483f2cf1'
  'ea79851c79e36ec53833d7ee47f83a1125a3654ecf7f4d296fa172fd62666df4'
  '1d8744177f37e8386ec2f6c5992592399040cb93535ed4fd253e1976f889a744'
  '0c5c9da48dd72d1dd5e72231866f2fbb7f673d9d66fc7cc7df19b0776a61a30f'
  '09617765ba5ff1aa6da128d9ba3c608166c5ef05ac28e2bb77f791269d444952'
  '1fe3349e342a8bb3bbcf7c82a1dd4abdad8ef27a7e61be3ffbc0be5aca43a657'
)

pkgver() {
  cd urbit-vere
  git describe --long --tags --match='vere-v*' | sed 's/^vere-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  local zig_cache="${srcdir}/zig-global-cache"
  for f in \
    natpmp.orig.tar.gz \
    curl-8.9.1.tar.gz \
    gmp-6.3.0.tar.xz \
    h2o-3bbfe369.tar.gz \
    sse2neon-v1.5.1.tar.gz \
    libuv-v1.50.0.tar.gz \
    lmdb-40d3741b.tar.gz \
    openssl-1.1.1w.tar.gz \
    libsigsegv-2.14.tar.gz \
    libaes_siv-9681279c.tar.gz \
    secp256k1-v0.5.1.tar.gz \
    urcrypt-465aad62.tar.gz \
    whereami-ba364cd5.tar.gz \
    wasm3-be8cbea.tar.gz \
    tracy-v0.12.2.tar.gz \
    zlib-61e7df7e.tar.gz; do
    zig fetch --global-cache-dir "${zig_cache}" "${srcdir}/${f}"
  done
}

build() {
  cd urbit-vere
  ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-global-cache" zig build -Doptimize=ReleaseFast
}

package() {
  cd urbit-vere
  install -Dm755 "$(ls zig-out/*/urbit)" "$pkgdir/usr/bin/urbit"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
