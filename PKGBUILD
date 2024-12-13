# $Id$
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: BrLi <brli at chakralinux dot org>
# Contributor: Jiachen Yang <farseerfc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>

## Mozc compile option
_bldtype='Release'
_zipcode_rel=202110

# Ut Dictionary
_utdicdate=20241212
_dict=(alt-cannadic
       edict2
       jawiki
       neologd
       personal-names
       place-names
       skk-jisyo
       sudachidict)

pkgbase=mozc-ut-full
pkgname=("$pkgbase-common" "ibus-$pkgbase" "fcitx5-$pkgbase" "emacs-$pkgbase")
pkgver=2.30.5618.102.20241212
pkgrel=1
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
makedepends=('bazel' 'git' 'python' 'python-six' 'pkg-config' 'curl' 'mesa' 'subversion' 'qt6-base' 'clang' 'fcitx5' 'emacs' 'ibus')
source=(git+https://github.com/fcitx/mozc.git#commit=f53990354c2efc868a40b00a5d2baa13cadcd01e
        # 2023-07-13: osdn.net is unstable due to Amazon
        # "https://osdn.net/projects/ponsfoot-aur/storage/mozc/x-ken-all-${_zipcode_rel}.zip"
        # "https://osdn.net/projects/ponsfoot-aur/storage/mozc/jigyosyo-${_zipcode_rel}.zip"
        "https://gitlab.com/BrLi/brli-aur/-/raw/fcitx5-mozc-ut/x-ken-all-${_zipcode_rel}.zip"
        "https://gitlab.com/BrLi/brli-aur/-/raw/fcitx5-mozc-ut/jigyosyo-${_zipcode_rel}.zip"
        git+https://github.com/abseil/abseil-cpp.git
        git+https://chromium.googlesource.com/breakpad/breakpad
        git+https://github.com/google/googletest.git
        git+https://chromium.googlesource.com/external/gyp
        git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git
        git+https://github.com/open-source-parsers/jsoncpp.git
        git+https://github.com/google/protobuf.git
        git+https://github.com/utuhiro78/merge-ut-dictionaries.git
        jawiki-latest-pages-articles-multistream-index-${_utdicdate}.txt.bz2::https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-pages-articles-multistream-index.txt.bz2
        0001-remove-download.patch)
noextract=(jawiki-latest-pages-articles-multistream-index-${_utdicdate}.txt.bz2)
for dict in "${_dict[@]}"; do
    source+=("mozcdic-ut-${dict}-${_utdicdate}.txt.bz2"::"https://github.com/utuhiro78/mozcdic-ut-${dict}/raw/main/mozcdic-ut-${dict}.txt.bz2")
done
sha512sums=('f99941f0dda8080a4c3fbf2ce9f7009b5043e4b80bef33fb873bd9ff174de2f9f587632cbb32d5cee680e043b35fca60ed70c6eb544f2b0fb518d2d37906e798'
            'dec6479b42ddc1355cd882d17824cd874d8f103ad7767bac3f490f04551059d65b2806fa9e3f39a50ced2ecfdd37b75c9ed4536d9ad3bcef9e8c5ae1ec10e302'
            '606f45d48a9dad0e80a566cab0001910de3c6b2f634ec52c6ef6f44745b55ae8e181b3e3cdf90525a08be1f180eb35900672c90c6ab4f43679a178e863378bbc'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '0a2395a7162737e41d640f800a8c39f5947149382718b4a6b3cc14e544a93f474ef0f5afe489c98c416c07e546817b8c925a9c042dde39b6c05d9d0eef13a57e'
            '19ccbab5f66c1473627f12770b9afddc09d4d3f29b66e23b5d9d11d5ae2180e8b92633f5245be2e43f05fcc742df2544e63cd9fcccd61bb0df0e4495ab84beec'
            '09b86b7527d45423090645a6763bb5d2d2bfe105a1db3736a2b7d48edf73dd2a6a4da4ae8ceb62bf26da210d07a6e6f7260dea7e01539e7746731d898793a07b'
            '769216fec2b6a6af706e5bea1deace01b77c62e4dc6e8e5f8aa4165e1b4e7323ecaf1084dacf9302a6b5cdb1ce44720143ae7f40186519dca02846e8bd6016f2'
            '1063f632d242f67c3181618c55e77f6f6aaf3fb160de8f750d79e0da5e8400fa45a3923c71748b4da5a1f4f45a1089b42c6aa617c4832edf607172649838ca03'
            '2c3317d00faa52980c0069f0655e83681606b6e259044129149bff2ba1b7f17dbfdeeaad832b6d0b2f4935c7fd40bfefec54bbfe04bf189c5868847cc63065f6'
            'f2d9b8e12981ca0a2eced2aed025c8a41a9bdd042155e6de7a3c417302750401b1906bd89f4767559447090fc175e2ec2f0e93fb70beb765798136078a1764c9'
            'b1f8336570735fdd03517d72f57c78252e6de3fd7e5fcf1162339598ef58cb0c5206311285c7bb9f51b8e4c3a04aca223f555f239ff8225b949eb574509d08a4'
            '4841eeee6c073f9d40cb0ca16798918b8a535491b166f3e024228261e7c2d597910c40f5c611205fd17e88034cedbe0298363778007a4c2c254762b40398ec3d'
            'd4ce06fd1317e56b13cfbcf5ea667162ce93badea7519da1dd55ca3c8d2f892729501cd5df762eba16de83ce853b1b377dd5a8be812ea42ce3a13dfaf020575b')

