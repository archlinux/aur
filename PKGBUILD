# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=pacman-static
pkgver=5.1.1
_cares_ver=1.14.0
_nghttp2_ver=1.33.0
_curlver=7.61.1
_sslver=1.1.1
_xzver=5.2.4
_bzipver=1.0.6
_zstdver=1.3.5
_libarchive_ver=3.3.3
_gpgerrorver=1.32
_libassuanver=2.5.1
_gpgmever=1.11.1
_gnupgver=2.2.10
pkgrel=4
pkgdesc="Statically-compiled pacman (to fix or install systems without libc)"
arch=('i686' 'x86_64')
url="https://www.archlinux.org/pacman/"
license=('GPL')
depends=("pacman=${pkgver}")
options=('staticlibs')

# pacman
source=("https://sources.archlinux.org/other/pacman/pacman-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD'  # Allan McRae <allan@archlinux.org>
              'B8151B117037781095514CA7BBDFFC92306B1121') # Andrew Gregory (pacman) <andrew@archlinux.org>
# nghttp2
source+=("https://github.com/nghttp2/nghttp2/releases/download/v$_nghttp2_ver/nghttp2-$_nghttp2_ver.tar.xz")
# c-ares
source+=("https://c-ares.haxx.se/download/c-ares-${_cares_ver}.tar.gz"{,.asc})
validpgpkeys+=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg <daniel@haxx.se>
# curl
source+=("https://curl.haxx.se/download/curl-${_curlver}.tar.gz"{,.asc})
# openssl
source+=("https://www.openssl.org/source/openssl-${_sslver}.tar.gz"{,.asc}
         "ca-dir.patch")
validpgpkeys+=('8657ABB260F056B1E5190839D9C4D26D0E604491') # Matt Caswell <matt@openssl.org>
# xz
source+=("https://tukaani.org/xz/xz-${_xzver}.tar.gz"{,.sig})
validpgpkeys+=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org>
# bzip2
source+=("https://sources.archlinux.org/other/packages/bzip2/bzip2-${_bzipver}.tar.gz")
# zstd
source+=("zstd-${_zstdver}.tar.gz::https://github.com/facebook/zstd/archive/v${_zstdver}.tar.gz")
# libgpg-error
source+=("https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-${_gpgerrorver}.tar.bz2"{,.sig})
validpgpkeys+=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6'  # Werner Koch
               '031EC2536E580D8EA286A9F22071B08A33BD3F06') # NIIBE Yutaka (GnuPG Release Key) <gniibe@fsij.org>
# libassuan
source+=("https://gnupg.org/ftp/gcrypt/libassuan/libassuan-${_libassuanver}.tar.bz2"{,.sig})
# gpgme
source+=("https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-${_gpgmever}.tar.bz2"{,.sig})

# libarchive
source+=("libarchive-${_libarchive_ver}.tar.gz::https://github.com/libarchive/libarchive/archive/v${_libarchive_ver}.tar.gz")

