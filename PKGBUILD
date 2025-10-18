# Maintainer: RAMChYLD <ramchyld@gmail.com>
# Contributor: FabioLolix
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Federico Cinelli <cinelli@aur.archlinux.org>
# Contributor: Mateusz Herych   <heniekk@gmail.com>

pkgname=libquicktime
_commit='27295919b3a1036ba8bc06cec414dcc501f72d89'
pkgver=1.2.4
pkgrel=34
pkgdesc="A library for reading and writing quicktime files"
arch=(x86_64)
license=(LGPL2.1)
url="http://libquicktime.sourceforge.net/"
depends=(glib2 glibc zlib)
# NOTE: applied experimental ffmpeg7 patch. Please provide feedback if this works for you
makedepends=(alsa-lib doxygen faac faad2 ffmpeg gtk2 lame libdv libglvnd
             libjpeg-turbo libvorbis libx11 libxaw libxext libxt libxv
             schroedinger sndio x264)
optdepends=('alsa-lib: for lqtplay'
            'faac: for lqt_faac plugin'
            'ffmpeg: for lqt_ffmpeg plugin'
            'gtk2: for libquicktime_config'
            'lame: for lqt_lame plugin'
            'libdv: for lqt_dv plugin'
            'libglvnd: for lqtplay'
            'libjpeg-turbo: for lqt_mjpeg plugin'
            'libpng: for lqt_png plugin'
            'libvorbis: for lqt_lame and lqt_vorbis plugin'
            'libx11: for lqtplay'
            'libxaw: for lqtplay'
            'libxext: for lqtplay'
            'libxt: for lqtplay'
            'libxv: for lqtplay'
            'schroedinger: for lqt_schroedinger plugin'
            'sndio: for lqtplay'
            'x264: for lqt_x264 plugin')
