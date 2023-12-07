# $Id$
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: Masato TOYOSHIMA <phoepsolonix at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: BrLi <brli at chakralinux dot org>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

## The UT dictionary's project page: http://linuxplayers.g1.xrea.com/mozc-ut.html

## Mozc compile option
_bldtype=Release
_mozc_commit=598a7f9c95973f661a537ac895c06c433879319f
_branch=fcitx
# Ut Dictionary
_utdicdate=20230115
_dict=(
#       place-names
#       alt-cannadic
#       edict2
#       jawiki
       neologd
#       personal-names
#       skk-jisyo
#       sudachidict
       )
_sudachidict_date=20230927

pkgbase=mozc-with-jp-dict
pkgname=("ibus-$pkgbase" "fcitx5-$pkgbase" "emacs-$pkgbase")
pkgver=2.29.5291.102
pkgrel=6
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
makedepends=('qt6-base' 'fcitx5' 'fcitx5-qt' 'bazel' 'git' 'python' 'python-six' 'pkg-config' 'curl' 'mesa' 'subversion' 'clang' 'ibus' 'ruby' 'ruby-parallel')
source=("git+$url.git#commit=${_mozc_commit}"
        git+https://github.com/phoepsilonix/mozcdict-ext.git
        #"https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip"
        #"https://www.post.japanpost.jp/zipcode/dl/jigyosyo/zip/jigyosyo.zip"
        #"https://osdn.net/projects/naist-jdic/downloads/53500/mecab-naist-jdic-0.6.3b-20111013.tar.gz"
        #"https://github.com/phoepsilonix/mecab-naist-jdic/raw/main/mecab-naist-jdic-0.6.3b-20111013.tar.gz"
        # https://github.com/WorksApplications/SudachiDict
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/small_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/core_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/notcore_lex.zip"
        "LICENSE-SudachiDict::https://github.com/WorksApplications/SudachiDict/raw/develop/LEGAL"
        "LICENSE-ipadic-neologd::https://github.com/neologd/mecab-ipadic-neologd/raw/master/COPYING"
        "0001-Zombie-Process-Prevention.patch"
        "dicts.txt"
        "revert.patch::https://github.com/fcitx/mozc/commit/c48b5691843182fd7f1207981be2ba21f9989a76.patch"
        "revert2.patch::https://github.com/fcitx/mozc/commit/4b0836af583b78e88f12f66da65754f064524a1b.patch"
        )
#        https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-all-titles-in-ns0.gz)
#noextract=(jawiki-latest-all-titles-in-ns0.gz)

for dict in "${_dict[@]}"; do
  source+=( "https://github.com/phoepsilonix/mozcdic-ut-${dict}/releases/download/latest/mozcdic-ut-${dict}.txt.tar.bz2")
  source+=( "LICENSE-${dict}::https://github.com/phoepsilonix/mozcdic-ut-${dict}/raw/main/LICENSE" )
