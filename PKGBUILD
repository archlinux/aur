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
_mozc_commit=e9c2d29e9de14a21348fd8ee88555004ac04c520

# Ut Dictionary
_utdicdate=20230115
_dict=(place-names
       alt-cannadic
       edict2
       jawiki
       neologd
       personal-names
       skk-jisyo
#       sudachidict
       )
_sudachidict_date=20230711

pkgbase=mozc-with-jp-dict
pkgname=("$pkgbase-common" "ibus-$pkgbase" "fcitx5-$pkgbase" "emacs-$pkgbase")
pkgver=2.29.5210.102
pkgrel=1
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
makedepends=('qt6-base' 'fcitx5' 'bazel' 'git' 'python' 'python-six' 'pkg-config' 'curl' 'gtk2' 'mesa' 'subversion' 'clang' 'ibus' 'ruby' 'ruby-parallel')
source=(git+https://github.com/fcitx/mozc.git#commit="${_mozc_commit}"
        git+https://github.com/phoepsilonix/mozcdict-ext.git
        "https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip"
        "https://www.post.japanpost.jp/zipcode/dl/jigyosyo/zip/jigyosyo.zip"
        #"https://osdn.net/projects/naist-jdic/downloads/53500/mecab-naist-jdic-0.6.3b-20111013.tar.gz"
        #"https://github.com/phoepsilonix/mecab-naist-jdic/raw/main/mecab-naist-jdic-0.6.3b-20111013.tar.gz"
        # https://github.com/WorksApplications/SudachiDict
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/small_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/core_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/notcore_lex.zip"
        "LICENSE-SudachiDict::https://github.com/WorksApplications/SudachiDict/raw/develop/LEGAL"
        )
#        https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-all-titles-in-ns0.gz)
#noextract=(jawiki-latest-all-titles-in-ns0.gz)

for dict in "${_dict[@]}"; do
  source+=( "https://github.com/phoepsilonix/mozcdic-ut-${dict}/raw/main/mozcdic-ut-${dict}.txt.tar.bz2" )
  source+=( "LICENSE-${dict}::https://github.com/phoepsilonix/mozcdic-ut-${dict}/raw/main/LICENSE" )