provides=(libquicktime.so)
options=(!lto)
source=(
  "https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"
  "${pkgname}-1.2.4-CVE-2016-2399.patch"
  "${pkgname}-1.2.4-CVE-2017-9122_et_al.patch"
  "${pkgname}-1.2.4-faad2.patch"
  "${pkgname}-1.2.4-ffmpeg2.patch"
  "${pkgname}-1.2.4-ffmpeg29.patch"
  "${pkgname}-1.2.4-ffmpeg4.patch"
  "${pkgname}-1.2.4-ffmpeg-codecs.patch"
  "${pkgname}-1.2.4-libavutil.patch"
  "${pkgname}-1.2.4-ffmpeg5.patch"
  "${pkgname}-1.2.4-qtpng.patch"
  "${pkgname}-1.2.4-ffmpeg7.patch"
  "${pkgname}-1.2.4-gcc15.patch"
  "${pkgname}-1.2.4-ffmpeg8.patch"
  "${pkgname}-1.2.4-gcc15-lame.patch"
)
sha512sums=('6ab6cd62ae2361bb3ad73725e9e8baa2b03361bc23e9e34b24f90c0e2bec4337de950ed7f30a6a1d2e67ab33e8f0c43538369fd07e417f54b84583a3c331f8dd'
            '759fee13bc96db036063efcd8288c0e467ce811b597cf6c0ceed1c8927593963174f4f3324512db0e773e936a4b9fe5c8d8fc9e0f00b2ce59110661175986f9c'
            '93639d3fe12eefddd1b457be702ec0a4a64a73c44fce6b3134e50bb9a4e7e5f25d256d3ace6ec5e774f2db4c0d68725f3e35e901f7d932a4be9cba566eab528e'
            '3e751330ebbc4026363efd45b21c60c313ea169a57a5cdfa46125e126aab34c2dea3629ce92e7b0b5f14693db4f11723177fd28611e2e979cc8fcd506077509e'
            '32ddf394aad4ed80e89ec72a534e0466268ab0061b991815e905b78eae55a7d935117b0915faf6f7f51bd7e2d9fbaa4b0e07bfcef1ef1e2f4a7e2061c489122d'
            '2a7e06c03b0f64f02b923c1a0e7121f4e1ea735f19a6df8ce8daf18177ead132d1ae921c64f3770042db3bbf29f15a7fcceece835d475e052c4c3bb7139c9e2e'
            '1b11a82d694654976a5f79cd8feb27eec3810e09a66dc58ca576eaf1f96e4948abd4dae7955a7da6cf99ae6ffef9e183b39090d96cc6b5fe216b4c4f4faff7a8'
            '20c535444de1f3e9a68c35ee4eb409f150e6340fd43dda4544791454f42c031b24c08f651e0351f5a22dcb59459ac372aa70d82a1d20482b2d997589e19087fd'
            '691110dc18f6646e2e17f40c6a42911a6b8eaa8cea20b5595f20d218d51da11d11923a3001b7ad7c3ad6bd0d90e712b95ccee5526fa1bec176cd27813e4a775e'
            'bfaa78504b93402a07e6e92db92322cf178ab67db3c61d1c67db5644796b07330885f857fdcac09271a6bbfd5dee29e9d567294fb0357f29b18072b06a4b762e'
            '39e3f534a8b87216c81faf7b755262ef0186ead4b1a94ca8b69224d364af81087e099406b88609e1262b85a2f093f4beeb84584a6c84a1ab75d34d1e16e892a4'
            '62d83f9b917082d755487c41a4f7485d9754c9de02931ca0ec7823726e602ab6f541e09679454e40679510c37ed93681211f7055530ab6dcb0dcbcaf07c4e8a4'
            'ef0e96bdbb9b4ca94c620e0aed085f32f5dae446443e1298a72997eb0c3a067442d68a3bcf6eccae0231cb70a283c0e3159acae3d5a18fcae30fc7c9c132be25'
            '1ff84c5dc3d67828a3a65e3a1df4c08c1f38c48fe79dbc7b6517d58fe7eec5992327c06d379b95e5db10f861737b926ddd5586645500c0bc9e8109d8e3163638'
            'e584930b73b3213f7ffcd0770d046d804b549f80f18c836b4c329ea2af7bd70bc907d60d75c06824a7cb22c79379531e9d369c9c2fc37968c6f9bccb991e002d'
)
b2sums=('6c50965be5d19fb4c57ea6b36f2581ebd575d78a34f2df7029ce2c6ee560e8135a953a2e85d91d189e2c01b97c99804d0eab602866b88a5f07c36351174680f0'
        '2794d13a0afa8a948f8f1335d7ee0a3d75691bbb9c619716707f533f52e8a8826c4a883b25db2ad8fb6544ce8b7c0fa883158b110c10b896e124b6ade9d18945'
        '8d5be1d1a297d89da1256035042a9760227815b8e73cb994b04b3ac4a2d7b83f79625bb62dc89266ac2f3eebd4cb033c8eb66388aca6097f4dbcc86d919dbd72'
        '175a32d051c438d59f428fb5a5d082e267f5503d9ff5ecded8302b74278f0bd1d0c5680161c1dd99089a116f9617fb37cdc697115979c5901c88e201ab221039'
        '1db6a761fa94a32741a05919d12d0211964647a61ffd32ba8619530ec089c980999aa1ded534c2652eb3baf15558bcb9842a23634eeef043a6ed3eb3f8e794ff'
        '8a1e7b5df65f5297f59aa17c4a52706413c1ffd88d8645de7359ec26f7059101ab81ac135cf7ef707a8acbeb709e1a6dae03d6a7e7f70c7e88185ebb271acbe4'
        'bd1299c24b738b3752e4d8d50ed1b2fa2f208c83e577876118d115fca22293e102614ae0cdc168060115f7145d951d290bccf21154fda4aabf55329d310b6aca'
        'e770000ea0c39f77bc36e7e5252e281b9f9d06a136c655cd702332cc8581f128263e172e41eab3b7ce2543da7065d8efc28c048588e577db5ee6ec4bfeb1019b'
        '0a29c9a3d1eae31731b76536a22aa23a4888b8ac55c3176c60a152330fce37e8031a4269fa28026133c7061cd769b1428bf24fe59fed574e39d52ea00b6e00a0'
        'e67d8b0ac52a37594c1499270b04a74963b01567567d7469579238ba177ea7259215378d03484474bdc7caef309585c53263b4e87a68a5f8ed0b332e0118b675'
        'bc591a3f4f7a8f78256d74dcf43d7beabaa05cc746dc63a8c0826ce469cb142d8cfdf55245573fc61e34b3c21f2ce1f01906cf46d8af7f67fe4ff207bfcb43eb'
        '3aa05d6b6b3ed5c1035b6be47b820eb775115b6ac3455bc0ab985f3b6ab32bebd083609908a2d0bbb805078373c40685e19706d036d31301d7785541504abe10'
        '959da82141439ef25f8ad6b4e3a412e7429ddc3090d78d405c4aa9d5a4169b835b326c27cbfc76d6afd25fc401eb8f7c1e1c876c0f0c5e4ffde6aee46188abba'
        '22aa532e23fdfb65443da77f5e2d2d1d1683309e3c5a6fb1b9c37c17a851666623c0742f38ab32874a5f97346c5adfcf603b59e88c6cacbaa20e841803ef30c6'
        '6a6f3ae0dff49ae885aa2a3eb572a6af312777308bc11ae99127ad9d79e9142fd767429d6f48fbfd89a26f6380abde1f48b885d8432b37452e856440749964a4'
)

prepare() {
  cd "$pkgname-$pkgver"
  # boatload of CVEs: http://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=libquicktime
  patch -Np1 -i "../${pkgname}-1.2.4-CVE-2016-2399.patch"
  patch -Np1 -i "../${pkgname}-1.2.4-CVE-2017-9122_et_al.patch"
  # checks for faad2 are broken in configure.ac
  patch -Np1 -i "../${pkgname}-1.2.4-faad2.patch"
  # ffmpeg compatibility is very ancient
  patch -Np1 -i "../${pkgname}-1.2.4-ffmpeg2.patch"
  patch -Np1 -i "../${pkgname}-1.2.4-ffmpeg29.patch"
  patch -Np1 -i "../${pkgname}-1.2.4-ffmpeg4.patch"
  patch -Np1 -i "../${pkgname}-1.2.4-libavutil.patch"
  patch -Np1 -i "../${pkgname}-1.2.4-ffmpeg-codecs.patch"
  patch -Np1 -i "../${pkgname}-1.2.4-ffmpeg5.patch"
  patch -Np1 -i "../${pkgname}-1.2.4-qtpng.patch"
  patch -Np1 -i "../${pkgname}-1.2.4-ffmpeg7.patch"
  patch -Np1 -i "../${pkgname}-1.2.4-gcc15.patch"
  patch -Np1 -i "../${pkgname}-1.2.4-ffmpeg8.patch"
  patch -Np1 -i "../${pkgname}-1.2.4-gcc15-lame.patch"

  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --enable-gpl \
    --with-faac \
    --with-ffmpeg \
    --with-libdv \
    --with-x264 \
    --without-doxygen

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  depends+=(libfaad.so)

  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm 644 {AUTHORS,ChangeLog,README,TODO} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
