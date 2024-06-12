# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=tantrix
pkgver=2.11
pkgrel=5
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
sha256sums=('df143c0f02b27c002af4152124f066a477ade59c9b56822e6eef9abf2ff86a92'
            '4e06d81cdf394255d1c1be15f66473e056bee03d997f45c8c8fd36fe5081161e'
            '21c8bd48fa969818be1d39524376a3e71c904c76cc7c2b0d1a859374ec3a5521'
            '27f44f4f94bb57f8ed2f1a3c690467b3e24641fd11e198d15ebce7296d60784e'
            '2b99b869b68b1486bedc46807bdf7ec0734022abdfa7c09792bb680c54409449'
            '9ce9dec26d6092d1143cfe5f430e4d37f920cc8c7ad6ac4ea6d50a2ff5d2c07b'
            '9a29532e5e3f56b592ba8eabc8078560cd2cf7686ce8bde838f5de86a02d844a'
            '2955140987a4ec6a67d2f6bccdc57fa19f272fb1e971cb0537909e2a60e7d82e'
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
