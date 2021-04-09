# Maintainer: necklace <ns@nsz.no>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=jcadencii
pkgver=3.3.9+svn20110818.r1732
pkgrel=6
pkgdesc="Piano roll editor for singing synthesis, supporting VOCALOID, VOCALOID2, UTAU, WORLD, AquesTone synthesis engines"
arch=('any')
url="https://packages.debian.org/sid/main/jcadencii"
license=('GPL3')
depends=('java-environment')
optdepends=('wine')
provides=('cadencii')
source=("https://ftp.debian.org/debian/pool/main/c/cadencii/jcadencii_${pkgver}-6.1_all.deb"
        "${pkgname}.desktop")
sha256sums=('e2c95d0320880fd889d1b4446b9985d30f418306388bd841d9f7d636424f1692'
            'd28d0cd76773cdde3a7ab4ff007df6ac099dd900aaca1e4bae85ac4906a4370b')

package() {
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp "$pkgdir/usr/share/doc/jcadencii/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
