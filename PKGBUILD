# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Fabio 'Feanor' Falcinelli <fabio.falcinelli@gmail.com>

pkgname=nemerle
pkgver=1.2.507.0
pkgrel=1
_build=272
pkgdesc="A high-level statically-typed programming language for the .NET platform."
url="http://www.nemerle.org"
license=("nemerle")
depends=('mono')
arch=('i686' 'x86_64')
source=(
"http://nemerle.org/Download/Nightly%20master-NET40-VS2010/build-${_build}/NemerleBinaries-net-4.0-v${pkgver}.zip"
"https://raw.github.com/rsdn/nemerle/v1.2/License.rtf"
"ncc"
"nemish"
)
md5sums=('038ae2cce87d67b7a27619c0d352236e'
         'f28530ac505daf378a44af822b25f7f5'
         '0bc83af0aac196f43c8f0907b64625bb'
         '87b26931a597f99bb0aca67a82cafc0a')

package() {
    cd ${srcdir}

    install -d -m755 "${pkgdir}/opt/nemerle"

    ls . | grep -v "NemerleBinaries-net-4.0-v${pkgver}.zip\|License.rtf" | xargs cp -v -t "${pkgdir}/opt/nemerle"

    install -D -m755 "${srcdir}/ncc" "${pkgdir}/usr/bin/ncc"
    install -D -m755 "${srcdir}/nemish" "${pkgdir}/usr/bin/nemish"
    install -D -m644 "${srcdir}/License.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/License.rtf"
}
