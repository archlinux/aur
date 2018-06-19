# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=curse_downloader_qt
pkgver=1.1
pkgrel=1
pkgdesc="Curse ModPacks downloader"
url="https://github.com/Wanket/CurseDownloaderQt"
arch=("x86_64")
license=("GPLv3")
depends=("qt5-base" "libc++" "libc++abi")
makedepends=("git" "clang" "cmake" "conan")

build() {
  git clone https://github.com/Wanket/CurseDownloaderQt.git
  cd "CurseDownloaderQt"
  export CC=/usr/bin/clang
  export CXX=/usr/bin/clang++
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "CurseDownloaderQt"
  install -Dm755 bin/Curse_Downloader_Qt "$pkgdir/usr/bin/curse-downloader-qt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
