# $Id$
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: Masato TOYOSHIMA <phoepsolonix at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: BrLi <brli at chakralinux dot org>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

## Mozc compile option
_bldtype=Release
_mozc_commit=da085634c3f4c86d37bc4b8dd29c0071ccdf6d8d
_bcr_commit=cfea56c1da2f7130820cc4acc75f838529ab23f4
_dict_to_mozc_commit=fb9f38e297c73a52b807007225b7c01c2530b0c6
_branch=fcitx
# Sudachi Dictionary
_sudachidict_date=20250825

## follow the submodule commits in https://github.com/fcitx/mozc/tree/fcitx/src/third_party
_abseil_cpp_commit=987c57f3
_breakpad_commit=216cea7b
_gtest_commit=52eb8108
_gyp_commit=9ecf45e3
_japanese_usage_dictionary_commit=e5b3425
_protobuf_commit=4fbd1111a
_wil_commit=fc5dbf5

pkgbase=mozc-with-jp-dict
pkgname=("ibus-$pkgbase" "fcitx5-$pkgbase" "emacs-$pkgbase")
pkgver=2.32.5981.102
pkgrel=4
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT AND NAIST-2003 AND Unicode-3.0 AND LicenseRef-Okinawa-Dictionary')
makedepends=('qt6-base' 'fcitx5' 'fcitx5-qt' 'bazel' 'git' 'python' 'mold' 'pkg-config' 'libibus' 'rustup')
options=(!lto)
source=("git+$url.git#commit=${_mozc_commit}"
        "bcr::git+https://github.com/bazelbuild/bazel-central-registry.git#commit=${_bcr_commit}"
        "git+https://github.com/abseil/abseil-cpp.git#commit=${_abseil_cpp_commit}"
        "git+https://github.com/google/breakpad.git#commit=${_breakpad_commit}"
        "git+https://github.com/google/googletest.git#commit=${_gtest_commit}"
        "git+https://github.com/chromium/gyp.git#commit=${_gyp_commit}"
        "git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git#commit=${_japanese_usage_dictionary_commit}"
        "git+https://github.com/protocolbuffers/protobuf.git#commit=${_protobuf_commit}"
        "git+https://github.com/microsoft/wil.git#commit=${_wil_commit}"
        git+https://github.com/phoepsilonix/dict-to-mozc.git#commit=${_dict_to_mozc_commit}
        # https://github.com/WorksApplications/SudachiDict
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/small_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/core_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/notcore_lex.zip"
        "LICENSE-SudachiDict::https://github.com/WorksApplications/SudachiDict/raw/develop/LEGAL"
        # MeCab-unidic-Neologd https://github.com/neologd/mecab-unidic-neologd
        https://github.com/phoepsilonix/mecab-unidic-neologd/raw/refs/heads/master/seed/mecab-unidic-user-dict-seed.20200910.csv.xz
        LICENSE-MeCab-unidic-Neologd::https://github.com/phoepsilonix/mecab-unidic-neologd/raw/refs/heads/master/COPYING
        # MeCab-ipadic-Neologd https://github.com/neologd/mecab-ipadic-neologd
        https://github.com/phoepsilonix/mecab-ipadic-neologd/raw/refs/heads/master/seed/mecab-user-dict-seed.20200910.csv.xz
        LICENSE-MeCab-ipadic-Neologd::https://github.com/neologd/mecab-ipadic-neologd/raw/refs/heads/master/COPYING
        fcitx5-mozc-conf.patch
        )