pkgver() {
    cd "${srcdir}/mozc" || exit
    source <(grep = src/data/version/mozc_version_template.bzl | tr -d ' ')
    printf "%s.%s.%s.%s.%s" "$MAJOR" "$MINOR" "$BUILD_OSS" "$((REVISION + 2))" "$_utdicdate"
}

prepare() {
    cd "$srcdir/mozc" || exit
    git config -f .gitmodules submodule.src/third_party/abseil-cpp.url "$srcdir/abseil-cpp"
    git config -f .gitmodules submodule.src/third_party/breakpad.url "$srcdir/breakpad"
    git config -f .gitmodules submodule.src/third_party/gtest.url "$srcdir/googletest"
    git config -f .gitmodules submodule.src/third_party/gyp.url "$srcdir/gyp"
    git config -f .gitmodules submodule.src/third_party/japanese_usage_dictionary.url "$srcdir/japanese-usage-dictionary"
    git config -f .gitmodules submodule.src/third_party/jsoncpp.url "$srcdir/jsoncpp"
    git config -f .gitmodules submodule.src/third_party/protobuf.url "$srcdir/protobuf"
    git -c protocol.file.allow=always submodule update --init

    cd src || exit
    echo 'Generating zip code seed...'
    PYTHONPATH="$PWD:$PYTHONPATH" python dictionary/gen_zip_code_seed.py --zip_code="${srcdir}/x-ken-all.csv" --jigyosyo="${srcdir}/JIGYOSYO.CSV" >>data/dictionary_oss/dictionary09.txt
    echo 'Done.'

    # disable fcitx4 target
    rm unix/fcitx/fcitx.gyp

    # fix mozc icon for kimpanel
    sed -i 's|PREFIX|/usr|' unix/fcitx5/mozc.conf

    # use libstdc++ instead of libc++
    sed '/stdlib=libc++/d;/-lc++/d' -i gyp/common.gypi

    # UT Dictionary steps, rewrite of `sh make.sh`
    msg 'UT Dictionary steps, rewrite of `sh make.sh`'
    cd "${srcdir}/merge-ut-dictionaries/src/merge" || exit
    msg '1. Append dictionaries'
    for dict in "${_dict[@]}"; do
        cat "$srcdir/mozcdic-ut-${dict}-${_utdicdate}.txt" >>mozcdic-ut.txt
    done
    msg '2. Patch python scripts to avoid downloading'
    patch -Np1 -i "${srcdir}/0001-remove-download.patch"
    mv -v "$srcdir/jawiki-latest-pages-articles-multistream-index-${_utdicdate}.txt.bz2" jawiki-latest-pages-articles-multistream-index.txt.bz2
    msg '3. Run the python scripts as in original make.sh, it may take some time...'
    python merge_dictionaries.py mozcdic-ut.txt
    msg '4. Finally add UT dictionary to mozc source'
    cat mozcdic-ut.txt >>"$srcdir/mozc/src/data/dictionary_oss/dictionary00.txt"
}

build() {
    # Fix compatibility with google-glog 0.3.3 (symbol conflict)
    CFLAGS="${CFLAGS} -fvisibility=hidden"
    CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

    cd mozc/src || exit

    _targets="unix/fcitx5:fcitx5-mozc.so server:mozc_server gui/tool:mozc_tool renderer/qt:mozc_renderer unix/ibus:ibus_mozc unix/emacs:mozc_emacs_helper"

    unset ANDROID_NDK_HOME
    unset ANDROID_HOME
    export JAVA_HOME='/usr/lib/jvm/java-21-openjdk/'
    export QT_BASE_PATH=/usr/include/qt

    # Temp fix for GCC 14
    sed -i -e '/Werror/d' third_party/protobuf/build_defs/cpp_opts.bzl

    bazel build --copt=-fPIC --compilation_mode opt --config oss_linux $_targets --copt='-Wno-maybe-uninitialized' --host_copt='-Wno-maybe-uninitialized'

}

