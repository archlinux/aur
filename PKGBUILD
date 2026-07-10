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
_mozc_commit=fa32b33d4cdd0443b05d9680f07fbd1a1ae21971
_bcr_commit=40a2fb008014165bad78d0dd1363c757c2dbd81e
_dict_to_mozc_commit=f6e4045f0f4eebd156c4397efef525aecf4657a6
_dict_to_mozc=v0.6.30

_branch=fcitx
# Sudachi Dictionary
_sudachidict_date=20260428

pkgbase=mozc-with-jp-dict
pkgname=("ibus-$pkgbase" "fcitx5-$pkgbase" "emacs-$pkgbase")
pkgver=3.34.6239.2
pkgrel=1
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT AND NAIST-2003 AND Unicode-3.0 AND LicenseRef-Okinawa-Dictionary')
makedepends=('qt6-base' 'fcitx5' 'fcitx5-qt' 'bazelisk' 'git' 'python' 'mold' 'pkg-config' 'libibus' 'rustup' 'unzip')
options=(!lto)
source=("git+$url.git#commit=${_mozc_commit}"
        "bcr::git+https://github.com/bazelbuild/bazel-central-registry.git#commit=${_bcr_commit}"
        git+https://github.com/phoepsilonix/dict-to-mozc.git#tag=${_dict_to_mozc}
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

sha512sums=('efa54487d199b54d76626e2352176851a625caf802ecd172d6d4d4791af5f1074c4069b9d380e8594a0b1c7cd0a9941880fd77e12f096837a39f0c1af29e7f8b'
            '2ae1ca46c1ef1276bcb7ad30f120ac9f9fb269cc54d6e5abe8774957f01fbf2b21ac8f0434851de29acf2542a09dbe9e0adba82637d2a24e0d4b0eb36a2cd0b3'
            'e913bb48b6358eea4ca67397de03d48b8db073a634d078df48a0c13be31a0d52fa73c8390712bf2af28f5c2af4a540282d817658356e5fa996e592044574c3b3'
            'bece72a09c37abd49d0f6963db656f2e4e1666059ec6d1082fb91126525e1b1c71438a7ee766d096bae7a7975bbe48371e57eb3b1ff03adbb872e72ac2edea90'
            'efce91101e7736485e0f842f92029ddb3e802deab2c2f5310f92e2b00ca4d2dade859fc726692c5e09410376eb02d9ce1392041ed18629404c2843c24230376c'
            'ef806b73acd6170f9a3f7d28c576b99ffed4866c1013918fdcc8792795e488242fad23c6dfb5a4cd3311c259b5d2eb9238e549fee8e0aab96ee266ab5812b08a'
            '1a5b62c83a08781b44bd73f978a4024d93667df47b1a3f4c179096cbc32f28e803c50dca6b5b7ad20fb788d46797551c36ec1efb7782f4361b695e2e0a6060ca'
            '3bdbda066130043e2e6403a8196a13b78a35313fc8797769eb8f76033349f420c68ac50a3e0604836c2cb577179f3e123af64a4e45aa05d14575f46707383d28'
            '44b228264547c4628599b5888bd177dc3ddb845094a0acebcd3d7d7665e2cda8861f7210f80f0f40531f46581f565aab3489a6a2ff3aa75c058d552b23ea8d6e'
            '5f3aa91974d7ef5633a013effb7acf729cec7d096b4740ceb9915fe7df10e2e45d0d76ffc2d36f1e16d322e7b3974653601a79b6ada05371de8fc7e80af14644'
            '77a8c1d76a53627f8680f761f9c996b04e6b609bdb813cb5aedc7f8214d9b5f13aea53788814029f6f1e263c50ecb58feb5999e95d51fe7e4707b6a913d4bbe4'
            'd964584b7b2ffaa031d527bf4e8c53e2aadffc87c073b5d87841172ad8fc0ea7b341161bac84b3c0df2ab7df8dff4655087a45debb2ec3839f2743e253f115e3')


# Set default rustup toolchain
export RUSTUP_TOOLCHAIN=stable

pkgver() {
  cd "${srcdir}/mozc/src" || exit
  # https://github.com/google/mozc/discussions/1429
  # REVISION in mozc_version_template.bzl is no longer used by Bazel builds.
  # REVISION will be probably removed once GYP builds are completely removed.
  bazel build --config oss_linux --config stable_channel --config release_build base:mozc_version_txt >/dev/null 2>&1
  source <(grep -E '^(MAJOR|MINOR|BUILD_OSS|REVISION)\s*=' bazel-bin/base/mozc_version.txt)
   _bzr_ver="$MAJOR.$MINOR.$BUILD_OSS.$REVISION"
  printf "%s" "${_bzr_ver}"
}

prepare() {
  ## Set rust/cargo home to the build source dir
  #[ -z "$CARGO_HOME" ] && export CARGO_HOME="$srcdir/build/cargo-home"
  #[ -z "$RUSTUP_HOME" ] && export RUSTUP_HOME="$srcdir/build/rustup-home"

  cd "$srcdir/mozc/src" || exit
  patch -p2 -i ${srcdir}/fcitx5-mozc-conf.patch

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
  unset RUSTC
  : "${CC:=$(command -v clang || command -v gcc)}"
  # warning of mimalloc-rust-sys@1.7.9-source
  expr "$CC" : ".*gcc" >/dev/null && : "${CFLAGS_:=-std=c11 -Bmold -Wno-implicit-function-declaration -Wno-error=implicit-function-declaration}"
  CC="$CC" CFLAGS="$CFLAGS $CFLAGS_" RUSTFLAGS="-Clink-arg=-Bmold" cargo build --release --target $TARGET -F use-snmalloc || \
    CC="$CC" CFLAGS="$CFLAGS $CFLAGS_" RUSTFLAGS="-Clink-arg=-Bmold" cargo build --release --target $TARGET -F use-auto-allocator || \
    CC="$CC" CFLAGS="$CFLAGS $CFLAGS_" RUSTFLAGS="-Clink-arg=-Bmold" cargo build --release --target $TARGET -F use-mimalloc || \
    CC="$CC" CFLAGS="$CFLAGS $CFLAGS_" RUSTFLAGS="-Clink-arg=-Bmold" cargo build --release --target $TARGET
  msg '2. Convert SudachiDict to Mozc System Dictionary format. It may take some time...'
  #cat "${srcdir}"/mozc/src/data/dictionary_oss/dictionary*.txt > all-dict.txt
  cat ${srcdir}/small_lex.csv ${srcdir}/core_lex.csv ${srcdir}/notcore_lex.csv > all.csv
  cp ${srcdir}/mozc/src/data/dictionary_oss/id.def ./
  ./target/$TARGET/release/dict-to-mozc -D 1 -s -i ./id.def -f all.csv > all-dict.txt
  msg '3. Convert MeCab-unidic-Neologd to Mozc System Dictionary format. It may take some time...'
  ./target/$TARGET/release/dict-to-mozc -D 1 -n -i ./id.def -f ${srcdir}/mecab-unidic-user-dict-seed.20200910.csv >> all-dict.txt
  msg '4. Convert MeCab-ipadic-Neologd to Mozc System Dictionary format. It may take some time...'
  ./target/$TARGET/release/dict-to-mozc -D 1 -n -P 12 -N 10 -i ./id.def -f ${srcdir}/mecab-user-dict-seed.20200910.csv >> all-dict.txt
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

  LDFLAGS="${LDFLAGS} -fuse-ld=mold"

  # The bazel rules have changed, so the cache will be deleted.
  #bazel clean --expunge

  ../scripts/build_fcitx5_bazel \
      --config release_build \
      --config stable_channel \
      --registry="file://${srcdir}/bcr" \
      $(echo "${CFLAGS}"|xargs -n1 echo "--copt"|grep -v _FORTIFY_SOURCE) \
      $(echo "${CXXFLAGS}"|xargs -n1 echo "--cxxopt"|grep -v _FORTIFY_SOURCE) \
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

