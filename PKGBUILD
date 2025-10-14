# Maintainer: Lukas Tobler <luk4s.tobler@gmail.com>

pkgname=scyther
pkgver=v1.2.1
pkgrel=3
pkgdesc="Tool for the symbolic analysis of security protocols"
arch=('x86_64')
depends=('python' 'graphviz' 'python-wxpython')
url="https://www.cs.ox.ac.uk/people/cas.cremers/scyther/"
license=('GPL2')
source=(
    "http://www.cs.ox.ac.uk/people/cas.cremers/downloads/scyther/scyther-linux-${pkgver}.tgz"
    'scyther.desktop'
    'scyther'
)
sha256sums=('266324f77bd8102ae96b0e884ba705ca17adaff4e75727e59e164b097d7426ff'
            'd3bc8366a76892d47252c517246310e76e8e14af7856fb85a89b7e1de1c9dc07'
            'd744b78f244d11b4d3a1786709824c0c8432b50f68bfbbcbf3afc736acadb765')

package() {
    mkdir -p ${pkgdir}/usr/share/
    cp -dr --no-preserve=ownership ${srcdir}/${pkgname}-linux-${pkgver} ${pkgdir}/usr/share/${pkgname}
    install -Dm644 scyther.desktop ${pkgdir}/usr/share/applications/scyther.desktop
    install -Dm755 scyther ${pkgdir}/usr/bin/scyther
}