sha512sums=('df7dfecb4e73477ec9b96b08c53f9ee17cdc24d6d5fc556d8cd57fbfad09d0a625d66929fcd71d372765c553f1c4c5559a5a25cea6c2730e306cb44dca1e5a38'
            '3873655019e4a283e47cd99df054fa944113412725716d403e4ebcb0a1e485c71d593fa5bb5d58d73579fb859446dc20775113e2f48aecae4ba5f3d676019c3f'
            'f471c70ee7ad3951bafd80540d07ba32622946095b1696c6bb44d8131944d88a4d75c1077a6a5ca2fe122ad284cf76303e3c3432e5f253558977997d42e5e05d'
            'f69046af8c37a2a8a441a258d5b8677016966cb43d8a3bb48badc78123a885d6179ff77d7885fd6c84130136a1b8931a98d35f9fcce3d03ed31a37a72ece0b9d'
            '48cd60ccec0f9a5f262c8f8865bcc794c023fc8a421a071c179922e5176ecbe83e554430de30c70efee2d47c0b3defec687ba89d66124d372798d0394fe3c767'
            'c8ce90c2493c05a78221befc4cbbcfcbe7a0bafb7bfa55403b085bf8c3fd069c4690d1ff59ef9e0e8a813bd3673588eb38e02ad81c42a6dd0be5246f27442169'
            '91b878735e767ddf6f1fe3de61486c1e78936a0f683855e7c34a21c711f405899d3de369d2ff0a1910d65b1afc8c225d8d8b9398cf98d760f3afcfe42644fca2'
            '0efcb80ec3a1f04f0f2e53ccd629eace4f6b9a2cbe5dae4c1b82140f11e174f8d023b8e35855def7e19c35da838c5b4fcfaa54748ee3534886caf1d35f55cccb'
            '504066a457f77b510f492626c919b6fd7b61f77948bdddef0f7e43ae09bb4bf03cea7000fba91ae0123a94d3b39cac6dfac2010126849afe0a183727fe7b0fc1'
            'd359ab1e82d68dc9d96a1a38bd58d5df7a5bc5084b04171f09d82fef086af542d65f14dc4775fb0ab4bd9f49034f2901928004b433cff53c6411c4986d17c447'
            '5d3cd8e5e1b913d7f527a7661cf2501d6eba9155505195e28513dc8d1cefe8010b82bceefbd4303b3a005780289020b47da5484bfd2255ba71b2a3a13751786f'
            '23a748814dd7773f8eadf5d31352f268fc922b57404fa238159146754f157e0b0be07b1986e362e2eba4e8aa43383ba23224083c32a0c4839f82ffa7bb17d04e'
            'b32e2889fe0bc29aab86a4d45df7d06082c1a430f90fd81df05a4d4dc446812827da5a3dd950078c2a43d1d1a10b500ed76bff51d1fa56165d1e6fb26894d4b8'
            '1a5b62c83a08781b44bd73f978a4024d93667df47b1a3f4c179096cbc32f28e803c50dca6b5b7ad20fb788d46797551c36ec1efb7782f4361b695e2e0a6060ca'
            '3bdbda066130043e2e6403a8196a13b78a35313fc8797769eb8f76033349f420c68ac50a3e0604836c2cb577179f3e123af64a4e45aa05d14575f46707383d28'
            '44b228264547c4628599b5888bd177dc3ddb845094a0acebcd3d7d7665e2cda8861f7210f80f0f40531f46581f565aab3489a6a2ff3aa75c058d552b23ea8d6e'
            '5f3aa91974d7ef5633a013effb7acf729cec7d096b4740ceb9915fe7df10e2e45d0d76ffc2d36f1e16d322e7b3974653601a79b6ada05371de8fc7e80af14644'
            '77a8c1d76a53627f8680f761f9c996b04e6b609bdb813cb5aedc7f8214d9b5f13aea53788814029f6f1e263c50ecb58feb5999e95d51fe7e4707b6a913d4bbe4'
            'd964584b7b2ffaa031d527bf4e8c53e2aadffc87c073b5d87841172ad8fc0ea7b341161bac84b3c0df2ab7df8dff4655087a45debb2ec3839f2743e253f115e3')


# Set default rustup toolchain
export RUSTUP_TOOLCHAIN=stable

pkgver() {
  cd "${srcdir}/mozc" || exit
  source <(grep = src/data/version/mozc_version_template.bzl| tr -d ' ')
  printf "%s.%s.%s.%s" "$MAJOR" "$MINOR" "$BUILD_OSS" "$((REVISION+2))"
}

