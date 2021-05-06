# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

## GCC-PAtches for a better compiling without errors, you can disable or enable them here
_use_patchese=y

pkgname=(gcc-11 gcc-libs-11 gcc-fortran-11 gcc-objc-11 gcc-ada-11 gcc-go-11 lib32-gcc-libs-11 gcc-d-11)
pkgver=11.1.0
_majorver=${pkgver%%.*}
_islver=0.24
pkgrel=2
pkgdesc='The GNU Compiler Collection'
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='https://gcc.gnu.org'
makedepends=(binutils libmpc gcc-ada doxygen lib32-glibc lib32-gcc-libs python git)
checkdepends=(dejagnu inetutils)
options=(!emptydirs)
_patchsource="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/gcc/gcc/11.1.0"
_libdir=usr/lib/gcc/$CHOST/${pkgver%%+*}
source=("https://sourceware.org/pub/gcc/releases/gcc-11.1.0/gcc-11.1.0.tar.xz"
        "http://isl.gforge.inria.fr/isl-0.24.tar.xz"
        "c89"
        "c99"
        "${_patchsource}/01_all_default-fortify-source.patch"
        "${_patchsource}/02_all_default-warn-format-security.patch"
        "${_patchsource}/03_all_default-warn-trampolines.patch"
        "${_patchsource}/04_all_nossp-on-nostdlib.patch"
        "${_patchsource}/05_all_alpha-mieee-default.patch"
        "${_patchsource}/06_all_ia64_note.GNU-stack.patch"
        "${_patchsource}/07_all_libiberty-asprintf.patch"
        "${_patchsource}/08_all_libiberty-pic.patch"
        "${_patchsource}/09_all_nopie-all-flags.patch"
        "${_patchsource}/10_all_sh-drop-sysroot-suffix.patch"
        "${_patchsource}/11_all_ia64-TEXTREL.patch"
        "${_patchsource}/12_all_disable-systemtap-switch.patch"
        "${_patchsource}/13_all_m68k-textrel-on-libgcc.patch"
        "${_patchsource}/14_all_respect-build-cxxflags.patch"
        "${_patchsource}/15_all_libgomp-Werror.patch"
        "${_patchsource}/16_all_libitm-Werror.patch"
        "${_patchsource}/17_all_libatomic-Werror.patch"
        "${_patchsource}/18_all_libbacktrace-Werror.patch"
        "${_patchsource}/19_all_libsanitizer-Werror.patch"
        "${_patchsource}/20_all_libstdcxx-no-vtv.patch"
        "${_patchsource}/21_all_disable-riscv32-ABIs.patch"
        "${_patchsource}/22_all_default_ssp-buffer-size.patch"
        "${_patchsource}/23_all_EXTRA_OPTIONS-z-now.patch"
        "${_patchsource}/24_all_EXTRA_OPTIONS-fstack-clash-protection.patch"
        "${_patchsource}/25_all_lto-intl-workaround-PR95194.patch"
        "${_patchsource}/26_all_plugin-objdump.patch"
)
b2sums=('fe617e776b0270d11adea21b5c37d889de90865c19ab82d1c37bbd5c5b9c583a98c174606c4f893ca4950a4233e2a58aae93ad6aa7ad33d4e78a31c72371c1ed'
        '39cbfd18ad05778e3a5a44429261b45e4abc3efe7730ee890674d968890fe5e52c73bc1f8d271c7c3bc72d5754e3f7fcb209bd139e823d19cb9ea4ce1440164d'
        '2c64090b879d6faea7f20095eff1b9bd6a09fe3b15b3890783d3715171678ab62d32c91af683b878746fb14441dbe09768474417840f96a561443415f76afb63'
        '3cf318835b9833ac7c5d3a6026fff8b4f18b098e18c9649d00e32273688ff06ec3af41f0d0aee9d2261725e0ff08f47a224ccfe5ebb06646aaf318ff8ac9a0d1'
        '587486571e8525765d711195caafef0f42994de1e53c18e4247b229518c660ea16cf6198b26ce48f96fe206125bc89bbd6401220b380f774df4ccfc2cd875904'
        'f02d654db021e4a647ac2526ec7d487f5c73ba687066b188601e99f46f6053d7a3515da3fb8d6fc73d5c31c676c21d5aba8619630bffb96a0143de16df73ed35'
        '3773fe7d55a5cb2746324277dc27340fdf316f8b797e7d144c44bfd95b46a72e81bf497398533bb891f4990b4785b8991f03cc33b40cfa6113bc17eb33a3d09a'
        '72ecf4cfc14d860764c76991d1790f826ae16aa51407b70fb0eb0f4281faa88c73afc3560fda51d6813288195acccb0df732618cdcd7b82d6de2a26daf7a3243'
        'f32744c6664f4198c7541ed39f97ba19db46df1859e6ab0571886e2579699027a6f5cb38f327e01fe15a4c5715ac93d02216602159b8e75c15ac19eb77568d0a'
        'cbde514769d9dd861081fae19330e732473974093ada8006dc9ea778cf5ae089abc07faf9c8ae9a5edf49cfe7e85269e563366f10a76e00f64857ced2d1e6f27'
        '71763a85ba2ccec603e44e895cef4fff1a12f53941b37a9e64b108e66f24de3995c9eba5071053de207a77ac71efa528d8bdf714e3f1a84abbb423994b673552'
        '284f01e91907506e65d5267d158341e3f439a57086d9f6b2ff59e94047afd2fd7818469a526d13802f45ddeef65d908ca31723a8dbe0bb268be7d200e56c88e9'
        'd6dc2690c5e379f6b4f7a10eda212b6752888dba4384e14c5c8ea7fde83246a0cea328256a297e227ec50b8948fef8c42086cbceb88e6802d6d3a7701a581452'
        'da1f3cb6f9601a5e169b7342c529910a5bcdcf44b2669d2d49ae9fc36b7c80f21a3a45b708e9ee793ffd59f3d051160bb8b0c0a986de51c298ae2e3fc844f20b'
        '1e0cce31f5cbc0d0afc8b0df6afd25b8c2f9e248be96d8b52b2e4fffac3d2ce965c9eb3113cfb13a97e73c66a2fcc12e74e673497398c0b7691882b8c60b3fd9'
        '67b1fea4c437f48fb222349a7f05a391c7150b001eee80ce9a5b86701b8d1b1793519cc52cc107a79f5a1b9c6972a39b76c64b92be77098569de11604d9282c1'
        'f9c8834c7aaeb6355df368ddb728f96ba7b0d6a637499b3ed8cf06c2eb571d800f423e6a93adb9e02e67bfa3f5c6558ee528ff907ca42046038fb6d3b8b73fb0'
        'f1fa9ede75763eb3c9ca6f2eb85e1299d7b640200386a73a8abcb31b1423dd411c669d99093b047bbc7d0667d852c5c97574c013d01bd48fb4a01ea207a2bc65'
        'bf4f3d585b9b9439a94ce83325f18ca8a1a94a474ee561371466cae5b58a95f5b80ab8382f98b2baf1cecc400c6bead6c68a3e44a5bed0b8d6d0498fbfd41059'
        'd29dfefdd81f529c9574f5339666ee49876f4d44d87bf7002a5baab348349e0e60b1180904cc4d0b90d0b3229cfb6bb41370fb69e1a2d57f2424503c3df67205'
        '8bf880b8979f4e03e4401b98e5156beaf6a4127d1ca66331801ce49b957ab60d3726e51ecc55b833981bccaba91c7966b1f14d8b518204aece0fdcfe9df0937e'
        'fc4e4638755616c59b9a9f9c72d87579dc12f43912f0044ca680be880a82ec91fcd5b60a15ef9780e2a7688ab1fb80198464b7b5e6e5781bad81564706bb366a'
        '6af53b290ab5630ea73ceccde49f3c6b28f5762b3711ab62f19b87407d2dda11b5a6cadc3d6cfd25c6c64ffa11e3e0a321428b21fa0a064d959aa604c3b91500'
        '5bad6de56be821dcc1752aa8e0c0ba80f34dc72467c7aa30cb14bb3b63e1f92f7191b1fe5287a7453010ae87428687b2aa79c1c242cd0f3f6c8c8ca16f74eebb'
        '3fd196fd55ea9aeba406b7dbfa60e4c888e1cce7982f6ca35432161f9d523ec05d676925a33c07b4a140d26f9920677a9f70803c1696d085f61dd58950281876'
        '1e312d851baab7cb28387b3d2f61a292fb7048fb6df6e38124e252219b5ad33578c14966934828ccd01d88358784ce532796f87328ef2820deba057eaf0cfa34'
        'c438a7fb9d288ad0b498b8d1d7358f7109da974cfde4415789b2b0b1b185f858434f8fa5ac65dd962d938999509901e15c65c79f5f57dbdd2c3c9215bd7476dc'
        'b0b241137cbfa921ba6e9b37c47eafb989096278f37a71e5803dc20e6c94b136c0f5f416929c2088bb586627506e120caa4b33117d7017bb7c6a8c37dfc9f1df'
        'f629ccaa2cb7ce9beb6a207bbb3f959e168979fe496a130acc6072cb130d6487cceb5b2da6b95e137c94ae9cb05f58ffb9a42a842bbcfbbe4017a54f57e5f9cc'
        '6492b7d3a22cc479a0d180ae0d10335461780719f74b848f9fa323457b1963e4875a51b519f154a07925e727581961c17b2f36b76cfde2dc4f6c3bf9ae9cf494')

