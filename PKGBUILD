# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Jupotter <jupotter.g@gmail.com>
# Contributor: KillaB <xGenoBlast@gmail.com>
# Contributor: wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: Nick <nick@screamingfist.org>

pkgname=drl
replaces=(doomrl)
pkgver=0.10.0e
pkgrel=1
pkgdesc="A roguelike game based on the FPS Doom."
arch=('i686' 'x86_64')
url="http://drl.chaosforge.org/"
license=('GPL' 'CCPL:cc-by-nc-sa-4.0')
depends=('glu' 'lua' 'sdl2_image' 'sdl2_mixer' 'zlib')
makedepends=('ffmpeg')

source=(
    'cc-by-nc-sa-4.0.txt'
    'drl.sh'
    "https://github.com/chaosforgeorg/doomrl/releases/download/${pkgver//./_}/drl-linux-0100.tar.gz"
)

sha256sums=('bae5ccc863235f984a52c07d011e48a86c0c12f923be2dedd8624c7abdc22c6c'
            '4c4b691be85976158a6157b4f8e0af62e4ec2bffe3d94db6ddb996ef88fb03bd'
            '367ca7ba3074cff4de429cafb76bfd023685e3a5b3d70fd80f6540368879c1d9')
sha512sums=('17d175621ac081cd1e5fee3ae720ba8d638588f3f0b505561308f4ab3eebefe2630049917abf6963fb3d28c35a175fffc40dfe74a5da8a6859e8fd5753e65d95'
            '433f83652a0f337e11897c3439bac95ca2239ef53e7392bd87ef7264465eb44933a91a1feecd6d4d708005df5072247c5b3ebe21a5be6ade79f10b69799d4e88'
            '8a977c789c062c87f0ed56d416aaeea3a14c1db431e5bd475ea94a06a272e1ee994334af3d719a9a83e6aad4722bb54c275bfdbbfff5fb0c196637e70895d310')
b2sums=('22d19b6fb9b5542757297b6c5a61b32aff35ba11033d32a43fc52828ba1f17fce714772c9e1df864e7646729122b2f5eb136aa323552a0867c795cff4400b39a'
        '2a12085ba40b5c8cf043428296ed397fe06548bcecdfc4a622b29fb6e90be7cf146d7796180dd34fc12924bcc55b32bd5dccab03cc0b453e9b34405ec0abc585'
        '3c0ebd8ca7e6ad08ad48fede6130b388a5fe396ec6b21de84942ad1981d673c1e0f056faca7ed4ee64077778c8a4de3769a86a6f9b978f4394fbe5c9402d76d5')

package() {
    cd "$srcdir/drl-linux-0100"

    # Copy program and required files
    install -d "$pkgdir/usr/share/drl"
    cp -a * "$pkgdir/usr/share/drl"

    # Copy script used to run program
    install -D -m755 "$srcdir/drl.sh" "$pkgdir/usr/bin/drl"

    # Copy the license file
    install -D -m644 "$srcdir/cc-by-nc-sa-4.0.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/cc-by-nc-sa-4.0.txt"
}