done
sha512sums=('SKIP'
            'SKIP'
            '66ad5357b722ba4f54a3861c993cd047424ec210ba2931f38b90bc27758984ac29369baa511451b3e656196173fe0b049d3dfd1ade24a4dc389b86b9e0b9cd7e'
            '1edbceb3d08226d487d4baa199a5936f521c97363abdbc15592cfb50e7672f797fbb90ecf2b5ddbd0cbb54f482d073629fcf47afa298b9be6254649aad71cce9'
            '2d065fbfbfdf8294e053625a891043ca640aa39c8fc5959d7b6544c12a1ad321f19b8f5c8c6beb49b2d4e694a73f66ff32f7c6ec6989c9d73addcf461c49b6af'
            '1a5b62c83a08781b44bd73f978a4024d93667df47b1a3f4c179096cbc32f28e803c50dca6b5b7ad20fb788d46797551c36ec1efb7782f4361b695e2e0a6060ca'
            '77a8c1d76a53627f8680f761f9c996b04e6b609bdb813cb5aedc7f8214d9b5f13aea53788814029f6f1e263c50ecb58feb5999e95d51fe7e4707b6a913d4bbe4'
            '4dc9fc2d95e23729381bfe12fe6544ec3ea5729114e6d0539af93f5cd1e5a0a4d3196bfcf07c67aec0b19a25b92bf3c65c5e3805415bf81b5d13f537fa4f2c0d'
            'a4dbdd4a31f5985846b40291ddeed067453a3d89ac6de370cd049eef41f9340bcae4239fae98ea1e801a643bb371b0f5a6bcfbd985b2d1162efc1aed0540dbe6'
            '9a7fbec1974c8d2666951a9c423e9844292c2b82d5eeb5d8997399713caa182c0b9678885e3f17f72f63a2c4136a0263d0deb136c002e8d7d041c1d29c2163e4'
            '5f61c30c875a29464a0066737564ac8dfca207ab355b1431e33ef811dbc4fbc188ac285cda1273f413fa432a5e44cf4026a7fef46bc67355f3a0213b2c2d684e'
            '3b1354b8e6b25ea8024bb91098828855b558c0ee9086800b2d44ef6dac023949432418c47d943d59c6ce315c0d292ef784423cd6046dfb906d4afc4c14d11dd3'
            'ef2dd0a27b09ca3a68aa7a3ad45b3720d57efd0505e631fa643e7aea98455c1114760f9aa5e91701bb5c118ae3074719709eeed55010b305d861464ad1b51c3a')

pkgver() {
  cd "${srcdir}/mozc" || exit
  source <(grep = src/data/version/mozc_version_template.bzl| tr -d ' ')
  printf "%s.%s.%s.%s" "$MAJOR" "$MINOR" "$BUILD_OSS" "$((REVISION+2))"
}

prepare() {
  cd "$srcdir/mozc" || exit
  git submodule update --init --recursive

  cd src || exit

  # disable fcitx4 target
  #rm unix/fcitx/fcitx.gyp

  # disable emace gyp target
  #rm unix/emacs/emacs.gyp
  #rm gyp/tests.gyp

  # fix mozc icon for kimpanel
  #sed -i 's|PREFIX|/usr|' unix/fcitx5/mozc.conf

  # use libstdc++ instead of libc++
  sed '/stdlib=libc++/d;/-lc++/d' -i gyp/common.gypi

  # nm -f posix (llvm-nm -f posix)
  sed 's|nm \(.*\)\-f p |nm \1-f posix |' -i third_party/gyp/pylib/gyp/generator/ninja.py

  # zombie process prevention for mozc_tool
  cd "$srcdir/mozc" || exit
  patch -p1 -i ${srcdir}/0001-Zombie-Process-Prevention.patch

  # https://github.com/google/mozc/issues/849
  patch -R -p1 -i ${srcdir}/revert.patch
  patch -R -p1 -i ${srcdir}/revert2.patch

  # mozc date and version
  #_date=$(git log -1 --pretty=format:'%as' $_mozc_commit)
  #sed -i -e "/2.25.4150.102.1/d"  -e "s/2.26.4220.106.1/${pkgver}.${pkgrel}/" -e "s/2021-01-16/${_date}/" src/unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml.in
}