prepare() {
  [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
  cd gcc

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure


  if [ -n "$_use_patches" ]; then
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
    done
  fi

mkdir -p "$srcdir/gcc-build"

}

build() {

  cd gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  "$srcdir/gcc/configure" --prefix=/usr \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --mandir=/usr/share/man \
      --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++,d \
      --with-isl \
      --with-linker-hash-style=gnu \
      --with-system-zlib \
      --enable-__cxa_atexit \
      --enable-cet=auto \
      --enable-checking=release \
      --enable-clocale=gnu \
      --enable-default-pie \
      --enable-default-ssp \
      --enable-gnu-indirect-function \
      --enable-gnu-unique-object \
      --enable-install-libiberty \
      --enable-linker-build-id \
      --enable-lto \
      --enable-multilib \
      --enable-plugin \
      --enable-shared \
      --enable-threads=posix \
      --disable-libssp \
      --disable-libstdcxx-pch \
      --disable-libunwind-exceptions \
      --disable-werror \
      gdc_include_dir=/usr/include/dlang/gdc

  make

  # make documentation
  make -C $CHOST/libstdc++-v3/doc doc-man-doxygen
}

## SKIP FOR FASTER BUILDING ###
#check() {
#  cd gcc-build
#
#
#  # disable libphobos test to avoid segfaults and other unfunny ways to waste my time
#  sed -i '/maybe-check-target-libphobos \\/d' Makefile
#
#
#  # do not abort on error as some are "expected"
#  make -k check || true
#  "$srcdir/gcc/contrib/test_summary"
#}

package_gcc-libs-11() {
  pkgdesc='Runtime libraries shipped by GCC'
  depends=('glibc>=2.27')
  options+=(!strip)
  provides=(gcc-libs-multilib=${pkgver}-${pkgrel} libgo.so=${pkgver}-${pkgrel} libgfortran.so=${pkgver}-${pkgrel} libgphobos.so=${pkgver}-${pkgrel}
            libubsan.so=${pkgver}-${pkgrel} libasan.so=${pkgver}-${pkgrel} libtsan.so=${pkgver}-${pkgrel} liblsan.so=${pkgver}-${pkgrel} gcc-libs=${pkgver}-${pkgrel})
  conflicts=(gcc-libs)

  cd gcc-build
  make -C $CHOST/libgcc DESTDIR="$pkgdir" install-shared
  rm -f "$pkgdir/$_libdir/libgcc_eh.a"

  for lib in libatomic \
             libgfortran \
             libgo \
             libgomp \
             libitm \
             libquadmath \
             libsanitizer/{a,l,ub,t}san \
             libstdc++-v3/src \
             libvtv; do
    make -C $CHOST/$lib DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES
  done

  make -C $CHOST/libobjc DESTDIR="$pkgdir" install-libs
  make -C $CHOST/libstdc++-v3/po DESTDIR="$pkgdir" install

  make -C $CHOST/libphobos DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/$_libdir/include/d/
  rm -f "$pkgdir"/usr/lib/libgphobos.spec

  for lib in libgomp \
             libitm \
             libquadmath; do
    make -C $CHOST/$lib DESTDIR="$pkgdir" install-info
  done

  # remove files provided by lib32-gcc-libs
  rm -rf "$pkgdir"/usr/lib32/

  # Install Runtime Library Exception
  install -Dm644 "$srcdir/gcc/COPYING.RUNTIME" \
    "$pkgdir/usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION"
}

package_gcc-11() {
  pkgdesc="The GNU Compiler Collection - C and C++ frontends"
  depends=("gcc-libs=$pkgver-$pkgrel" 'binutils>=2.28' libmpc)
  groups=('base-devel')
  optdepends=('lib32-gcc-libs: for generating code for 32-bit ABI')
  provides=(gcc-multilib=${pkgver}-${pkgrel} gcc=${pkgver}-${pkgrel})
  conflicts=(gcc)
  options+=(staticlibs)

  cd gcc-build

  make -C gcc DESTDIR="$pkgdir" install-driver install-cpp install-gcc-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper

  install -m755 -t "$pkgdir/usr/bin/" gcc/gcov{,-tool}
  install -m755 -t "$pkgdir/${_libdir}/" gcc/{cc1,cc1plus,collect2,lto1}

  make -C $CHOST/libgcc DESTDIR="$pkgdir" install
  make -C $CHOST/32/libgcc DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/lib{,32}/libgcc_s.so*

  make -C $CHOST/libstdc++-v3/src DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/include DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/libsupc++ DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/python DESTDIR="$pkgdir" install
  make -C $CHOST/32/libstdc++-v3/src DESTDIR="$pkgdir" install
  make -C $CHOST/32/libstdc++-v3/include DESTDIR="$pkgdir" install
  make -C $CHOST/32/libstdc++-v3/libsupc++ DESTDIR="$pkgdir" install

  make DESTDIR="$pkgdir" install-libcc1
  install -d "$pkgdir/usr/share/gdb/auto-load/usr/lib"
  mv "$pkgdir"/usr/lib/libstdc++.so.6.*-gdb.py \
    "$pkgdir/usr/share/gdb/auto-load/usr/lib/"
  rm "$pkgdir"/usr/lib{,32}/libstdc++.so*

  make DESTDIR="$pkgdir" install-fixincludes
  make -C gcc DESTDIR="$pkgdir" install-mkheaders

  make -C lto-plugin DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir"/usr/lib/bfd-plugins/
  ln -s /${_libdir}/liblto_plugin.so \
    "$pkgdir/usr/lib/bfd-plugins/"

  make -C $CHOST/libgomp DESTDIR="$pkgdir" install-nodist_{libsubinclude,toolexeclib}HEADERS
  make -C $CHOST/libitm DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/libquadmath DESTDIR="$pkgdir" install-nodist_libsubincludeHEADERS
  make -C $CHOST/libsanitizer DESTDIR="$pkgdir" install-nodist_{saninclude,toolexeclib}HEADERS
  make -C $CHOST/libsanitizer/asan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/libsanitizer/tsan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/libsanitizer/lsan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/32/libgomp DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/32/libitm DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/32/libsanitizer DESTDIR="$pkgdir" install-nodist_{saninclude,toolexeclib}HEADERS
  make -C $CHOST/32/libsanitizer/asan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS

  make -C libiberty DESTDIR="$pkgdir" install
  install -m644 libiberty/pic/libiberty.a "$pkgdir/usr/lib"

  make -C gcc DESTDIR="$pkgdir" install-man install-info
  rm "$pkgdir"/usr/share/man/man1/{gccgo,gfortran,gdc}.1
  rm "$pkgdir"/usr/share/info/{gccgo,gfortran,gnat-style,gnat_rm,gnat_ugn,gdc}.info

  make -C libcpp DESTDIR="$pkgdir" install
  make -C gcc DESTDIR="$pkgdir" install-po

  # many packages expect this symlink
  ln -s gcc "$pkgdir"/usr/bin/cc

  # POSIX conformance launcher scripts for c89 and c99
  install -Dm755 "$srcdir/c89" "$pkgdir/usr/bin/c89"
  install -Dm755 "$srcdir/c99" "$pkgdir/usr/bin/c99"

  # install the libstdc++ man pages
  make -C $CHOST/libstdc++-v3/doc DESTDIR="$pkgdir" doc-install-man

  # remove files provided by lib32-gcc-libs
  rm -f "$pkgdir"/usr/lib32/lib{stdc++,gcc_s}.so

  # byte-compile python libraries
  python -m compileall "$pkgdir/usr/share/gcc-${pkgver%%+*}/"
  python -O -m compileall "$pkgdir/usr/share/gcc-${pkgver%%+*}/"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_gcc-fortran-11() {
  pkgdesc='Fortran front-end for GCC'
  depends=("gcc=$pkgver-$pkgrel")
  provides=(gcc-fortran-multilib=${pkgver}-${pkgrel} gcc-fortran=${pkgver}-${pkgrel})
  conflicts=(gcc-fortran)

  cd gcc-build
  make -C $CHOST/libgfortran DESTDIR="$pkgdir" install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS,gfor_cHEADERS}
  make -C $CHOST/32/libgfortran DESTDIR=$pkgdir install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS,gfor_cHEADERS}
  make -C $CHOST/libgomp DESTDIR="$pkgdir" install-nodist_fincludeHEADERS
  make -C gcc DESTDIR="$pkgdir" fortran.install-{common,man,info}
  install -Dm755 gcc/f951 "$pkgdir/${_libdir}/f951"

  ln -s gfortran "$pkgdir/usr/bin/f95"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_gcc-objc-11() {
  pkgdesc='Objective-C front-end for GCC'
  depends=("gcc=$pkgver-$pkgrel")
  provides=(gcc-objc-multilib=${pkgver}-${pkgrel} gcc-objc=${pkgver}-${pkgrel})
  conflicts=(gcc-objc)

  cd gcc-build
  make DESTDIR="$pkgdir" -C $CHOST/libobjc install-headers
  install -dm755 "$pkgdir/${_libdir}"
  install -m755 gcc/cc1obj{,plus} "$pkgdir/${_libdir}/"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_gcc-ada-11() {
  pkgdesc='Ada front-end for GCC (GNAT)'
  depends=("gcc=$pkgver-$pkgrel")
  provides=(gcc-ada-multilib=${pkgver}-${pkgrel} gcc-ada=${pkgver}-${pkgrel})
  conflicts=(gcc-ada)
  options+=(staticlibs)

  cd gcc-build/gcc
  make DESTDIR="$pkgdir" ada.install-{common,info}
  install -m755 gnat1 "$pkgdir/${_libdir}"

  cd "$srcdir"/gcc-build/$CHOST/libada
  make DESTDIR=${pkgdir} INSTALL="install" \
    INSTALL_DATA="install -m644" install-libada

  cd "$srcdir"/gcc-build/$CHOST/32/libada
  make DESTDIR=${pkgdir} INSTALL="install" \
    INSTALL_DATA="install -m644" install-libada

  ln -s gcc "$pkgdir/usr/bin/gnatgcc"

  # insist on dynamic linking, but keep static libraries because gnatmake complains
  mv "$pkgdir"/${_libdir}/adalib/libgna{rl,t}-${_majorver}.so "$pkgdir/usr/lib"
  ln -s libgnarl-${_majorver}.so "$pkgdir/usr/lib/libgnarl.so"
  ln -s libgnat-${_majorver}.so "$pkgdir/usr/lib/libgnat.so"
  rm -f "$pkgdir"/${_libdir}/adalib/libgna{rl,t}.so

  install -d "$pkgdir/usr/lib32/"
  mv "$pkgdir"/${_libdir}/32/adalib/libgna{rl,t}-${_majorver}.so "$pkgdir/usr/lib32"
  ln -s libgnarl-${_majorver}.so "$pkgdir/usr/lib32/libgnarl.so"
  ln -s libgnat-${_majorver}.so "$pkgdir/usr/lib32/libgnat.so"
  rm -f "$pkgdir"/${_libdir}/32/adalib/libgna{rl,t}.so

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_gcc-go-11() {
  pkgdesc='Go front-end for GCC'
  depends=("gcc=$pkgver-$pkgrel")
  provides=("go=1.12.2" gcc-go-multilib=${pkgver}-${pkgrel} gcc-go=${pkgver}-${pkgrel})
  conflicts=(go gcc-go)

  cd gcc-build
  make -C $CHOST/libgo DESTDIR="$pkgdir" install-exec-am
  make -C $CHOST/32/libgo DESTDIR="$pkgdir" install-exec-am
  make DESTDIR="$pkgdir" install-gotools
  make -C gcc DESTDIR="$pkgdir" go.install-{common,man,info}

  rm -f "$pkgdir"/usr/lib{,32}/libgo.so*
  install -Dm755 gcc/go1 "$pkgdir/${_libdir}/go1"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_lib32-gcc-libs-11() {
  pkgdesc='32-bit runtime libraries shipped by GCC'
  depends=('lib32-glibc>=2.27')
  provides=(libgo.so=${pkgver}-${pkgrel} libgfortran.so=${pkgver}-${pkgrel} libubsan.so=${pkgver}-${pkgrel} libasan.so=${pkgver}-${pkgrel} lib32-gcc-libs=${pkgver}-${pkgrel})
  conflicts=(lib32-gcc-libs)
  options=(!emptydirs !strip)

  cd gcc-build

  make -C $CHOST/32/libgcc DESTDIR="$pkgdir" install-shared
  rm -f "$pkgdir/$_libdir/32/libgcc_eh.a"

  for lib in libatomic \
             libgfortran \
             libgo \
             libgomp \
             libitm \
             libquadmath \
             libsanitizer/{a,l,ub}san \
             libstdc++-v3/src \
             libvtv; do
    make -C $CHOST/32/$lib DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES
  done

  make -C $CHOST/32/libobjc DESTDIR="$pkgdir" install-libs

  make -C $CHOST/libphobos DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/lib32/libgphobos.spec

  # remove files provided by gcc-libs
  rm -rf "$pkgdir"/usr/lib

  # Install Runtime Library Exception
  install -Dm644 "$srcdir/gcc/COPYING.RUNTIME" \
    "$pkgdir/usr/share/licenses/lib32-gcc-libs/RUNTIME.LIBRARY.EXCEPTION"
}

package_gcc-d-11() {
  pkgdesc="D frontend for GCC"
  depends=("gcc=$pkgver-$pkgrel")
  provides=(gdc=${pkgver}-${pkgrel} gcc-d=${pkgver}-${pkgrel})
  conflicts=(gcc-d)
  options=('staticlibs')

  cd gcc-build
  make -C gcc DESTDIR="$pkgdir" d.install-{common,man,info}

  install -Dm755 gcc/gdc "$pkgdir"/usr/bin/gdc
  install -Dm755 gcc/d21 "$pkgdir"/"$_libdir"/d21

  make -C $CHOST/libphobos DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/lib/"lib{gphobos,gdruntime}.so*
  rm -f "$pkgdir/usr/lib32/"lib{gphobos,gdruntime}.so*

  install -d "$pkgdir"/usr/include/dlang
  ln -s /"${_libdir}"/include/d "$pkgdir"/usr/include/dlang/gdc

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
