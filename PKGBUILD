
# Maintainer: Eduard Wirch <wirch.eduard@gmail.com>
# Contributor: Martin Lukes <martin.meridius@gmail.com>

_appname=smartgit
pkgname=${_appname}_preview
pkgver=18.2_rc_1
pkgrel=1
pkgdesc="Graphical Git client. Preview version."
arch=("x86_64")
url="https://www.syntevo.com/smartgit/preview/"
license=('custom')
depends=("java-environment>=8" "python3" "bash")
optdepends=("mercurial: hg repositories support"
            "git: git repositories support")
makedepends=("tar")
replaces=("smartgithg")
conflicts=("smartgit")
provides=("smartgit")

# package version as it appears in the name of tar.gz archive file
_pkgver=${pkgver//_/-}
_pkgver=${_pkgver//./_}

source=("https://www.syntevo.com/downloads/smartgit/${_appname}-${_pkgver}.deb")
sha1sums=('23e14c7d2bb2155ce9d3de6224d0ab5c4fea4b55')

package() {
    cd "$srcdir"

    tar -xzf data.tar.gz -C "${pkgdir}"

    install -Dm644 "$pkgdir/usr/share/doc/$_appname/license.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
