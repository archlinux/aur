# Maintainer: Lukas Tobler <luk4s.tobler@gmail.com>

pkgname=scyther
pkgver=v1.1.3
pkgrel=2
pkgdesc="Tool for the symbolic analysis of security protocols"
arch=('x86_64')
depends=('python2' 'graphviz' 'wxpython')
url="https://www.cs.ox.ac.uk/people/cas.cremers/scyther/"
license=('GPL2')
source=(
    "http://www.cs.ox.ac.uk/people/cas.cremers/downloads/scyther/scyther-linux-${pkgver}.tgz"
    'scyther.desktop'
    'scyther'
)
sha256sums=('5829daf7252ca92ed40041bbdb0012c091d36f16855d802ed7a792f3f8dad6a6'
            'd3bc8366a76892d47252c517246310e76e8e14af7856fb85a89b7e1de1c9dc07'
            '1908f0474a2e546dbc52f2899a5ca665458a623e8c7dd6b5359eb5c1ae37921b')

package() {
    mkdir -p ${pkgdir}/usr/share/
    cp -dr --no-preserve=ownership ${srcdir}/${pkgname}-linux-${pkgver} ${pkgdir}/usr/share/${pkgname}
    install -Dm644 scyther.desktop ${pkgdir}/usr/share/applications/scyther.desktop
    install -Dm755 scyther ${pkgdir}/usr/bin/scyther
}
