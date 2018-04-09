# Maintainer: Eduard Wirch <wirch.eduard@gmail.com>
# Contributor: Martin Lukes <martin.meridius@gmail.com>

_appname=smartgit
pkgname=${_appname}_preview
pkgver=18.1_rc_3
pkgrel=1
pkgdesc="Graphical Git client. Preview version."
arch=("any")
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
sha1sums=('13c116b1386e8572b42b8d13627ffb2eb8983055')

package() {
    cd "$srcdir"

    tar -xzf data.tar.gz -C "${pkgdir}"

    install -Dm644 "$pkgdir/usr/share/doc/$_appname/license.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