prepare() {
  ## Set rust/cargo home to the build source dir
  #[ -z "$CARGO_HOME" ] && export CARGO_HOME="$srcdir/build/cargo-home"
  #[ -z "$RUSTUP_HOME" ] && export RUSTUP_HOME="$srcdir/build/rustup-home"

  cd "$srcdir/mozc" || exit

  git submodule init
  git config submodule.src/third_party/abseil-cpp.url "$srcdir/abseil-cpp"
  git config submodule.src/third_party/breakpad.url "$srcdir/breakpad"
  git config submodule.src/third_party/gtest.url "$srcdir/googletest"
  git config submodule.src/third_party/gyp.url "$srcdir/gyp"
  git config submodule.src/third_party/japanese_usage_dictionary.url "$srcdir/japanese-usage-dictionary"
  git config submodule.src/third_party/protobuf.url "$srcdir/protobuf"
  git config submodule.src/third_party/wil.url "$srcdir/wil"
  git -c protocol.file.allow=always submodule update

  cd "$srcdir/mozc/src" || exit
  patch -p2 -i ${srcdir}/fcitx5-mozc-conf.patch

  # use libstdc++ instead of libc++
  sed '/stdlib=libc++/d;/-lc++/d' -i gyp/common.gypi

  # nm -f posix (llvm-nm -f posix)
  sed 's|nm \(.*\)\-f p |nm \1-f posix |' -i third_party/gyp/pylib/gyp/generator/ninja.py

  # disable warning of ANDROID_NDK_HOME.
  sed -e '/register_toolchains("@androidndk\/\/:all")/d' -i MODULE.bazel

  rustup update stable
  cd "${srcdir}/dict-to-mozc/" || exit
  #sed -e "s|channel *=.*|channel = \"stable\"|" -i rust-toolchain.toml
  #sed -e "/components.*/d" -i rust-toolchain.toml
  # すだちを優先
  msg '1. Build the rust program(dict-to-mozc), it may take some time...'
  #rustup target list --installed | grep $(rustc -vV | sed -e 's|host: ||' -e 's|-gnu||p' -n) | grep -v musl && TARGET=$(rustup target list --installed | grep $(rustc -vV | sed -e 's|host: ||' -e 's|-gnu||p' -n)|grep -v musl|head -n1) || TARGET=$(rustup target list --installed | grep $(rustc -vV | sed -e 's|host: ||' -e 's|-gnu||p' -n)|grep musl|head -n1)
  TARGETS=$(rustc -vV | sed -n 's|^host: \([^-]*-[^-]*-[^-]*\)-gnu$|\1|p'); TARGETS=$(rustup target list --installed | grep "$TARGETS"); : "${TARGET:=$(echo "$TARGETS" | grep -v musl | head -n1)}" "${TARGET:=$(echo "$TARGETS" | grep musl | head -n1)}"
  : "${TARGET:=$(rustc -vV | sed -n 's/^host: //p')}"
  #[ -z "$TARGET" ] && TARGET=$(rustc -vV | sed -n 's/host: //p')
  echo $RUSTC
  unset RUSTC
  CC_=$CC
  CFLAGS_=$CFLAGS
  unset CC
  : "${CC:=$(command -v clang || command -v gcc)}"
  export CC
  unset CFLAGS
  expr "$CC" : ".*gcc" >/dev/null && : "${CFLAGS:=-std=c11 -Bmold -Wno-implicit-function-declaration -Wno-error=implicit-function-declaration}"
  echo $CC
  echo $CFLAGS
  export CFLAGS
  CC="$CC" CFLAGS="$CFLAGS" RUSTFLAGS="-Clink-arg=-Bmold" cargo build --release --target $TARGET -F use-mimalloc-rs || cargo build --release --target $TARGET
  export CC=$CC_
  export CFLAGS=$CFLAGS_
  msg '2. Convert SudachiDict to Mozc System Dictionary format. It may take some time...'
  #cat "${srcdir}"/mozc/src/data/dictionary_oss/dictionary*.txt > all-dict.txt
  cat ${srcdir}/small_lex.csv ${srcdir}/core_lex.csv ${srcdir}/notcore_lex.csv > all.csv
  cp ${srcdir}/mozc/src/data/dictionary_oss/id.def ./
  ./target/$TARGET/release/dict-to-mozc -s -i ./id.def -f all.csv > all-dict.txt
  msg '3. Convert MeCab-unidic-Neologd to Mozc System Dictionary format. It may take some time...'
  ./target/$TARGET/release/dict-to-mozc -n -i ./id.def -f ${srcdir}/mecab-unidic-user-dict-seed.20200910.csv >> all-dict.txt
  msg '4. Convert MeCab-ipadic-Neologd to Mozc System Dictionary format. It may take some time...'
  ./target/$TARGET/release/dict-to-mozc -n -P 12 -N 10 -i ./id.def -f ${srcdir}/mecab-user-dict-seed.20200910.csv >> all-dict.txt
  msg '5. Duplicate data will be removed.'

  # 読み、表記による重複チェック。件数を抑制するために、品詞IDを無視し、読みと表記のみで重複チェック。
  awk 'BEGIN{FS="\t";OFS="\t"}{if (!a[$1,$5]++) {print $0}}' all-dict.txt|sort > finish-dict-pre.txt
  # 「ろっ」「ろっき」からはじまる単語が多いと、「ろっき」の入力ができないエラー抑止のため一括削除
  sed -i "/^ろっき/d" finish-dict-pre.txt
  # Mozcソースのデータとの重複は品詞IDもチェック
  cat "${srcdir}"/mozc/src/data/dictionary_oss/dictionary*.txt finish-dict-pre.txt|sort>> finish-dict-pre-2.txt
  # 読み、品詞ID、右品詞ID、表記による重複チェック
  awk 'BEGIN{FS="\t";OFS="\t"}{if (!a[$1,$2,$3,$5]++) {print $0}}' finish-dict-pre-2.txt|sort > finish-dict.txt
  msg '6. Finally, add the SudachiDict, MeCab-unidic-Neologd and MeCab-ipadic-Neologd dictionary to the Mozc source.'
  mkdir -p tmp
  cd tmp
  ROWS=$(echo $(($(wc -l ../finish-dict.txt |cut -f1 -d" ")/10+1)))
  split -d -l $ROWS --additional-suffix=.txt ../finish-dict.txt dictionary
  cp -af ./dictionary*.txt "$srcdir/mozc/src/data/dictionary_oss/"
  #cat finish-dict.txt >> "$srcdir/mozc/src/data/dictionary_oss/dictionary00.txt"
  sync
}