build() {
  cd "$srcdir/mozc/src" || exit

  # no need. zip code is included with bazel build.
  #echo 'Generating zip code seed...'
  #PYTHONPATH="$PWD:$PYTHONPATH" python dictionary/gen_zip_code_seed.py --zip_code="${srcdir}/KEN_ALL.CSV" --jigyosyo="${srcdir}/JIGYOSYO.CSV" >> data/dictionary_oss/dictionary09.txt
  #echo 'Done.'
  # UT Dictionary steps, rewrite of "sh make.sh"
  # UT辞書を結合
  msg '1. Append dictionaries'
  for dict in "${_dict[@]}"; do
    cat "$srcdir/mozcdic-ut-${dict}.txt" >> ${srcdir}/mozcdict-ext/mozcdic-ut.txt
  done

  # gem parallel
  [[ "$GEM_HOME"=="" ]] && GEM_HOME="/usr/lib/ruby/gems/3.0.0/"

  cd "${srcdir}/mozcdict-ext/" || exit
  # すだちを優先
  msg '2. Run the ruby scripts as in original sudachi.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  cd sudachi || exit
  ruby sudachi.rb -E -f ${srcdir}/small_lex.csv -f ${srcdir}/core_lex.csv -f ${srcdir}/notcore_lex.csv -i ${srcdir}/mozc/src/data/dictionary_oss/id.def > ../all-dict.txt
  cd ..

  # added dicts.txt
  cat ${srcdir}/dicts.txt >> all-dict.txt
  #cd neologd || exit
  #msg '3. Run the ruby scripts as in original neologd.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  #xz -k -d -c ${srcdir}/mecab-ipadit-neologd/upstream/seed/mecab-*.xz > user-dict-seed.csv
  #ruby neologd.rb -E -f user-dict-seed.csv >> ../all-dict.txt
  #cd ..

  # ut-dictionarys
  msg '3. Run the ruby scripts as in original utdict.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  ruby utdict/utdict.rb -E -f mozcdic-ut.txt -i ${srcdir}/mozc/src/data/dictionary_oss/id.def >> all-dict.txt

  msg '4. Run the ruby scripts as uniqword.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  ruby .dev.utils/uniqword.rb all-dict.txt > finish-dict.txt  2> duplicated.txt
  #cat ut-dict.txt >> finish-dict.txt

  msg '5. Finally add UT dictionary to mozc source'
  cat finish-dict.txt >> "$srcdir/mozc/src/data/dictionary_oss/dictionary00.txt"
  sync

  # Fix compatibility with google-glog 0.3.3 (symbol conflict)
  CFLAGS="${CFLAGS} -fvisibility=hidden"
  CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

  cd ${srcdir}/mozc/src || exit

  #export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
  #export QT_BASE_PATH=/usr/include/qt

  # fcitx5
#  GYP_DEFINES="use_fcitx=0 use_libibus=0" ../scripts/configure
#  TARGETS="gui/gui.gyp:mozc_tool unix/fcitx5/fcitx5.gyp:fcitx5-mozc"
#  python build_mozc.py build ${TARGETS} -c ${_bldtype}

  # ibus emacs_helper mozc_server fcitx5
  bazel build --config oss_linux --compilation_mode opt package unix/fcitx5:fcitx5-mozc.so --linkopt "$LDFLAGS" --copt -fPIC
  bazel shutdown

  # mozc fcitx5 version
  git fetch origin master:remotes/origin/master
  source bazel-bin/base/mozc_version.txt && export pkgver="$(printf "%s.%s.%s.%s" "${MAJOR}" "${MINOR}" "${BUILD_OSS}" "${REVISION}")" && sed -e "/2.26.4220.106.1/d" -e "/2.25.4150.102.1/d"  -e "s/release version=\".*\"/release version=\"$pkgver.1\" date=\"$(git log -1 --pretty=format:'%as' -b origin/master)\"/" -i unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml.in

  # Extract license part of mozc
  head -n 29 server/mozc_server.cc > LICENSE
  head -n 50 data/unicode/JIS0201.TXT > LICENSE.JIS0201
  head -n 73 data/unicode/JIS0208.TXT > LICENSE.JIS0208
  head -n 22 data/unicode/jisx0213-2004-std.txt > LICENSE.jisx0213-2004-std
}

install_mozc-with-jp-dict-common() {
  export PREFIX="$pkgdir/usr"
  export _bldtype
  cd mozc/src || exit

  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE LICENSE.* data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"
  install -D -m 644 data/dictionary_oss/README.txt "$pkgdir/usr/share/licenses/$pkgname/data/dictionary_oss/LICENSE"
  install -D -m 644 third_party/abseil-cpp/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/abseil-cpp/LICENSE"
  install -D -m 644 third_party/breakpad/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/breakpad/LICENSE"
  install -D -m 644 third_party/gtest/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/gtest/LICENSE"
  install -D -m 644 third_party/gyp/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/gyp/LICENSE"
  #install -D -m 644 third_party/ipa_font/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/ipa_font/LICENSE"
  install -D -m 644 third_party/japanese_usage_dictionary/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/japanese_usage_dictionary/LICENSE"
  install -D -m 644 third_party/protobuf/third_party/jsoncpp/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/jsoncpp/LICENSE"
  install -D -m 644 third_party/protobuf/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/prptobuf/LICENSE"
  install -D -m 644 third_party/wtl/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/wtl/LICENSE"
  for dict in "${_dict[@]}"; do
    install -D -m 644 "$srcdir/LICENSE-${dict}" "$pkgdir/usr/share/licenses/$pkgname/data/dictionary_oss/"
  done
  install -D -m 644 "$srcdir/LICENSE-SudachiDict" "$pkgdir/usr/share/licenses/$pkgname/data/dictionary_oss/"
  ../scripts/install_server_bazel
}

