# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cmajor
pkgver=1.0.3088
pkgrel=1
pkgdesc='Programming language for writing fast, portable audio software'
arch=(x86_64)
url='https://cmajor.dev'
license=(GPL-3.0-or-later LicenseRef-CMajor)
depends=(
  glibc
  gcc-libs
  glib2
  gtk3
  libsoup3
  webkit2gtk-4.1
  alsa-lib
  jack2
  zlib
)
makedepends=(
  git
  ninja
  cmake
  openssh
)
options=(!debug)
source=(
  "$pkgname::git+https://github.com/cmajor-lang/cmajor#tag=$pkgver"
  "github.com-boostorg-align::git+https://github.com/boostorg/align"
  "github.com-boostorg-asio::git+https://github.com/boostorg/asio"
  "github.com-boostorg-assert::git+https://github.com/boostorg/assert"
  "github.com-boostorg-beast::git+https://github.com/boostorg/beast"
  "github.com-boostorg-bind::git+https://github.com/boostorg/bind"
  "github.com-Tracktion-choc::git+https://github.com/Tracktion/choc"
  "github.com-cmajor-lang-clap-wrapper::git+https://github.com/cmajor-lang/clap-wrapper"
  "github.com-free-audio-clap::git+https://github.com/free-audio/clap"
  "github.com-boostorg-config::git+https://github.com/boostorg/config"
  "github.com-boostorg-core::git+https://github.com/boostorg/core"
  "github.com-boostorg-date_time::git+https://github.com/boostorg/date_time"
  "github.com-boostorg-endian::git+https://github.com/boostorg/endian"
  "github.com-boostorg-intrusive::git+https://github.com/boostorg/intrusive"
  "github.com-boostorg-io::git+https://github.com/boostorg/io"
  "github.com-cmajor-lang-llvm::git+https://github.com/cmajor-lang/llvm"
  "github.com-boostorg-logic::git+https://github.com/boostorg/logic"
  "github.com-boostorg-move::git+https://github.com/boostorg/move"
  "github.com-boostorg-mp11::git+https://github.com/boostorg/mp11"
  "github.com-boostorg-mpl::git+https://github.com/boostorg/mpl"
  "github.com-boostorg-numeric_conversion::git+https://github.com/boostorg/numeric_conversion"
  "github.com-boostorg-optional::git+https://github.com/boostorg/optional"
  "github.com-boostorg-predef::git+https://github.com/boostorg/predef"
  "github.com-boostorg-preprocessor::git+https://github.com/boostorg/preprocessor"
  "github.com-boostorg-regex::git+https://github.com/boostorg/regex"
  "github.com-boostorg-smart_ptr::git+https://github.com/boostorg/smart_ptr"
  "github.com-boostorg-static_assert::git+https://github.com/boostorg/static_assert"
  "github.com-boostorg-static_string::git+https://github.com/boostorg/static_string"
  "github.com-boostorg-system::git+https://github.com/boostorg/system"
  "github.com-boostorg-throw_exception::git+https://github.com/boostorg/throw_exception"
  "github.com-boostorg-type_traits::git+https://github.com/boostorg/type_traits"
  "github.com-boostorg-utility::git+https://github.com/boostorg/utility"
  "github.com-boostorg-winapi::git+https://github.com/boostorg/winapi"
  use-anon-git-access.patch
)
sha512sums=('5728be15f6b29b6bd1d503569874a3995eb2d88cf570a9adbd14f3cb99137f635b865460b89bc73924d486ab82750eaea57d22b16a552ab00aadda3eec872330'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '8d6362f678ac866cc502bd1c16417b211c07bd930604fef455e898c2b92f805d1bb411817f1b5fbd0e0ae67337444053fc2c57700db0d4c1194527be67af8400')
b2sums=('f180b141b03fa41638fd72a9ca6c15d92fa9ba1993d7b09070c12300c6821e34fddc7b1d29dbff896c897951660c4a4551238036b8716756083cce94d15c14bd'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '2876dd801f60eaca996e9dd5b5a91f2a0222c2e9ea02bef8756c2d8f8208ff0b8e917388ebaac547704db309fc5b2e99e0da158e52e6b94f004dccbe01929580')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/use-anon-git-access.patch"

  # setup git submodules
  git submodule init

  git config submodule."3rdParty/boost/align".url "${srcdir}/github.com-boostorg-align"
  git config submodule."3rdParty/boost/asio".url "${srcdir}/github.com-boostorg-asio"
  git config submodule."3rdParty/boost/assert".url "${srcdir}/github.com-boostorg-assert"
  git config submodule."3rdParty/boost/beast".url "${srcdir}/github.com-boostorg-beast"
  git config submodule."3rdParty/boost/bind".url "${srcdir}/github.com-boostorg-bind"
  git config submodule."3rdParty/boost/config".url "${srcdir}/github.com-boostorg-config"
  git config submodule."3rdParty/boost/core".url "${srcdir}/github.com-boostorg-core"
  git config submodule."3rdParty/boost/date_time".url "${srcdir}/github.com-boostorg-date_time"
  git config submodule."3rdParty/boost/endian".url "${srcdir}/github.com-boostorg-endian"
  git config submodule."3rdParty/boost/intrusive".url "${srcdir}/github.com-boostorg-intrusive"
  git config submodule."3rdParty/boost/io".url "${srcdir}/github.com-boostorg-io"
  git config submodule."3rdParty/boost/logic".url "${srcdir}/github.com-boostorg-logic"
  git config submodule."3rdParty/boost/move".url "${srcdir}/github.com-boostorg-move"
  git config submodule."3rdParty/boost/mp11".url "${srcdir}/github.com-boostorg-mp11"
  git config submodule."3rdParty/boost/mpl".url "${srcdir}/github.com-boostorg-mpl"
  git config submodule."3rdParty/boost/numeric_conversion".url "${srcdir}/github.com-boostorg-numeric_conversion"
  git config submodule."3rdParty/boost/optional".url "${srcdir}/github.com-boostorg-optional"
  git config submodule."3rdParty/boost/predef".url "${srcdir}/github.com-boostorg-predef"
  git config submodule."3rdParty/boost/preprocessor".url "${srcdir}/github.com-boostorg-preprocessor"
  git config submodule."3rdParty/boost/regex".url "${srcdir}/github.com-boostorg-regex"
  git config submodule."3rdParty/boost/smart_ptr".url "${srcdir}/github.com-boostorg-smart_ptr"
  git config submodule."3rdParty/boost/static_assert".url "${srcdir}/github.com-boostorg-static_assert"
  git config submodule."3rdParty/boost/static_string".url "${srcdir}/github.com-boostorg-static_string"
  git config submodule."3rdParty/boost/system".url "${srcdir}/github.com-boostorg-system"
  git config submodule."3rdParty/boost/throw_exception".url "${srcdir}/github.com-boostorg-throw_exception"
  git config submodule."3rdParty/boost/type_traits".url "${srcdir}/github.com-boostorg-type_traits"
  git config submodule."3rdParty/boost/utility".url "${srcdir}/github.com-boostorg-utility"
  git config submodule."3rdParty/boost/winapi".url "${srcdir}/github.com-boostorg-winapi"
  git config submodule."3rdParty/choc".url "${srcdir}/github.com-Tracktion-choc"
  git config submodule."3rdParty/clap".url "${srcdir}/github.com-free-audio-clap"
  git config submodule."3rdParty/clap-wrapper".url "${srcdir}/github.com-cmajor-lang-clap-wrapper"
  git config submodule."3rdParty/llvm".url "${srcdir}/github.com-cmajor-lang-llvm"

  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
    local cmake_options=(
    -S "$pkgname"
    -B build
    -G Ninja
    -D BUILD_CMAJ=ON
    -D BUILD_CMAJ_LIB=OFF
    -D BUILD_PLUGIN=OFF
    -D BUILD_EXAMPLES=OFF
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_SKIP_BUILD_RPATH=ON
    -W no-dev
  )

  cmake "${cmake_options[@]}"

  cmake --build build
}

package() {
  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/tools/command/cmaj
  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE.md"
}