done
sha512sums=('SKIP'
            'SKIP'
            'fa7f9e210d8afaf11b0ea72e1d05b3649b299a1342903b595928f2bb373c7d3f078f002487669b004d4b3105e7ad9b13099ca10d18ef3a5f7d837cf2e9a94a4f'
            'b1fc978c332957cbd4be873809d8c7c08d48922a05f60d90893e534d5626f357069300c163010346ef7e93aecd8a206b272b33a12ac76fe94d4c201acf491b0d'
            'e55cbac056c14f9c3e62e250860b5372d5d78deebf29da2024187f517b544085a0bb454ebc5bfce19a43385d350932867f8b084c433aa0224e01e2c02efd5a08'
            'd27e65cd76f0047875e11eb7c2e270ce8c27ccd4b66b4546c684a74f22fdbaf76aa26033dacdb0547dde4f292dd618c8d5377e4185ab3548b5d7609383d86f96'
            '63fc0c2508ada87949a7f77e7974dbdd0c371d8b64ac9002be872b0524d5f866448ee22304bbc1980e7ae207903933f6e047ca5a7d409992cb9fbc77ba9e1a3c'
            '1a5b62c83a08781b44bd73f978a4024d93667df47b1a3f4c179096cbc32f28e803c50dca6b5b7ad20fb788d46797551c36ec1efb7782f4361b695e2e0a6060ca'
            '5dec163031319fac17f04ab869b1ce085cb4583561462bc35b398b32bbfca8249e61300d6c0e1ae262668852aafea05801ee9c88b47a8e35dd2946f253326128'
            'd3a93d7c2f5cfd000369833161ba68f81d627bde40647493d5f45469c66ee54bfa2a04a5c45d8e88863b89795b5038f47d1f6acd97d7a4980dc6f274f44cbb14'
            '30019a9ce73456046f67edd6fe8f4661bd9a8e9ca201f3bdf22d2fa70dad9544bd595a8820fbed402a0709809d02cabbdea9dc79ee1f5bf30f8ef722ba4a2c17'
            'f920b9cbceea78d31c2c2da429e8e519652fc6e5f8e25c28ffc1fd203318f0c85bf27f9ec97a97efbf5ff3a50c6daacbd007ca313fe1d03ac76d817440e7c924'
            'af68c916996b2cde401ecbb936542bd015e2d5e0aceb8a8cb7bc44477ef5c02d15d27f78a96f09e2e9d217eb87c41411529d8968571e1762f2a7a4201978dbad'
            'ff2a8f771fe720461accb7b82086062681f3b0f35b093a0c4f1995e57b0beb3575d8216e48646bb9a1636c4767a1a8c71022bbd79541353310bb8006009b9a2f'
            '250f7f27ed5d3b9a02b9df51e04d5e2abbd838eac527052ff32f78f3ebb3af1ad637d1ee4ce505e39ef0eb7f964b012108ccb08e6c6f65f40293f70378eecc92'
            '5c29aa66a8dc3bcdda681f6d67d642c41a22e97aff448c29192fa1129706864abd866f03bcf660705a63c33a8ffd674e97bd018ba86ab85ec0ffe2bbacae9c18'
            '3d11bc71a870181e9554525ca81fe72bc6018ad5599938b1b3f8ffe59eb2833be72031cdd5d3d2652e43294950ed0b5ba4cd60eefe2a98c03d089593d772fef3'
            'ef2dd0a27b09ca3a68aa7a3ad45b3720d57efd0505e631fa643e7aea98455c1114760f9aa5e91701bb5c118ae3074719709eeed55010b305d861464ad1b51c3a'
            'fa34975379329d53d5d02b4b137d86c273159d97d5e82026299c6f8bc018b7879156358cb1dbc320f894ed1d5497c6d482efd61f2e835de30b80eb0aef54e507'
            'c0b751df11fb9e1571679c3a82a784160ad8e41fd92b7492ada170ad9310b144cfe3622aab0eb97fd722003364e83a30b1128dbe1bd63971b05c51989430e842'
            '0afd153746727edbba65523cad450928fb863185679c7eb241c4c2928006c196a43235245aee7e1e1c2294be71e6035e47585db1270773da894947ac19a4c0c6'
            '74af4351258362c6c823fcc484f35f7b1ad65ff5f8d6082971d64cabb40905fbece837c7d9288acbe1fd76f996fbfee3eed4c910b4d87f45dc9d6ea8585b7046')

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

  # nm -f posix
  sed 's|nm \-f p |nm -f posix |' -i third_party/gyp/pylib/gyp/generator/ninja.py
}

build() {
  cd "$srcdir/mozc/src" || exit
  echo 'Generating zip code seed...'
  PYTHONPATH="$PWD:$PYTHONPATH" python dictionary/gen_zip_code_seed.py --zip_code="${srcdir}/KEN_ALL.CSV" --jigyosyo="${srcdir}/JIGYOSYO.CSV" >> data/dictionary_oss/dictionary09.txt
  echo 'Done.'

  # UT Dictionary steps, rewrite of `sh make.sh`
  # UT辞書を結合
  msg '1. Append dictionaries'
  for dict in "${_dict[@]}"; do
    cat "$srcdir/mozcdic-ut-${dict}.txt" >> ${srcdir}/mozcdict-ext/mozcdic-ut.txt
  done

  cd "${srcdir}/mozcdict-ext/" || exit

  # gem parallel
  [[ "$GEM_HOME"=="" ]] && GEM_HOME="/usr/lib/ruby/gems/3.0.0/"

  #msg '3. Run the ruby scripts as in original mecab-naist-jdic.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  #ruby mecab-naist-jdic/mecab-naist-jdic.rb -e euc-jp -f ${srcdir}//mecab-naist-jdic-0.6.3b-20111013/naist-jdic.csv -i ${srcdir}/mozc/src/data/dictionary_oss/id.def >> all-dict.txt
  
  # すだちを優先
  msg '2. Run the ruby scripts as in original sudachi.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  cd sudachi || exit
  ruby sudachi.rb -E -f ${srcdir}/small_lex.csv -f ${srcdir}/core_lex.csv -f ${srcdir}/notcore_lex.csv -i ${srcdir}/mozc/src/data/dictionary_oss/id.def > ../all-dict.txt
  #ruby sudachi.rb -E -f ${srcdir}/small_lex.csv -i ${srcdir}/mozc/src/data/dictionary_oss/id.def > ../all-dict.txt
  #ruby sudachi.rb -E -f ${srcdir}/core_lex.csv -i ${srcdir}/mozc/src/data/dictionary_oss/id.def >> ../all-dict.txt
  #ruby sudachi.rb -E -f ${srcdir}/notcore_lex.csv -i ${srcdir}/mozc/src/data/dictionary_oss/id.def >> ../all-dict.txt
  cd ..

  # ut-dictionarys
  msg '3. Run the ruby scripts as in original utdict.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  ruby utdict/utdict.rb -E -f mozcdic-ut.txt -i ${srcdir}/mozc/src/data/dictionary_oss/id.def >> all-dict.txt

  msg '4. Run the ruby scripts as uniqword.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  ruby .dev.utils/uniqword.rb all-dict.txt > finish-dict.txt
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
  bazel build -c opt --copt=-fPIC  --config oss_linux package unix/fcitx5:fcitx5-mozc.so
  bazel shutdown

  # Extract license part of mozc
  head -n 29 server/mozc_server.cc > LICENSE
  head -n 50 data/unicode/JIS0201.TXT > LICENSE.JIS0201
  head -n 73 data/unicode/JIS0208.TXT > LICENSE.JIS0208
  head -n 22 data/unicode/jisx0213-2004-std.txt > LICENSE.jisx0213-2004-std
}