package_fcitx5-mozc-with-jp-dict() {
  pkgdesc="Fcitx5 module for Mozc with UT dictionary"
  depends=('fcitx5' 'fcitx5-qt' 'hicolor-icon-theme' gcc-libs glibc qt6-base)
  provides=('fcitx5-mozc')
  replaces=('fcitx5-mozc' "${pkgbase}-common")
  conflicts=('fcitx-mozc' 'fcitx5-mozc' "${pkgbase}-common" 'fcitx' 'fcitx-qt5' 'fcitx-qt6' 'ibus-mozc' 'ibus-mozc-with-jp-dict' 'fcitx-mozc-with-jp-dict')

  install_mozc-with-jp-dict-common
  export PREFIX="$pkgdir/usr"
  export _bldtype
  cd ${srcdir}/mozc/src || exit
  #../scripts/install_fcitx5
  ../scripts/install_fcitx5_bazel
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"
  install -D -m 755 bazel-bin/renderer/qt/mozc_renderer      "${pkgdir}/usr/lib/mozc/mozc_renderer"
}

package_ibus-mozc-with-jp-dict() {
  pkgdesc="IBus engine module for Mozc with UT dictionary"
  depends=('ibus>=1.4.1' "qt6-base" 'libibus')
  replaces=('ibus-mozc' "${pkgbase}-common")
  conflicts=('ibus-mozc' "$pkgbase-common" 'fcitx' 'fcitx-configtool' 'fcitx-qt5' 'fcitx-qt6' 'fcitx-mozc' 'fcitx5' 'fcitx5-configtool' 'fcitx5-qt' 'fcitx5-mozc' fcitx5-mozc-with-jp-dict fcitx-mozc-with-jp-dict)

  install_mozc-with-jp-dict-common
  export _bldtype
  cd "${srcdir}/mozc/src" || exit
  sed -i -e "s|0\.0\.0\.0|${pkgver}|g" bazel-bin/unix/ibus/mozc.xml
  install -D -m 755 bazel-bin/unix/ibus/ibus_mozc         "$pkgdir/usr/lib/ibus-mozc/ibus-engine-mozc"
  install -D -m 644 bazel-bin/unix/ibus/mozc.xml          "$pkgdir/usr/share/ibus/component/mozc.xml"
  install -D -m 755 bazel-bin/renderer/qt/mozc_renderer      "${pkgdir}/usr/lib/mozc/mozc_renderer"
  
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"

  cd bazel-bin/unix || exit
  unzip -o icons.zip -d tmp
  cd tmp || exit
  install -Dm644 mozc.png "${pkgdir}/usr/share/ibus-mozc/product_icon.png"
  find . -type f | xargs -I{} install -Dm644 "{}" "${pkgdir}/usr/share/ibus-mozc/{}"
}

package_emacs-mozc-with-jp-dict() {
  pkgdesc="Emacs engine module for Mozc with UT dictionary"
  depends=(gcc-libs "emacs")
  replaces=('emacs-mozc')
  conflicts=('emacs-mozc')

  export _bldtype
  cd "${srcdir}/mozc/src" || exit
  install -Dm755 bazel-bin/unix/emacs/mozc_emacs_helper "$pkgdir/usr/bin/mozc_emacs_helper"
  install -Dm644 unix/emacs/mozc.el                     "$pkgdir/usr/share/emacs/site-lisp/emacs-mozc/mozc.el"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"
}