package_mozc-ut-full-common() {
    pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
    optdepends=('qt6-base: Display GUI of mozc_tool')
    options=('!docs')
    export PREFIX="$pkgdir/usr"
    export _bldtype
    cd mozc/src || exit

    # BSD-3-Clause
    sed -n 1,29p unix/fcitx5/fcitx_key_translator.h >Fcitx5
    sed -i -e 's|^\/\/[ ]\?||g' Fcitx5
    install -Dm644 Fcitx5 "${pkgdir}"/usr/share/licenses/${pkgname}/Fcitx5
    # BSD-3-Clause
    sed -n 67,94p data/installer/credits_en.html >Mozc
    install -Dm644 Mozc "${pkgdir}"/usr/share/licenses/${pkgname}/Mozc
    # BSD-3-Clause
    sed -n 317,344p data/installer/credits_en.html >Breakpad
    install -Dm644 Breakpad "${pkgdir}"/usr/share/licenses/${pkgname}/Breakpad
    # NAIST-2003
    sed -n 355,424p data/installer/credits_en.html >IPAdic
    install -Dm644 IPAdic "${pkgdir}"/usr/share/licenses/${pkgname}/IPAdic
    # BSD-2-Clause
    sed -n 435,457p data/installer/credits_en.html >Japanese-Usage-Dictionary
    install -Dm644 Japanese-Usage-Dictionary "${pkgdir}"/usr/share/licenses/${pkgname}/Japanese-Usage-Dictionary
    # Public Domain Data
    sed -n 468,470p data/installer/credits_en.html >Okinawa-Dictionary
    install -Dm644 Okinawa-Dictionary "${pkgdir}"/usr/share/licenses/${pkgname}/Okinawa-Dictionary
    # BSD-3-Clause
    sed -n 481,513p data/installer/credits_en.html >Protocol-Buffers
    install -Dm644 Protocol-Buffers "${pkgdir}"/usr/share/licenses/${pkgname}/Protocol-Buffers
    # MIT
    sed -n 698,704p data/installer/credits_en.html >Tamachi-Phonetic-Kanji-Alphabet
    install -Dm644 Tamachi-Phonetic-Kanji-Alphabet "${pkgdir}"/usr/share/licenses/${pkgname}/Tamachi-Phonetic-Kanji-Alphabet
    # MIT
    sed -n 762,782p data/installer/credits_en.html >Windows-Implementation-Library
    sed -i -e 's|^[ \t]*||g' Windows-Implementation-Library
    install -Dm644 Windows-Implementation-Library "${pkgdir}"/usr/share/licenses/${pkgname}/Windows-Implementation-Library

    ../scripts/install_server_bazel
}

package_fcitx5-mozc-ut-full() {
    pkgdesc="Fcitx5 module for Mozc with UT dictionary"
    depends=('fcitx5' "$pkgbase-common")
    provides=('fcitx5-mozc')
    replaces=('fcitx5-mozc')
    conflicts=('fcitx-mozc' 'fcitx5-mozc')

    export PREFIX="$pkgdir/usr"
    export _bldtype
    cd mozc/src || exit

    ../scripts/install_fcitx5_bazel
}

package_ibus-mozc-ut-full() {
    pkgdesc="IBus engine module for Mozc with UT dictionary"
    depends=('ibus' "$pkgbase-common")
    conflicts=('ibus-mozc')
    replaces=('ibus-mozc')

    export _bldtype
    cd "${srcdir}/mozc/src" || exit
    install -D -m 755 bazel-bin/unix/ibus/ibus_mozc "$pkgdir/usr/lib/ibus-mozc/ibus-engine-mozc"
    install -D -m 644 bazel-bin/unix/ibus/mozc.xml "$pkgdir/usr/share/ibus/component/mozc.xml"
    install -D -m 755 bazel-bin/renderer/qt/mozc_renderer "$pkgdir/usr/lib/mozc/mozc_renderer"

    cd bazel-bin/unix || exit
    unzip -o icons.zip

    install -Dm644 mozc.png "${pkgdir}/usr/share/ibus-mozc/product_icon.png"
    install -Dm644 alpha_full.svg "${pkgdir}/usr/share/ibus-mozc/alpha_full.svg"
    install -Dm644 alpha_half.svg "${pkgdir}/usr/share/ibus-mozc/alpha_half.svg"
    install -Dm644 direct.svg "${pkgdir}/usr/share/ibus-mozc/direct.svg"
    install -Dm644 hiragana.svg "${pkgdir}/usr/share/ibus-mozc/hiragana.svg"
    install -Dm644 katakana_full.svg "${pkgdir}/usr/share/ibus-mozc/katakana_full.svg"
    install -Dm644 katakana_half.svg "${pkgdir}/usr/share/ibus-mozc/katakana_half.svg"
    install -Dm644 outlined/dictionary.svg "${pkgdir}/usr/share/ibus-mozc/dictionary.svg"
    install -Dm644 outlined/properties.svg "${pkgdir}/usr/share/ibus-mozc/properties.svg"
    install -Dm644 outlined/tool.svg "${pkgdir}/usr/share/ibus-mozc/tool.svg"
}

package_emacs-mozc-ut-full() {
    pkgdesc="Emacs engine module for Mozc with UT dictionary"
    depends=('emacs' "$pkgbase-common")
    replaces=('emacs-mozc')
    conflicts=('emacs-mozc')

    export _bldtype
    cd "${srcdir}/mozc/src" || exit
    install -Dm755 bazel-bin/unix/emacs/mozc_emacs_helper "$pkgdir/usr/bin/mozc_emacs_helper"
    install -Dm644 unix/emacs/mozc.el "$pkgdir/usr/share/emacs/site-lisp/emacs-mozc/mozc.el"
}
