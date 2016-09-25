        # Maintainer: <lemust83420 at gmail.com>
        pkgname=audio-thumbs5
        pkgver=1
        pkgrel=1
        pkgdesc="Preview of embed album art in audio file for Dolphin 5 based on Audio-Thumb 5"
        arch=(i686 x86_64)
        url="https://github.com/bvbfan/Audio-thumbs"
        license=('GPL3')
        depends=('plasma-desktop' 'qt5-base' 'taglib')
        makedepends=('extra-cmake-modules')
        conflicts=(audio-thumbs5)
        replaces=(audio-thumbs5)
        source=('https://github.com/bvbfan/Audio-thumbs/archive/master.zip')
        sha256sums=("3426e0a7599319862f61ded6146dd5f2a40224b8139ee35caf6ff36c346fe1f3")
        prepare() {
              mv Audio-thumbs-master ${pkgname}
              mkdir -p $srcdir/$pkgname/build
                  }
        build() {
             cd "$pkgname/build/"
 
             cmake .. \
             -DCMAKE_INSTALL_PREFIX=/usr \
             -DCMAKE_BUILD_TYPE=Release \
             -DLIB_INSTALL_DIR=lib \
             -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
             make
        }

        package() {
           cd "$pkgname/build"
           make DESTDIR="$pkgdir/" install
        }