build() {
  cd "$srcdir/mozc/src" || exit

  # Fix compatibility with google-glog 0.3.3 (symbol conflict)
  CFLAGS="${CFLAGS} -fvisibility=hidden"
  CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

  cd ${srcdir}/mozc/src || exit

  #export USE_BAZEL_VERSION=8.3.1
  LDFLAGS="${LDFLAGS} -fuse-ld=mold"

  # The bazel rules have changed, so the cache will be deleted.
  #bazel clean --expunge

  ../scripts/build_fcitx5_bazel \
      --config release_build \
      --registry="file://${srcdir}/bcr" \
      $(echo "${CFLAGS}"|xargs -n1 echo "--copt") \
      $(echo "${CXXFLAGS}"|xargs -n1 echo "--cxxopt") \
      $(echo "${LDFLAGS}"|xargs -n1 echo "--linkopt") \
      --copt="-Wno-uninitialized" \
      --host_copt="-Wno-uninitialized" --verbose_failures \
      package \
      #--nostart_end_lib \

  bazel shutdown
}

install_mozc-with-jp-dict-common() {
  cd ${srcdir}/mozc/src || exit
  export PREFIX="$pkgdir/usr"
  export _bldtype

  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  # Unicode-3.0
  [ -e data/unicode/JIS0201.TXT ] && head -n 50 data/unicode/JIS0201.TXT > LICENSE.JIS0201
  [ -e data/unicode/JIS0208.TXT ] && head -n 73 data/unicode/JIS0208.TXT > LICENSE.JIS0208
  #[ -e data/unicode/jisx0213-2004-std.txt ] && head -n 22 data/unicode/jisx0213-2004-std.txt > LICENSE.jisx0213-2004-std

  # BSD-3-Clause
  sed -n 1,29p unix/fcitx5/fcitx_key_translator.h > Fcitx5
  sed -i -e 's|^\/\/[ ]\?||g' Fcitx5
  install -Dm644 Fcitx5 "${pkgdir}"/usr/share/licenses/${pkgname}/Fcitx5
  # BSD-3-Clause
  sed -n 67,94p data/installer/credits_en.html > Mozc
  install -Dm644 Mozc "${pkgdir}"/usr/share/licenses/${pkgname}/Mozc
  # BSD-3-Clause
  sed -n 317,344p data/installer/credits_en.html > Breakpad
  install -Dm644 Breakpad "${pkgdir}"/usr/share/licenses/${pkgname}/Breakpad
  # NAIST-2003
  sed -n 355,424p data/installer/credits_en.html > IPAdic
  install -Dm644 IPAdic "${pkgdir}"/usr/share/licenses/${pkgname}/IPAdic
  # BSD-2-Clause
  sed -n 435,457p data/installer/credits_en.html > Japanese-Usage-Dictionary
  install -Dm644 Japanese-Usage-Dictionary "${pkgdir}"/usr/share/licenses/${pkgname}/Japanese-Usage-Dictionary
  # Public Domain Data
  sed -n 468,470p data/installer/credits_en.html > Okinawa-Dictionary
  install -Dm644 Okinawa-Dictionary "${pkgdir}"/usr/share/licenses/${pkgname}/Okinawa-Dictionary
  # BSD-3-Clause
  sed -n 481,513p data/installer/credits_en.html > Protocol-Buffers
  install -Dm644 Protocol-Buffers "${pkgdir}"/usr/share/licenses/${pkgname}/Protocol-Buffers
  # MIT
  sed -n 698,704p data/installer/credits_en.html > Tamachi-Phonetic-Kanji-Alphabet
  install -Dm644 Tamachi-Phonetic-Kanji-Alphabet "${pkgdir}"/usr/share/licenses/${pkgname}/Tamachi-Phonetic-Kanji-Alphabet
  # MIT
  sed -n 762,782p data/installer/credits_en.html > Windows-Implementation-Library
  sed -i -e 's|^[ \t]*||g' Windows-Implementation-Library
  install -Dm644 Windows-Implementation-Library "${pkgdir}"/usr/share/licenses/${pkgname}/Windows-Implementation-Library

  install -d "$pkgdir/usr/share/licenses/$pkgname/data/dictionary_oss/"
  install -D -m 644 "$srcdir/LICENSE-SudachiDict" "$pkgdir/usr/share/licenses/$pkgname/data/dictionary_oss/"
  install -D -m 644 "$srcdir/LICENSE-MeCab-unidic-Neologd" "$pkgdir/usr/share/licenses/$pkgname/data/dictionary_oss/"
  install -D -m 644 "$srcdir/LICENSE-MeCab-ipadic-Neologd" "$pkgdir/usr/share/licenses/$pkgname/data/dictionary_oss/"

}

