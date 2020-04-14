# Maintainer: Max Beikirch <max.beikirch (at) unitybox (dot) de>
pkgname=squash-git
pkgver=v0.7.0.r498.g713eeca
pkgrel=1
pkgdesc="tool for compression benchmarks"
arch=('x86_64')
url="https://quixdb.github.io/squash/"
license=('MIT')
depends=('ragel')
makedepends=('cmake' 'git')
source=("git+https://github.com/quixdb/squash.git"
        "git+https://github.com/nemequ/liblzf.git"
        "git+https://github.com/nemequ/doboz.git"
        "git+https://github.com/svn2github/fastlz.git"
        "git+https://github.com/nemequ/lzjb.git"
        "git+https://github.com/tinycthread/tinycthread.git"
        "git+https://github.com/davidcatt/FastARI.git"
        "git+https://github.com/google/gipfeli.git"
        "git+https://github.com/richgel999/lzham_codec_devel.git"
        "git+https://github.com/google/brotli.git"
        "git+https://github.com/zpaq/zpaq.git"
        "git+https://github.com/richox/libzling.git"
        "git+https://github.com/Cyan4973/zstd.git"
        "git+https://github.com/coderforlife/ms-compress.git"
        "git+https://github.com/IlyaGrebnov/libbsc.git"
        "git+https://github.com/centaurean/density.git"
        "git+https://bitbucket.org/tkatchev/yalz77"
        "git+https://github.com/fusiyuan2010/CSC.git"
        "git+https://github.com/nemequ/bzip2.git"
        "git+https://github.com/nemequ/lzo.git"
        "git+https://github.com/google/snappy.git"
        "git+https://github.com/madler/zlib.git"
        "git+http://git.tukaani.org/xz.git"
        "git+https://github.com/Cyan4973/lz4.git"
        "git+https://github.com/ShaneWF/wflz.git"
        "git+https://github.com/mbitsnbites/liblzg.git"
        "git+https://github.com/Dead2/zlib-ng.git"
        "git+https://github.com/jibsen/brieflz.git"
        "git+https://github.com/atomicobject/heatshrink.git"
        "git+https://github.com/ebiggers/libdeflate.git"
        "git+https://github.com/jibsen/parg.git"
        "git+https://github.com/win-iconv/win-iconv"
        "git+https://github.com/richgel999/miniz.git"
        "git+https://github.com/nemequ/munit.git"
        "git+https://github.com/lzfse/lzfse.git"
        "git+https://github.com/nemequ/hedley.git")


md5sums=('SKIP'
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
         'SKIP'
         'SKIP'
         'SKIP'
)

pkgver() {
    cd "${srcdir}/squash"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
    cd "${srcdir}/squash"
    git submodule init
    git config submodule."plugins/lzf/liblzf".url "${srcdir}/liblzf"
    git config submodule."plugins/doboz/doboz".url "${srcdir}/doboz"
    git config submodule."plugins/fastlz/fastlz".url "${srcdir}/fastlz"
    git config submodule."plugins/lzjb/lzjb".url "${srcdir}/lzjb"
    git config submodule."squash/tinycthread".url "${srcdir}/tinycthread"
    git config submodule."plugins/fari/FastARI".url "${srcdir}/FastARI"
    git config submodule."plugins/gipfeli/gipfeli".url "${srcdir}/gipfeli"
    git config submodule."plugins/lzham/lzham".url "${srcdir}/lzham_codec_devel"
    git config submodule."plugins/brotli/brotli".url "${srcdir}/brotli"
    git config submodule."plugins/zpaq/zpaq".url "${srcdir}/zpaq"
    git config submodule."plugins/zling/libzling".url "${srcdir}/libzling"
    git config submodule."plugins/zstd/zstd".url "${srcdir}/zstd"
    git config submodule."plugins/ms-compress/ms-compress".url "${srcdir}/ms-compress"
    git config submodule."plugins/bsc/libbsc".url "${srcdir}/libbsc"
    git config submodule."plugins/density/density".url "${srcdir}/density"
    git config submodule."plugins/yalz77/yalz77".url "${srcdir}/yalz77"
    git config submodule."plugins/csc/csc".url "${srcdir}/CSC"
    git config submodule."plugins/bzip2/bzip2".url "${srcdir}/bzip2"
    git config submodule."plugins/lzo/lzo".url "${srcdir}/lzo"
    git config submodule."plugins/snappy/snappy".url "${srcdir}/snappy"
    git config submodule."plugins/zlib/zlib".url "${srcdir}/zlib"
    git config submodule."plugins/lzma/xz".url "${srcdir}/xz"
    git config submodule."plugins/lz4/lz4".url "${srcdir}/lz4"
    git config submodule."plugins/wflz/wflz".url "${srcdir}/wflz"
    git config submodule."plugins/lzg/liblzg".url "${srcdir}/liblzg"
    git config submodule."plugins/zlib-ng/zlib-ng".url "${srcdir}/zlib-ng"
    git config submodule."plugins/brieflz/brieflz".url "${srcdir}/brieflz"
    git config submodule."plugins/heatshrink/heatshrink".url "${srcdir}/heatshrink"
    git config submodule."plugins/libdeflate/libdeflate".url "${srcdir}/libdeflate"
    git config submodule."utils/parg".url "${srcdir}/parg"
    git config submodule."squash/win-iconv".url "${srcdir}/win-iconv"
    git config submodule."plugins/miniz/miniz".url "${srcdir}/miniz"
    git config submodule."tests/munit".url "${srcdir}/munit"
    git config submodule."plugins/lzfse/lzfse".url "${srcdir}/lzfse"
    git config submodule."squash/hedley".url "${srcdir}/hedley"
    git submodule update

    ./autogen.sh --prefix=/usr
}

build() {
    cd "${srcdir}/squash"

    make
}

package() {
    cd "${srcdir}/squash"

    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