sha512sums=('7112025dbd3e263c16f5b0ab34c9db3e8d631a0801bb086b47a2252d1764172261be6a14df1f24598c62935dcdfd74c89fa9d116deea41efb9e0f53dcadeb61c'
            'SKIP'
            'eeb0bf64fea115444c685c8a01c1017ce96be18adf88ffcdecad067de7012ca61c6b2b6a627b18e2572bba7bd77ec56a3ca4b1109f7a4b21220e8e28687b5b74'
            '30cd3f8c4eea15f994b2ceb44d84e506858f69f624e651e39bb4db523fea9ad5e8906b75abf07131ae364be19172274ed4053059669091f21ce4463cdbb857bf'
            'SKIP'
            '6469a3ff27623826bf29a9256ba730ae0a5135c20b27377027554e19ed26be6d0225db0101b60e7f12aa22d55eccaa53f4015414ef5736ee6002c6d780ed513f'
            'SKIP'
            'c0284a4fe84bdf765ca5bc5148da4441ffc36392cfecaf9d372af00cf93b6de5681cab1248b6f8246474532155dc205da5ad49549ad7c61c07c917145e7c9c71'
            'SKIP'
            '3857c298663728a465b5f95a3ef44547efbfb420d755e9dde7f20aa3905171b400e1c126d8db5c2b916c733bbd0724d8753cad16c9baf7b12dcd225a3ee04a97'
            'e5bf6eb88365d2dbdc774db49261fb9fae0544ed297891fc20f1ed223f4072cb0357cbd98146ac35b6d29410a12b6739bbd111cd57d4a225bef255ed46988578'
            'SKIP'
            '00ace5438cfa0c577e5f578d8a808613187eff5217c35164ffe044fbafdfec9e98f4192c02a7d67e01e5a5ccced630583ad1003c37697219b0f147343a3fdd12'
            'a5347b132d6b79e6a7f39a4546cafc5cf85e8d01b765477011008908035789e914b1093e2b2405c75086f05a7bc87e29b69e10252260d747c5c056ce16f91661'
            '0130af48fe81f4db401635757d22a330455aab5dc27edfffad44b7c7c5c439399e92d234c9e00f4d3a399646b52e06c95d53196ea19f5a166817e2032511cb20'
            'SKIP'
            'c8829925221780f175cee8c4084060b0d661229f583a50d400a1903ab7303b2724b99ff9c0fa242881d4c5d779036756e1da54d9143acc0fcd92f302ecb5882d'
            'SKIP'
            '42fa6f5d6217aaad9b44b969de9603167d179af9a1573342187718ff123cd88c686211c3dc5f2d9cacc20226ab5b8fef85cb66a19ada71d267c397d8ba52cf1a'
            'SKIP'
            '10063764b610c0c966ba0177cac0d2cb781e297a45545cc8a587741513089af26f40769670894c86e7985b73c47e9cb985253bc3bef3a12fa83fe2a6a30acb6d')

export LDFLAGS="$LDFLAGS -static"

prepare() {
    cd "${srcdir}"/libarchive-${_libarchive_ver}
    autoreconf -fi
}

