# Maintainer: Sherlock-Holo <sherlockya@gmail.com>

pkgname=ktproxy
release=0.2
pkgver=${release}_beta
pkgrel=1
pkgdesc="a websocket like proxy by kotlin"
url="https://github.com/Sherlock-Holo/$pkgname"
arch=('x86_64' 'i686')
license=('MPL')
depends=('java-runtime>=9')
source=("https://github.com/Sherlock-Holo/ktproxy/releases/download/$release/ktproxy-client.jar"
        "https://github.com/Sherlock-Holo/ktproxy/releases/download/$release/ktproxy-server.jar"
        "https://raw.githubusercontent.com/Sherlock-Holo/ktproxy/master/src/main/kotlin/ktproxy/config/config.toml"
        "ktproxy-client"
        "ktproxy-server"
        "ktproxy-client@.service"
        "ktproxy-server@.service")
md5sums=('97c061c54cb028cecc3f4c93edf7e7b5'
         '8fa7115156115d49f28185cfa932f06a'
         '9aae34cd6aa70f6a0a93705bdd4f4985'
         '5ef7f416a6c7e222b8fa29fd5ed81147'
         '7460ce881efa6b52076f8d7bbf3d5a86'
         '0d7a86dee623d84e4c4cabce9a2cfcbf'
         '79a4cc48053bcf5633ed647dbb20be44')

package(){
        mkdir -p $pkgdir/opt/ktproxy
        mkdir -p $pkgdir/usr/bin
        mkdir -p $pkgdir/usr/lib/systemd/system
        mkdir -p $pkgdir/etc/ktproxy

        install -Dm644 $srcdir/config.toml $pkgdir/etc/ktproxy/example.toml

        install -Dm644 $srcdir/ktproxy-{client,server}.jar $pkgdir/opt/ktproxy

        install -Dm755 $srcdir/ktproxy-{client,server} $pkgdir/usr/bin

        install -Dm644 $srcdir/ktproxy-{client,server}@.service $pkgdir/usr/lib/systemd/system
}
