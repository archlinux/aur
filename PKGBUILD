# Maintainer: Sherlock-Holo <sherlockya@gmail.com>

pkgname=ktproxy
pkgver=0.1
pkgrel=3
pkgdesc="a websocket like proxy by kotlin"
url="https://github.com/Sherlock-Holo/$pkgname"
arch=('x86_64' 'i686')
license=('MPL')
depends=('java-runtime>=9')
source=("https://github.com/Sherlock-Holo/ktproxy/releases/download/0.1/ktproxy-client.jar"
        "https://github.com/Sherlock-Holo/ktproxy/releases/download/0.1/ktproxy-server.jar"
        "https://raw.githubusercontent.com/Sherlock-Holo/ktproxy/5891990e35f24c62342fa566550a5482a02cfc88/src/main/kotlin/ktproxy/config/config.toml"
        "ktproxy-client"
        "ktproxy-server"
        "ktproxy-client@.service"
        "ktproxy-server@.service")
md5sums=('dd5aefe44befca7c44056d3761f697e4'
         '168abbc4cb4c4a3f0cca7eb8d04e1ded'
         '9aae34cd6aa70f6a0a93705bdd4f4985'
         '2e3242536d6b6f01a4c3b9361e828f1f'
         '86329c4b8866a02a3398663bdd9b73f2'
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
