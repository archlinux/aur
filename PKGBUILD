#Maintainer truh <truhgoj[äT]truh(O)in>

pkgname=aerospike-server-ce
pkgver=3.10.1
pkgrel=1
pkgdesc="High performance NoSQL database"
arch=('x86_64' 'i686')
url="http://www.aerospike.com/"
license=('AGPLv3')
source=("http://artifacts.aerospike.com/aerospike-server-community/3.10.1/aerospike-server-community-3.10.1.tar.gz")

sha512sums=('e3301f4a58dae5fa7e2e04d6ac11b03369254444e824b406182838ad0343fa338457a8117da296b817246f2c8c6ca231b612ecd55ce78bb2db40861045bcf2ca')

#prepare() {}

#build() {}

package() {
    mkdir -p -m 755 "${pkgdir}/usr/bin/"
    mkdir -p -m 755 "${pkgdir}/usr/share/bin/"
    mkdir -p -m 755 "${pkgdir}/usr/share/etc/"
    mkdir -p -m 755 "${pkgdir}/usr/share/lib/"
    mkdir -p -m 755 "${pkgdir}/usr/share/libexec/"
    mkdir -p -m 755 "${pkgdir}/usr/share/udf/lua/external/"
    mkdir -p -m 755 "${pkgdir}/usr/share/udf/lua/ldt/"

    cd $srcdir/aerospike-server

    install -Dm755 bin/aerospike "${pkgdir}/usr/bin/aerospike"
    install -Dm755 bin/asd "${pkgdir}/usr/bin/asd"

    install -Dm755 share/bin/aerospike "${pkgdir}/usr/share/bin/aerospike"
    
    install -Dm644 share/etc/aerospike.conf "${pkgdir}/usr/share/etc/aerospike.conf"
    
    install -Dm644 share/lib/aerospike-render.py "${pkgdir}/usr/share/lib/aerospike-render.py"
    
    install -Dm755 share/libexec/aerospike-destroy "${pkgdir}/usr/share/libexec/aerospike-destroy"
    install -Dm755 share/libexec/aerospike-init "${pkgdir}/usr/share/libexec/aerospike-init"
    install -Dm755 share/libexec/aerospike-restart "${pkgdir}/usr/share/libexec/aerospike-restart"
    install -Dm755 share/libexec/aerospike-start "${pkgdir}/usr/share/libexec/aerospike-start"
    install -Dm755 share/libexec/aerospike-status "${pkgdir}/usr/share/libexec/aerospike-status"
    install -Dm755 share/libexec/aerospike-stop "${pkgdir}/usr/share/libexec/aerospike-stop"

    # TODO man pages

    install -Dm755 share/udf/lua/external/llist.lua "${pkgdir}/usr/share/udf/lua/external/llist.lua"
    install -Dm755 share/udf/lua/external/lmap.lua "${pkgdir}/usr/share/udf/lua/external/lmap.lua"
    install -Dm755 share/udf/lua/external/lset.lua "${pkgdir}/usr/share/udf/lua/external/lset.lua"
    install -Dm755 share/udf/lua/external/lstack.lua "${pkgdir}/usr/share/udf/lua/external/lstack.lua"

    install -Dm755 share/udf/lua/ldt/CRC32.lua "${pkgdir}/usr/share/udf/lua/ldt/CRC32.lua"
    install -Dm755 share/udf/lua/ldt/ldt_common.lua "${pkgdir}/usr/share/udf/lua/ldt/ldt_common.lua"
    install -Dm755 share/udf/lua/ldt/ldt_errors.lua "${pkgdir}/usr/share/udf/lua/ldt/ldt_errors.lua"
    install -Dm755 share/udf/lua/ldt/lib_llist.lua "${pkgdir}/usr/share/udf/lua/ldt/lib_llist.lua"
    install -Dm755 share/udf/lua/ldt/lib_lmap.lua "${pkgdir}/usr/share/udf/lua/ldt/lib_lmap.lua"
    install -Dm755 share/udf/lua/ldt/lib_lset.lua "${pkgdir}/usr/share/udf/lua/ldt/lib_lset.lua"
    install -Dm755 share/udf/lua/ldt/lib_lstack.lua "${pkgdir}/usr/share/udf/lua/ldt/lib_lstack.lua"

    install -Dm755 share/udf/lua/aerospike.lua "${pkgdir}/usr/share/udf/lua/aerospike.lua"
    install -Dm755 share/udf/lua/as.lua "${pkgdir}/usr/share/udf/lua/as.lua"
    install -Dm755 share/udf/lua/stream_ops.lua "${pkgdir}/usr/share/udf/lua/stream_ops.lua"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
