# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=pacman-static
pkgver=5.1.0
_cares_ver=1.14.0
_nghttp2_ver=1.31.1
_curlver=7.57.0
_sslver=1.1.0h
_xzver=5.2.4
_bzipver=1.0.6
_libarchive_ver=3.3.2
_gpgerrorver=1.31
_libassuanver=2.5.1
_gpgmever=1.11.1
_gnupgver=2.2.7
pkgrel=1
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
source+=("http://www.bzip.org/${_bzipver}/bzip2-${_bzipver}.tar.gz")
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

sha512sums=('0c5148e97b63e7c0ea1a6b1f5212360c6ce65a26a5a9b935de2e93595efca01e5716dc3167f336926c9a1ba03c395667fc67a99fea926b74d81bfc795f0d5abe'
            'SKIP'
            'e0f5b345b6d794b21fa04bc0c7125f24a877074538ad746451d4a293eb22f1afb9e0e619c69b84f0fc2142a925044a19976af4cffb8426358e95e7d9715d5a4f'
            '30cd3f8c4eea15f994b2ceb44d84e506858f69f624e651e39bb4db523fea9ad5e8906b75abf07131ae364be19172274ed4053059669091f21ce4463cdbb857bf'
            'SKIP'
            '1ce8138c708965d29628f9b3e37cb9cb5c586f82f42091d5e60ba66ddcebcd55dba874c5d903365af0ef94c5c1679430bdd8c0cefbffdf5f7f347d9055824648'
            'SKIP'
            'fb7750fcd98e6126eb5b92e7ed63d811a5cfa3391d98572003d925f6c7b477690df86a9aa1fa6bf6bf33d02c6c7aee6cff50a38faa8911409f310645898fda39'
            'SKIP'
            '3857c298663728a465b5f95a3ef44547efbfb420d755e9dde7f20aa3905171b400e1c126d8db5c2b916c733bbd0724d8753cad16c9baf7b12dcd225a3ee04a97'
            'e5bf6eb88365d2dbdc774db49261fb9fae0544ed297891fc20f1ed223f4072cb0357cbd98146ac35b6d29410a12b6739bbd111cd57d4a225bef255ed46988578'
            'SKIP'
            '00ace5438cfa0c577e5f578d8a808613187eff5217c35164ffe044fbafdfec9e98f4192c02a7d67e01e5a5ccced630583ad1003c37697219b0f147343a3fdd12'
            '23983470be51035b2bc0cdbfa20f0915aec92c53c964c645eac51ba4e992b8436bd3a21f0b48d77d7c4ef178d2aacaf57ab33c7fad24b4f96f4ffb1d7116e67f'
            'SKIP'
            'c8829925221780f175cee8c4084060b0d661229f583a50d400a1903ab7303b2724b99ff9c0fa242881d4c5d779036756e1da54d9143acc0fcd92f302ecb5882d'
            'SKIP'
            '42fa6f5d6217aaad9b44b969de9603167d179af9a1573342187718ff123cd88c686211c3dc5f2d9cacc20226ab5b8fef85cb66a19ada71d267c397d8ba52cf1a'
            'SKIP'
            '7bc17d6f742080278e35f86b0233d70045df0ca1578cd427126e0acce183709bf33ecca689db65e2e67bdfaf687c04d36cae1202a926beeebc88076648aa40bc')

export LDFLAGS="$LDFLAGS -static"

prepare() {
    cd "${srcdir}"/libarchive-${_libarchive_ver}
    autoreconf -fi
}

build() {
    export PKG_CONFIG_PATH="${srcdir}"/temp/usr/lib/pkgconfig

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
                no-shared \
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
    # c-ares/openssl is not detected via pkg-config :(
    ./configure --prefix="${srcdir}"/temp/usr \
                --disable-shared \
                --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
                --disable-{dict,file,gopher,imap,imaps,ldap,ldaps,manual,pop3,pop3s,rtsp,scp,sftp,smb,smbs,smtp,smtps,telnet,tftp} \
                --without-{brotli,libidn2,librtmp,libssh2} \
                --disable-libcurl-option \
                --with-openssl="${srcdir}"/temp/usr \
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

    # Finally, it's a pacman!
    # TODO: figure out why any pacman action that attempts to download things, segfaults
    cd "${srcdir}"/pacman-${pkgver}
    export PATH="${srcdir}/temp/usr/bin:${PATH}"
    ./configure --prefix=/usr \
                --libdir=/usr/lib/pacman/lib \
                --sysconfdir=/etc \
                --localstatedir=/var \
                --with-scriptlet-shell=/usr/bin/bash \
                --with-ldconfig=/usr/bin/ldconfig \
                --disable-shared \
                --disable-doc
    make V=1 AM_LDFLAGS=-all-static
}



package() {
    cd "${srcdir}"/pacman-${pkgver}
    make DESTDIR="${pkgdir}" install

    for f in "${pkgdir}"/usr/bin/*; do
        if file "${f}" | grep -q ELF; then
            mv "${f}" "${f}-static"
        else
            rm "${f}"
        fi
    done

    cp -a "${srcdir}"/temp/usr/{include,lib} "${pkgdir}"/usr/lib/pacman/
    sed -i "s@${srcdir}/temp/usr@/usr/lib/pacman@g" "${pkgdir}"/usr/lib/pacman/lib/pkgconfig/*.pc

    rm -rf "${pkgdir}"/{etc,usr/include,usr/share,var}
}