package_mozc-with-jp-dict-common() {
  pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
  options=('!docs')
  depends=('qt6-base')
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
  install -D -m 644 third_party/ipa_font/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/ipa_font/LICENSE"
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
  depends=('fcitx5' 'hicolor-icon-theme' "$pkgbase-common" gcc-libs glibc)
  provides=('fcitx5-mozc')
  replaces=('fcitx5-mozc')
  conflicts=('fcitx-mozc' 'fcitx5-mozc')

  export PREFIX="$pkgdir/usr"
  export _bldtype
  cd mozc/src || exit

  #../scripts/install_fcitx5
  ../scripts/install_fcitx5_bazel
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"
}

package_ibus-mozc-with-jp-dict() {
  pkgdesc="IBus engine module for Mozc with UT dictionary"
  depends=('ibus>=1.4.1' "$pkgbase-common" "qt6-base")
  replaces=('ibus-mozc')
  conflicts=('ibus-mozc')

  export _bldtype
  cd "${srcdir}/mozc/src" || exit
  install -D -m 755 bazel-bin/unix/ibus/ibus_mozc         "$pkgdir/usr/lib/ibus-mozc/ibus-engine-mozc"
  install -D -m 644 bazel-bin/unix/ibus/mozc.xml          "$pkgdir/usr/share/ibus/component/mozc.xml"
  install -D -m 755 bazel-bin/renderer/qt/mozc_renderer      "${pkgdir}/usr/lib/mozc/mozc_renderer"
  
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"

  cd bazel-bin/unix || exit
  unzip -o icons.zip

  install -Dm644 mozc.png                                  "${pkgdir}/usr/share/ibus-mozc/product_icon.png"
  install -Dm644 alpha_full.svg                            "${pkgdir}/usr/share/ibus-mozc/alpha_full.svg"
  install -Dm644 alpha_half.svg                            "${pkgdir}/usr/share/ibus-mozc/alpha_half.svg"
  install -Dm644 direct.svg                                "${pkgdir}/usr/share/ibus-mozc/direct.svg"
  install -Dm644 hiragana.svg                              "${pkgdir}/usr/share/ibus-mozc/hiragana.svg"
  install -Dm644 katakana_full.svg                         "${pkgdir}/usr/share/ibus-mozc/katakana_full.svg"
  install -Dm644 katakana_half.svg                         "${pkgdir}/usr/share/ibus-mozc/katakana_half.svg"
  install -Dm644 outlined/dictionary.svg                   "${pkgdir}/usr/share/ibus-mozc/dictionary.svg"
  install -Dm644 outlined/properties.svg                   "${pkgdir}/usr/share/ibus-mozc/properties.svg"
  install -Dm644 outlined/tool.svg                         "${pkgdir}/usr/share/ibus-mozc/tool.svg"
}

package_emacs-mozc-with-jp-dict() {
  pkgdesc="Emacs engine module for Mozc with UT dictionary"
  depends=(gcc-libs "emacs" "$pkgbase-common")
  replaces=('emacs-mozc')
  conflicts=('emacs-mozc')

  export _bldtype
  cd "${srcdir}/mozc/src" || exit
  install -Dm755 bazel-bin/unix/emacs/mozc_emacs_helper "$pkgdir/usr/bin/mozc_emacs_helper"
  install -Dm644 unix/emacs/mozc.el                     "$pkgdir/usr/share/emacs/site-lisp/emacs-mozc/mozc.el"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"
}