build() {
    export PKG_CONFIG_PATH="${srcdir}"/temp/usr/lib/pkgconfig
    export PATH="${srcdir}/temp/usr/bin:${PATH}"

    # openssl
    cd "${srcdir}"/openssl-${_sslver}
    if [[ "${CARCH}" == 'x86_64' ]]; then
        openssltarget='linux-x86_64'
        optflags='enable-ec_nistp_64_gcc_128'
    elif [[ "${CARCH}" == 'i686' ]]; then
        openssltarget='linux-elf'
        optflags=''
    fi
    # mark stack as non-executable: http://bugs.archlinux.org/task/12434
    ./Configure --prefix="${srcdir}"/temp/usr \
                --openssldir=/etc/ssl \
                --libdir=lib \
                -static \
                no-ssl3-method \
                ${optflags} \
                "${openssltarget}" \
                "-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"
    make build_libs
    make install_dev

    # xz
    cd "${srcdir}"/xz-${_xzver}
    ./configure --prefix="${srcdir}"/temp/usr \
                --disable-shared
    cd src/liblzma
    make
    make install

    # bzip2
    cd "${srcdir}"/bzip2-${_bzipver}
    sed -i "s|-O2|${CFLAGS}|g" Makefile
    make libbz2.a
    install -Dvm644 bzlib.h "${srcdir}"/temp/usr/include/
    install -Dvm644 libbz2.a "${srcdir}"/temp/usr/lib/

    cd "${srcdir}"/zstd-${_zstdver}/lib
    make libzstd.a
    make PREFIX="${srcdir}"/temp/usr install-pc install-static install-includes

    # libarchive
    cd "${srcdir}"/libarchive-${_libarchive_ver}
    CPPFLAGS="-I${srcdir}/temp/usr/include" CFLAGS="-L${srcdir}/temp/usr/lib" \
        ./configure --prefix="${srcdir}"/temp/usr \
                    --without-xml2 \
                    --without-nettle \
                    --disable-{bsdtar,bsdcat,bsdcpio} \
                    --without-expat \
                    --disable-shared
    make
    make install-{includeHEADERS,libLTLIBRARIES,pkgconfigDATA,includeHEADERS}

    # nghttp2
    cd "${srcdir}"/nghttp2-${_nghttp2_ver}
    ./configure --prefix="${srcdir}"/temp/usr \
        --disable-shared \
        --disable-examples \
        --disable-python-bindings
    make -C lib
    make -C lib install

    # c-ares
    # needed for curl, which does not use it in the repos
    # but seems to be needed for static builds
    cd "${srcdir}"/c-ares-${_cares_ver}
    ./configure --prefix="${srcdir}"/temp/usr \
        --disable-shared
    make
    make install-{libcares_laHEADERS,libLTLIBRARIES,pkgconfigDATA}

    # curl
    cd "${srcdir}"/curl-${_curlver}
    # c-ares is not detected via pkg-config :(
    # https:// support segfaults, disable ssl for now
    ./configure --prefix="${srcdir}"/temp/usr \
                --disable-shared \
                --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
                --disable-{dict,gopher,imap,imaps,ldap,ldaps,manual,pop3,pop3s,rtsp,scp,sftp,smb,smbs,smtp,smtps,telnet,tftp} \
                --without-{brotli,libidn2,librtmp,libssh2} \
                --disable-libcurl-option \
                --with-ssl \
                --enable-ares="${srcdir}"/temp/usr
    make -C lib
    make install-pkgconfigDATA
    make -C lib install
    make -C include install

    # libgpg-error
    cd "${srcdir}"/libgpg-error-${_gpgerrorver}
    ./configure --prefix="${srcdir}"/temp/usr \
        --disable-shared
    make -C src
    make -C src install-libLTLIBRARIES install-binSCRIPTS install-nodist_includeHEADERS

    # libassuan
    cd "${srcdir}"/libassuan-${_libassuanver}
    ./configure --prefix="${srcdir}"/temp/usr \
        --disable-shared
    make -C src
    make -C src install-libLTLIBRARIES install-binSCRIPTS install-nodist_includeHEADERS

    # gpgme
    cd "${srcdir}"/gpgme-${_gpgmever}
    ./configure --prefix="${srcdir}"/temp/usr \
        --disable-fd-passing \
        --disable-shared \
        --disable-languages
    make -C src
    make -C src install-libLTLIBRARIES install-binSCRIPTS install-nodist_includeHEADERS

    # ew libtool
    rm "${srcdir}"/temp/usr/lib/lib*.la
    export PKG_CONFIG='pkg-config --static'

    # Finally, it's a pacman!
    # TODO: figure out why any pacman action that attempts to download things, segfaults
    cd "${srcdir}"/pacman-${pkgver}
    ./configure --prefix=/usr \
                --libdir=/usr/lib/pacman/lib \
                --sysconfdir=/etc \
                --localstatedir=/var \
                --program-suffix=-static \
                --with-scriptlet-shell=/usr/bin/bash \
                --with-ldconfig=/usr/bin/ldconfig \
                --disable-shared \
                --disable-doc
    make V=1 AM_LDFLAGS=-all-static
}



package() {
    cd "${srcdir}"/pacman-${pkgver}
    make -C lib/libalpm  DESTDIR="${pkgdir}" install-libLTLIBRARIES install-pkgconfigDATA
    make -C src/util  DESTDIR="${pkgdir}" install
    make -C src/pacman  DESTDIR="${pkgdir}" install-binPROGRAMS

    cp -a "${srcdir}"/temp/usr/{include,lib} "${pkgdir}"/usr/lib/pacman/
    sed -i "s@${srcdir}/temp/usr@/usr/lib/pacman@g" "${pkgdir}"/usr/lib/pacman/lib/pkgconfig/*.pc
}
