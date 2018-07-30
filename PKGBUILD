
# Maintainer: Eduard Wirch <wirch.eduard@gmail.com>
# Contributor: Martin Lukes <martin.meridius@gmail.com>

_appname=smartgit
pkgname=${_appname}_preview
pkgver=18.2_preview_2
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
sha1sums=('edb974ee1496beb3756c8ddac54208da65c3541e')

package() {
    cd "$srcdir"

    tar -xzf data.tar.gz -C "${pkgdir}"

    install -Dm644 "$pkgdir/usr/share/doc/$_appname/license.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
