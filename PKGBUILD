# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=tantrix
pkgver=2.11
pkgrel=4
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
        'tantrix-discovery'
        'tantrix-reviewer'
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
            'ffe1d19d00620d740057e310da59d7bdea1c1f143168d1d67af7d02475c78bc6'
            '912c25979fe244df68dddf273262dabde5517f696e6589df9ccf49c996aa3bc3'
            'a187bbc9e61825fad6af1f1586606f99142349417aba7473d3d6f20ccaaa53ad'
            'f492efa1e032bc4bd7c701e5c06c66619d23098cf1f2acafaed441ba4d8f30e0'
            '53ce6a8b2985e19a59b29241429e05c7b8ed1487a1bedbb341a4f157131fd802'
            '5580a63978e833d7ae4ad2492ef2b911afa4278a91738d277f418e5a62cdb340'
            '1fe5802975ac5579e2b9fc3c9ec50f2334b9ed1a22dfd1bb9fad251850f06661')
noextract=(*.jar)

package() {
  depends+=(java-runtime)
  install -Dm644 *.jar -t "$pkgdir"/usr/share/java/$pkgname
  install -Dm755 tantrix{,-discovery,-reviewer} -t "$pkgdir"/usr/bin
  install -Dm644 tantrix{,-discovery,-reviewer}.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 tantrix.png -t "$pkgdir"/usr/share/pixmaps
  install -Dm644 tantrix.xml -t "$pkgdir"/usr/share/mime/packages
}