package_fcitx5-mozc-with-jp-dict() {
  pkgdesc="Fcitx5 Module for Mozc(the Open Source Edition of Google Japanese Input) with SudachiDict and MeCab UniDic Neologd and MeCab IpaDic Neologd"

  depends=('fcitx5' 'fcitx5-qt' 'hicolor-icon-theme')
  optdepends=('fcitx5-configtool')
  provides=("fcitx5-mozc=${pkgver}")
  conflicts=('fcitx-mozc' 'fcitx5-mozc' 'fcitx' 'fcitx-qt5' 'fcitx-qt6' 'ibus-mozc')
  install=fcitx5-mozc.install

  export PREFIX="$pkgdir/usr"
  export _bldtype
  cd ${srcdir}/mozc/src || exit
  install_mozc-with-jp-dict-common
  ../scripts/install_server_bazel
  ../scripts/install_fcitx5_bazel
  install -D -m 644 unix/fcitx5/fcitx5/profile                  "$pkgdir/usr/share/fcitx5-mozc/fcitx5/profile"
  install -D -m 644 unix/fcitx5/fcitx5/conf/notifications.conf  "$pkgdir/usr/share/fcitx5-mozc/fcitx5/conf/notifications.conf"
  install -D -m 644 unix/fcitx5/fcitx5/conf/waylandim.conf      "$pkgdir/usr/share/fcitx5-mozc/fcitx5/conf/waylandim.conf"
  install -D -m 644 unix/fcitx5/fcitx5/conf/xim.conf            "$pkgdir/usr/share/fcitx5-mozc/fcitx5/conf/xim.conf"
  install -D -m 644 unix/fcitx5/fcitx5/conf/mozc.conf           "$pkgdir/usr/share/fcitx5-mozc/fcitx5/conf/mozc.conf"
  install -D -m 644 unix/fcitx5/fcitx5/conf/classicui.conf      "$pkgdir/usr/share/fcitx5-mozc/fcitx5/conf/classicui.conf"
}

