# Contributor: Procyon
# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Robson Peixoto
# Contributor: shiracha

pkgname=unzip-iconv
pkgver=6.0
pkgrel=9
pkgdesc="Unpacks .zip archives such as those made by PKZIP. With iconv patch for -O / -I goodness."
arch=('i686' 'x86_64')
url='http://www.info-zip.org/UnZip.html'
license=('custom::Info-ZIP')
depends=('bzip2'
         'bash')
provides=('unzip')
conflicts=('unzip')
source=("http://downloads.sourceforge.net/infozip/unzip${pkgver/./}.tar.gz"
        'CVE-2014-8139.patch::http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch' # https://bugzilla.redhat.com/attachment.cgi?id=990132
        'CVE-2014-8140.patch::http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch' # https://bugzilla.redhat.com/attachment.cgi?id=969621 (needs -Np0)
        'CVE-2014-8141.patch::http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch' # https://bugzilla.redhat.com/attachment.cgi?id=969625 (needs -Np0)
        'CVE-2014-9636.patch::http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/cve-2014-9636.patch'
        'CVE-2014-9913.patch::http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/18-cve-2014-9913-unzip-buffer-overflow.patch'
        'CVE-2016-9844.patch::http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/19-cve-2016-9844-zipinfo-buffer-overflow.patch'
        'iconv-utf8+CVE-2015-1315.patch::http://www.conostix.com/pub/adv/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch'
        'CVE-2015-7696.patch::http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch'
        'CVE-2015-7697.patch::http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch'
        'CVE-2018-18384.patch::http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/CVE-2018-18384.patch'
        'CVE-2018-1000035.patch::http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/0001-unzip-fix-CVE-2018-1000035.patch'
        'CVE-2019-13232_p1.patch::http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/CVE-2019-13232_p1.patch'
        'CVE-2019-13232_p2.patch::http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/CVE-2019-13232_p2.patch'
        'CVE-2019-13232_p3.patch::http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/CVE-2019-13232_p3.patch'
        'http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/fix-security-format.patch'
        'http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/symlink.patch'
        'http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/avoid-strip.patch'
        'http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/unzip/unzip/define-ldflags.patch'
        )
sha256sums=('036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37'
            'd628193875fd6881d8797cfc7fabda6ff21558550e830bd6aa9cefd49af5df15'
            'aea4d52e2a328a22674f030c27492592e8edaf945e77ea63240df296e902fdc1'
            'ae5b9f43dd5960cb4d40c639b6dc6ade34bba6dba62a7d8830657785964db1b1'
            'ccdbae7d75b135f2471964bc8314457959563658b2d410f3026e2cd9e1944a8f'
            '8eb5dedf36e37b986acc42d1a8b6701b7429d32e426a90f5b41d6004ffe0aa46'
            'bae6410203af2d5b32f427cba8dffe381b6f5adc52bf9f87a9655b3d2374f801'
            'e64c9ddb38c2e7d08bdb80c597f32ee960e18fbe8cb982e444b1ece03ac95cec'
            '78e99d6cdf3451498933c33732af6c2556e9a1e62abd906ff89011a6102e7da7'
            '5ce6d037ff9cd780f32cae67c4867ac59bfca3799ed01255f1d2b5b3afb9ddd0'
            '4598f0579b7c2cfef5a2698ecd4ed278d9a26ec808466fe0b31752b268e0cd3d'
            'a772cc9997aa9d99b67e1fc6facaf4d9249df8e721fc5cd7692be740441afaa9'
            '9252584a0a5fb288f424adf8ab430c40989b11259ec327b82b1a0cde31b29e69'
            '7c20c2889a17fd81c674b482c16e00159d64c6e5df357224461f4eb3a4e51c3d'
            '31a312410454738f994dc881c32b020b6051cfdf769bcc69f9f680428ea508fe'
            '035f179c634149158645bd54aa4bef270e7422af14e9693431e19a9219dbbeaa'
            'ac5e55017484f62381c86e81b462ddbf1cb09bd3282289cfe4df804788e14d20'
            '666a2f8cf805105c283aca5cd15089c97365d89d3d2561fe8057c9c2b99d12f7'
            '55a4f15716cdeb55275365a9d7446cf64150116ac6c8dd03ce6dd84466694f3d'
            )

prepare() {
  cd "unzip${pkgver/./}"

  patch -Np1 -i "${srcdir}/CVE-2014-8139.patch"                              # FS#43300
  patch -Np1 -i "${srcdir}/CVE-2014-8140.patch"                              # FS#43391
  patch -Np1 -i "${srcdir}/CVE-2014-8141.patch"                              # FS#43300
  patch -Np1 -i "${srcdir}/CVE-2014-9636.patch"                              # FS#44171
  patch -Np1 -i "${srcdir}/iconv-utf8+CVE-2015-1315.patch"                   # iconv patch + CEV 2015-1315 fix http://seclists.org/oss-sec/2015/q1/579
  patch -Np1 -i "${srcdir}/CVE-2015-7696.patch"                              # FS#46955
  patch -Np1 -i "${srcdir}/CVE-2015-7697.patch"                              # FS#46955
  patch -Np1 -i "${srcdir}/CVE-2018-18384.patch"
  patch -Np1 -i "${srcdir}/CVE-2018-1000035.patch"
  patch -Np1 -i "${srcdir}/CVE-2019-13232_p1.patch"
  patch -Np1 -i "${srcdir}/CVE-2019-13232_p2.patch"
  patch -Np1 -i "${srcdir}/CVE-2019-13232_p3.patch"
  patch -Np1 -i "${srcdir}/fix-security-format.patch"
  patch -Np1 -i "${srcdir}/symlink.patch"
  patch -Np1 -i "${srcdir}/avoid-strip.patch"
  patch -Np1 -i "${srcdir}/define-ldflags.patch"
}

build() {
  cd "unzip${pkgver/./}"

  # set CFLAGS -- from Debian
  DEFINES='-DACORN_FTYPE_NFS -DWILD_STOP_AT_DIR -DLARGE_FILE_SUPPORT \
           -DUNICODE_SUPPORT -DUNICODE_WCHAR -DUTF8_MAYBE_NATIVE -DNO_LCHMOD \
           -DDATE_FORMAT=DF_YMD -DUSE_BZIP2 -DNOMEMCPY -DNO_WORKING_ISPRINT'

  # make -- from Debian
  make -f unix/Makefile prefix=/usr \
  D_USE_BZ2=-DUSE_BZIP2 L_BZ2=-lbz2 \
  LF2="${LDFLAGS}" CF="${CFLAGS} ${CPPFLAGS} -I. ${DEFINES}" \
  unzips
}

package() {
  cd "unzip${pkgver/./}"

  # install -- from Debian
  make -f unix/Makefile prefix="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man/man\$(manext)" install

  # install the license file
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/unzip-iconv/LICENSE
}
