# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=tantrix
pkgver=2.12a
pkgrel=1
pkgdesc='Abstract strategy board game'
arch=(any)
url='https://www.tantrix.com/'
license=(unknown)
depends=()
makedepends=()
_base='https://www.tantrix.com/Tantrix/TGame'
source=("$_base/jws/Launcher.jar"
        "$_base/jws/OnlineLobby.jar"
        "$_base/jws/OnlineGame.jar"
        "$_base/jws/Sounds.jar"
        "$_base/jws/jzlib.jar"
        "$_base/jws/Monte.jar"
        "$_base/jws/Oliver.jar"
        "$_base/jws/Darwin.jar"
        "tantrix.png::$_base/smalltile.png"
        'tantrix'
        'tantrix.desktop'
        'tantrix-discovery.desktop'
        'tantrix-reviewer.desktop'
        'tantrix.xml')
sha256sums=('a05b7d6b78c803d95ff1fc0c83f17f8d2d08462fdd105a5a39ba82a9fe7e3368'
            'd05c573d4c2edc349124f55ff8ee53427197a6b73f60ceb93f681057b1335465'
            '79c90114b21bcd58aff3a1d8f44c81cf6a80cec5b84dd48c25400abbb91c0c12'
            'ffa17c8eadf75020abd81a82ff5799c9e132e97b18e45d9455a6aed74481aeab'
            '91d9dcdad49430996a745675b11757ed3dc844f4edce9f5cc210be86b0fa032f'
            '50534099b86ec25242141cc5d1fd38187553cabdb3420e898b5fd53caa6866f8'
            '439795e84ddf9d98911e96dfed17edd14512a5a8126d3c08aea0e9cfd3e5315a'
            'd5d79332e7048c4fd4b846b04bf6ebeeb5ef529184db6d82346cfb9941bd8c73'
            'a244a49a541adef4840c8a4e7941c79deeb02213588e7d472ed7f0fbdade01aa'
            '7aa41d4cb87bfc19f4c3f04370c7343fbb0f1e3dae6c063b66398715b77aadaf'
            'f492efa1e032bc4bd7c701e5c06c66619d23098cf1f2acafaed441ba4d8f30e0'
            '593cd009514144534b15bebe36c8e393adbfbbd63eac054eea54f20e1c362621'
            '5f8a776872a98933c5f0c7681d5cc3606b3a84290235a909d46fe2e1a1f4eb48'
            '1fe5802975ac5579e2b9fc3c9ec50f2334b9ed1a22dfd1bb9fad251850f06661')
noextract=(*.jar)

package() {
  depends+=(java-runtime)
  install -Dm644 *.jar -t "$pkgdir"/usr/share/java/$pkgname
  install -Dm755 tantrix -t "$pkgdir"/usr/bin
  install -Dm644 tantrix{,-discovery,-reviewer}.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 tantrix.png -t "$pkgdir"/usr/share/pixmaps
  install -Dm644 tantrix.xml -t "$pkgdir"/usr/share/mime/packages
}
