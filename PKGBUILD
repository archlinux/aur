# Maintainer: Sherlock-Holo <sherlockya@gmail.com>

pkgname=ktproxy
pkgver=0.1
pkgrel=1
pkgdesc="a websocket like proxy by kotlin"
url="https://github.com/Sherlock-Holo/$pkgname"
arch=('x86_64' 'i686')
license=('MPL')
depends=('java-runtime>=9')
source=("https://github.com/Sherlock-Holo/ktproxy/releases/download/0.1/ktproxy-client.jar"
        "https://github.com/Sherlock-Holo/ktproxy/releases/download/0.1/ktproxy-server.jar"
        "ktproxy-client"
        "ktproxy-server"
        "ktproxy-client@.service"
        "ktproxy-server@.service")
md5sums=('dd5aefe44befca7c44056d3761f697e4'
         '168abbc4cb4c4a3f0cca7eb8d04e1ded'
         '03faf6ae95f1865fa42bcae69e9cf071'
         '79e2a773c9e1b7140b04c9de8bb84a17'
         '0d7a86dee623d84e4c4cabce9a2cfcbf'
         '79a4cc48053bcf5633ed647dbb20be44')

package(){
        mkdir -p $pkgdir/opt/ktproxy
        mkdir -p $pkgdir/usr/bin
        mkdir -p $pkgdir/usr/lib/systemd/system

        install -Dm644 $srcdir/ktproxy-{client,server}.jar $pkgdir/opt/ktproxy

        install -Dm755 $srcdir/ktproxy-{client,server} $pkgdir/usr/bin

        install -Dm644 $srcdir/ktproxy-{client,server}@.service $pkgdir/usr/lib/systemd/system
}