package_ibus-mozc-with-jp-dict() {
  pkgdesc="Ibus engine module for Mozc(the Open Source Edition of Google Japanese Input) with SudachiDict and MeCab UniDic Neologd and MeCab IpaDic Neologd"
  depends=('ibus>=1.4.1' "qt6-base" 'libibus')
  provides=("ibus-mozc=${pkgver}")
  conflicts=('fcitx' 'fcitx-configtool' 'ibus-mozc' 'fcitx-qt5' 'fcitx-qt6' 'fcitx-mozc' 'fcitx5' 'fcitx5-configtool' 'fcitx5-qt' 'fcitx5-mozc')

  export _bldtype
  cd "${srcdir}/mozc/src" || exit
  install_mozc-with-jp-dict-common
  ../scripts/install_server_bazel
  sed -i -e "s|0\.0\.0\.0|${pkgver}|g" bazel-bin/unix/ibus/mozc.xml
  install -D -m 755 bazel-bin/unix/ibus/ibus_mozc         "$pkgdir/usr/lib/ibus-mozc/ibus-engine-mozc"
  install -D -m 644 bazel-bin/unix/ibus/mozc.xml          "$pkgdir/usr/share/ibus/component/mozc.xml"
  install -D -m 755 bazel-bin/renderer/qt/mozc_renderer      "${pkgdir}/usr/lib/mozc/mozc_renderer"

  cd bazel-bin/unix || exit
  unzip -o icons.zip *.png *.svg -d tmp
  cd tmp || exit
  install -Dm644 mozc.png "${pkgdir}/usr/share/ibus-mozc/product_icon.png"
  find . -type f -name "*.svg" | xargs -I{} install -Dm644 "{}" "${pkgdir}/usr/share/ibus-mozc/{}"
  find . -type f -name "*.png" | xargs -I{} install -Dm644 "{}" "${pkgdir}/usr/share/ibus-mozc/{}"
}

package_emacs-mozc-with-jp-dict() {
  pkgdesc="Emacs engine module for Mozc with SudachiDict and MeCab UniDic Neologd and MeCab IpaDic Neologd"
  license=('BSD-3-Clause')
  depends=("emacs" glibc gcc-libs)
  provides=("emacs-mozc=${pkgver}")
  conflicts=('emacs-mozc')

  export _bldtype
  cd "${srcdir}/mozc/src" || exit
  install_mozc-with-jp-dict-common
  install -Dm755 bazel-bin/unix/emacs/mozc_emacs_helper "$pkgdir/usr/bin/mozc_emacs_helper"
  install -Dm644 unix/emacs/mozc.el                     "$pkgdir/usr/share/emacs/site-lisp/emacs-mozc/mozc.el"
}

